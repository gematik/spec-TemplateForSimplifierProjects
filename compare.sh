#!/bin/bash
clear

script_name=downloaded_comparison_script.sh
script_path=./scripts/$script_name

parentdir="$(dirname "$script_path")"
mkdir -p "$parentdir"

# curl https://raw.githubusercontent.com/gematik/spec-TemplateForSimplifierProjects/master/scripts/$script_name -o $script_path
chmod a+x $script_path
$script_path "$@"
