#!/bin/bash
clear
# This script will download the latest validation script from the template source save it
# to the scripts_folder and execute it to validate your fhir ressources.
script_name=./scripts/validate_script.sh

parentdir="$(dirname "$script_name")"
mkdir -p "$parentdir"

curl https://raw.githubusercontent.com/gematik/spec-TemplateForSimplifierProjects/master/scripts/validate_script.sh -o $script_name
chmod a+x $script_name
$script_name
