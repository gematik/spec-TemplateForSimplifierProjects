#!/bin/bash
rm ./Resources/input/fsh/*.fsh
rm ./Resources/fsh-generated/resources/*
rm ./Material/docs/*
rm ./Material/docs/imgsrc/drawio/*
rm ./Material/docs/imgsrc/plantuml/*
rm ./ImplementationGuide/diagrams/*
rm ./README.md
cat Readme_template.md USAGE.md > ./README.md
rm Readme_template.md
rm USAGE.md
rm INSTALL.md
rm ./scripts/setup.sh
