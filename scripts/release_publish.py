# replace_version in files
    # Retrieve the current git branch name
    # Save version pattern from branch name to new_version
    # for each file in checklist (e.g. sushi-config.yaml) find old_version and replace with new_version - see checklist https://wiki.gematik.de/display/PTDATA/%28TEMPLATE%29+Release+Checkliste
        # """      files:
        # package.json
        # sushi-config.yaml
        # ISIk Basis anpassen (Warnung) TODO: Gibt es hier eine Datei?
        # RuleSet (s.u.) TODO: Einheitliche Bennenung der RuleSet-Datei?
        # IG. Einführung """ TODO: Gibt es eine Versionierung des IG

import re
import subprocess
import os

class FileWithVersionToUpdate:
    def __init__(self, filename, version_regex) -> None:
        self.filename = filename
        self.version_regex = version_regex
        self.location = None

    def set_file_location(self, location):
        self.location = location


def get_new_release_version_number() -> str:
    # Retrieve the current git branch name
    git_branch = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).strip().decode()
    return git_branch

def replace_version_in_files(files : list, new_release_version: str):
    if files is None:
        print("Error: No Files found!")
        return

    for file in files:
        replace_version_in_file(file,new_release_version)

def replace_version_in_file(file: FileWithVersionToUpdate,new_release_version: str):
    # Define the replacement string with the current git branch name
    replacement = f'version: {new_release_version}'

    # Open the input file and read its contents
    with open(file.location, 'r') as input_file:
        input_text = input_file.read()

    # Use regex to search and replace all occurrences of the version string
    output_text = re.sub(file.version_regex, replacement, input_text)
    print(f"Info: Replaced version with '{replacement}' in file '{file.location}'.")

    # Write the modified contents to the same file
    with open(file.location, 'w') as output_file:
        output_file.write(output_text)

def get_file_to_update_list():
    file_list = []
    file_list.append(FileWithVersionToUpdate('package.json',"version\s*:\s*\d+\.\d+\.\d+"))
    file_list.append(FileWithVersionToUpdate('sushi-config.yaml',"version\s*:\s*\d+\.\d+\.\d+"))
    file_list.append(FileWithVersionToUpdate('ruleset.fsh',"version\s*:\s*\d+\.\d+\.\d+"))
    file_list.append(FileWithVersionToUpdate('package.json',"version\s*:\s*\d+\.\d+\.\d+"))
    return file_list

def locate_files_in_current_project(files: list):
    for current_file in files:

        file_location = find_file(current_file.filename, "..")
        if file_location is not None:
            current_file.set_file_location(file_location)
        else:
            print(f"Warning: File '{current_file.filename}' not found.")

def find_file(name, path="."):
    for root, dirs, files in os.walk(path):

        if name in files:
            print(f"Info: Searching for '{name}' in {root}.")
            return os.path.join(root, name)
    return None

def main():
    file_to_update_list = get_file_to_update_list()
    file_list = locate_files_in_current_project(file_to_update_list)
    new_release_version = get_new_release_version_number()
    replace_version_in_files(file_list, new_release_version)

if __name__ == "__main__":
    main()