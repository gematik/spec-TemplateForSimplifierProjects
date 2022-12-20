

import os
import json
import shutil
transition_directory="transitionfiles"
files = os.listdir(transition_directory)
validator_path = "/home/dev/.fhir/validators/validator_cli_v5_6_89-SNAPSHOT-at2.jar"

def create_folder(fname):
     if not os.path.exists(fname):
        print("[INFO] Creating folder {0}".format(fname))
        os.makedirs(fname)

# Loop to print each filename separately
for filename in files:
    print("[INFO] Reading file '{0}'".format(filename) )
    with open(os.path.join(transition_directory,filename)) as f:
        json_data = json.load(f)
        print("[INFO] Processing File for {0} in Version {1}" .format(json_data['meta']['content']['name'], json_data['meta']['content']['version']))
        #for dependency in json_data['dependencies']:
        #    os.system("fhir install {0} {1} --here".format(dependency['package']['name'],dependency['package']['version'] ))
        for transition in json_data['transitions']:
            try:
                left = transition['transition'][0]['ressource']
                right = transition['transition'][1]['ressource']
                print("[INFO] Comparing file {0} v{1} with file {2} v{3}...".format(left['name'],left['version'],right['name'],right['version']))
                destination_from = "./compare_results/{0}/movedAfter_v{1}__to__{2}_v{3}/{4}".format(left['package'],left['version'],right['package'],right['version'],right['name'])
                destination_to = "./compare_results/{0}/addedTo_v{1}__from__{2}_v{3}/{4}".format(right['package'],right['version'],left['package'],left['version'],left['name'])
                packages = "-ig ./dependencies/{0}#{1}/package -ig ./dependencies/{2}#{3}/package ".format(left['package'],left['version'],right['package'],right['version'])
                left_string = "{0}|{1}".format(left['url'],left['version'])
                right_string = "{0}|{1}".format(right['url'],right['version'])

                executestring_from = "java -jar {0} -compare -tx n/a -proxy 192.168.110.10:3128 -dest \"{1}\" -version 4.0.1 {2} -left \"{3}\" -right \"{4}\"".format(validator_path, destination_from, packages,left_string,right_string)
                executestring_to = "java -jar {0} -compare -tx n/a -proxy 192.168.110.10:3128 -dest \"{1}\" -version 4.0.1 {2} -left \"{3}\" -right \"{4}\"".format(validator_path, destination_to, packages,left_string,right_string)

                create_folder(destination_from+"/script")
                f = open(os.path.join(destination_from+ "/script/" +"execute_script.sh"),"w")
                f.writelines("#!/bin/bash\n")
                f.writelines(executestring_from +"\n")
                f.close()
                create_folder(destination_to+"/script")
                f = open(os.path.join(destination_to+"/script/"+ "execute_script.sh"),"w")
                f.writelines("#!/bin/bash\n")
                f.writelines(executestring_to +"\n")
                f.close()
                if not os.path.isfile(destination_from+"/index.html" ):
                    os.system(executestring_from)
                    shutil.copytree(destination_from, destination_to,dirs_exist_ok=True)
                    # os.system(executestring_to)
                else:
                    print("[INFO] index.html file found. Skipping")
            except KeyboardInterrupt:
                print('interrupted!')
                break
