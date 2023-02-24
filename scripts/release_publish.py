# replace_version in files
    # Retrieve the current git branch name
    # Save version pattern from branch name to new_version
    # for each file in checklist (e.g. sushi-config.yaml) find old_version and replace with new_version - see checklist https://wiki.gematik.de/display/PTDATA/%28TEMPLATE%29+Release+Checkliste
        # """      files:
        # package.json
        # sushi-config,yaml
        # ISIk Basis anpassen (Warnung)
        # RuleSet (s.u.)
        # IG. Einführung """

import re
import subprocess

# Retrieve the current git branch name
git_branch = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).strip().decode()

# Define the regex pattern to match the version string
super_pattern = r'version\s*:\s*\d+\.\d+\.\d+'
#TODO pattern equals substring without "version"
#TODO define pattern_sushi_config =

# Define the replacement string with the current git branch name
replacement = f'version: {git_branch}'

# Open the input file and read its contents
with open('test.txt', 'r') as input_file:
    input_text = input_file.read()

# Use regex to search and replace all occurrences of the version string
output_text = re.sub(pattern, replacement, input_text)

# Write the modified contents to the same file
with open('test.txt', 'w') as output_file:
    output_file.write(output_text)