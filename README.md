<img align="right" width="250" height="47" src="/Material/images/Gematik_Logo_Flag.svg"/> <br/> 


# About
This template standardizes the development of fhir resources with .fsh resources. It should reduce time for setup and ease the development process.

The following features are provided:

* Best practices for modeling fsh files [see /Resources/input/fsh folder](./Resources/input/fsh).
* Scripted creation and validation of fsh files and the generated fhir resources using a Hapi validator. See [usage page](./USAGE.md).
* Sorting of validation results by severity in subfolders.
* Validation of committed fsh files via github-action with different validators (hapi, simplifier).
# Installation

Here you can find the [installation instructions](INSTALL.md)

# Setup
You can browse through the [best practice files](./Resources/input/fsh) for some examples. Before you start specifying your own artifacts you have to
* configure [sushi-config.yaml](./Resources/sushi-config.yaml) with the dependencies that your project needs. These will be placed in the ~/.fhir/packages directory
* Set the current year in the LICENSE file (bottom of the page) AND the Readme_template.md

## Remove template files
Before you can start working within your project you need to delete the best-practise files. Feel free to review them before deletion. You can either run [setup.sh](./scripts/setup.sh)

```bash
chmod u+x ./scripts/setup.sh && ./scripts/setup.sh
```
or you can execute these steps manually:
* delete all files in [./Resources/input/fsh](./Resources/input/fsh)
* delete all files in [./Resources/fsh-generated/resources](./Resources/fsh-generated/resources)
* delete [downloaded_validation_script.sh](./scripts/downloaded_validation_script.sh)
* delete [install_fhir_tools.sh](./scripts/install_fhir_tools.sh) when you have already installed the FHIR Tools by using this script. Otherwise do not delete now.
* delete [this readme file](./README.md) and rename Readme_template.md with README.md

Finally you will need to
* Create or re-use the OSPO conform README which can be found in this repository [PROJECT_README.md](/PROJECT_README.md) too.
* populate the new/renamed README.md with information for your repository.

# Usage <a name = "usage"></a>
Information about using the preconfigured devontainer including sushi, hapi validator and the codfsh-Extension can be found in [usage page](./USAGE.md).

# Help

If you find issues with this template project, please leave an issue or create a Pull Request via  the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects).

## License
 
Copyright 2025 gematik GmbH
 
Licensed under the **Apache License, Version 2.0** (the "License"); you may not use this file except in compliance with the License.
 
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License.

## Additional Notes and Disclaimer from gematik GmbH

1. Copyright notice: Each published work result is accompanied by an explicit statement of the license conditions for use. These are regularly typical conditions in connection with open source or free software. Programs described/provided/linked here are free software, unless otherwise stated.
2. Permission notice: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    1. The copyright notice (Item 1) and the permission notice (Item 2) shall be included in all copies or substantial portions of the Software.
    2. The software is provided "as is" without warranty of any kind, either express or implied, including, but not limited to, the warranties of fitness for a particular purpose, merchantability, and/or non-infringement. The authors or copyright holders shall not be liable in any manner whatsoever for any damages or other claims arising from, out of or in connection with the software or the use or other dealings with the software, whether in an action of contract, tort, or otherwise.
    3. We take open source license compliance very seriously. We are always striving to achieve compliance at all times and to improve our processes. If you find any issues or have any suggestions or comments, or if you see any other ways in which we can improve, please reach out to: ospo@gematik.de
3. Please note: Parts of this code may have been generated using AI-supported technology. Please take this into account, especially when troubleshooting, for security analyses and possible adjustments.