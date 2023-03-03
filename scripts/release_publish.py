import re
import subprocess
import os
import argparse

class FileWithVersionToUpdate:
    def __init__(self, filename, version_regex) -> None:
        self.filename = filename
        self.version_regex = version_regex
        self.location = None

    def set_file_location(self, location):
        self.location = location


def get_new_release_version_from_branch_name() -> str:
    git_branch = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).strip().decode()
    return git_branch

def replace_version_in_files(files : list, new_release_version: str):
    if files is None:
        print("Error: No Files found!")
        return

    for file in files:
        replace_version_in_file(file,new_release_version)

def replace_version_in_file(file: FileWithVersionToUpdate,new_release_version: str):
    with open(file.location, 'r') as input_file:
        input_text = input_file.read()

    output_text = re.sub(file.version_regex, rf'\g<1>{new_release_version}\g<3>', input_text)
    print(f"Info: Replaced version with '{new_release_version}' in file '{file.location}'.")

    with open(file.location, 'w') as output_file:
        output_file.write(output_text)

def get_file_to_update_list():
    file_list = []
    file_list.append(FileWithVersionToUpdate('package.json', r'("version":\s*")([\d\.]+)(")'))
    file_list.append(FileWithVersionToUpdate('sushi-config.yaml', r'(version:\s*")(\d+\.\d+\.\d+)(")'))
    file_list.append(FileWithVersionToUpdate('ruleset.fsh', r'(\*\s*version\s*=\s*")([\d\.]+)(")'))
    return file_list


def locate_files_in_current_project(files: list):
    return_list = []
    for current_file in files:
        file_location = find_file(current_file.filename, ".")
        if file_location is not None:
            current_file.set_file_location(file_location)
            return_list.append(current_file)
        else:
            print(f"Warning: File '{current_file.filename}' not found.")
    return return_list

def find_file(name, path="."):
    for root, dirs, files in os.walk(path):

        if name in files:
            print(f"Info: Found '{name}' in {root}.")
            return os.path.join(root, name)
    return None

def get_latest_release_tag():
    cmd = 'git describe --abbrev=0 --tags --match "v*.*.*" HEAD'
    try:
        output = subprocess.check_output(cmd, shell=True)
        return output.decode().strip()
    except subprocess.CalledProcessError:
        return None

def output_commit_messages_since_last_release():
    latest_release_tag = get_latest_release_tag()
    if latest_release_tag is None:
        print("Warning: No release tag found.")
        return

    cmd = f'git log --pretty=format:"%s" {latest_release_tag}..HEAD'
    try:
        output = subprocess.check_output(cmd, shell=True)
        print(output.decode())
    except subprocess.CalledProcessError:
        print("Warning: Failed to get commit messages.")

def main():
    parser = argparse.ArgumentParser(description='Update release version number')
    parser.add_argument('-b', '--branch', action='store_true', help='get new version from branch name')
    parser.add_argument('-v', '--version', type=str, help='specify new version number')
    parser.add_argument('-o', '--output', action='store_true', help='output commit messages since last release')

    args = parser.parse_args()

    if args.version:
        new_release_version = args.version
    elif args.branch:
        new_release_version = get_new_release_version_from_branch_name()
    else:
        parser.error('No new release version specified. Please use either -v or -b to specify the new release version.')

    if args.output:
        output_commit_messages_since_last_release()

    file_to_update_list = get_file_to_update_list()
    file_list = locate_files_in_current_project(file_to_update_list)
    replace_version_in_files(file_list, new_release_version)

if __name__ == "__main__":
    main()