#!/bin/bash

script_name=./scripts/validate_new.sh

curl https://raw.githubusercontent.com/gematik/spec-TemplateForSimplifierProjects/scripts/scripts/validate.sh?token=GHSAT0AAAAAABVZLGHBZL7VVRGSMJP4CVOQYZUGQFA -o $script_name
chmod a+x $script_name
$script_name
