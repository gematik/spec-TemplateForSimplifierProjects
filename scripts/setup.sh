#!/bin/bash
rm ./Resources/input/fsh/*
rm ./Resources/fsh-generated/resources/*
rm ./README.md
cat Readme_template.md USAGE.md > ./README.md
rm ./scripts/setup.sh