<img align="right" width="200" height="37" src="Gematik_Logo_Flag.png"/> <br/>
  
# ${fhir_name} FHIR-Profiles

 ${fhir_profiles_description}
 
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
       <ul>
        <li><a href="#release-notes">Release Notes</a></li>
      </ul>     
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


## About The Project  
This Repo contains the fsh files to the published \${fhir_name} files on <https://simplifier.net/${simplifier_repo}> and a script to validate them.
 
### Release Notes
See [ReleaseNotes.md](./ReleaseNotes.md) for all information regarding the (newest) releases.
  
### Prerequisites
Clone this project to your local machine.

 
## Installation
To set up a development environment with support for FHIR profile compilation and validation:

1. Ensure you have [Docker](https://www.docker.com/products/docker-desktop) installed on your machine.
2. Clone the repository and open it in [Visual Studio Code](https://code.visualstudio.com/).
3. When prompted, reopen the project in a container. This will build the Docker container based on the provided `Dockerfile`.
4. The container includes:
   - [Firely Terminal](https://fire.ly/products/firely-terminal/) for FHIR operations.
   - [SUSHI](https://fshschool.org/docs/sushi/) for compiling FHIR Shorthand (FSH) files.
   - [HAPI FHIR Validator](https://github.com/hapifhir/hapi-fhir/releases) for validating FHIR profiles.
5. The [`codfsh` VS Code extension](https://marketplace.visualstudio.com/items?itemName=gematikde.codfsh) is also installed in the container for an enhanced FHIR profile development experience.
6. Once the container is built and running, you can use the integrated terminal in VS Code to run SUSHI and the HAPI FHIR Validator.

Note: The `codfsh` extension settings are pre-configured in the [`.devcontainer/devcontainer.json`](https://code.visualstudio.com/docs/devcontainers/containers) file to use the correct paths for the HAPI Validator and its configuration.
 
## Contributing
If you want to contribute, please check our [CONTRIBUTING.md](./CONTRIBUTING.md).
 
## License
 
Copyright [yyyy] gematik GmbH
 
Licensed under the **Apache License, Version 2.0** (the "License"); you may not use this file except in compliance with the License.
 
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License.

## Additional Notes and Disclaimer from gematik GmbH

1. Copyright notice: Each published work result is accompanied by an explicit statement of the license conditions for use. These are regularly typical conditions in connection with open source or free software. Programs described/provided/linked here are free software, unless otherwise stated.
2. Permission notice: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    1. The copyright notice (Item 1) and the permission notice (Item 2) shall be included in all copies or substantial portions of the Software.
    2. The software is provided "as is" without warranty of any kind, either express or implied, including, but not limited to, the warranties of fitness for a particular purpose, merchantability, and/or non-infringement. The authors or copyright holders shall not be liable in any manner whatsoever for any damages or other claims arising from, out of or in connection with the software or the use or other dealings with the software, whether in an action of contract, tort, or otherwise.
    3. We take open source license compliance very seriously. We are always striving to achieve compliance at all times and to improve our processes. If you find any issues or have any suggestions or comments, or if you see any other ways in which we can improve, please reach out to: ospo@gematik.de
3. Please note: Parts of this code may have been generated using AI-supported technology. Please take this into account, especially when troubleshooting, for security analyses and possible adjustments.
 
## Contact
<!-- add your own text here -->