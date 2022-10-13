# ${fhir_name} FHIR-Profiles

${fhir_profiles_description}

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)

## About <a name = "about"></a>

This Repo contains the fsh files to the published ${fhir_name} files on <https://simplifier.net/${simplifier_repo}> and a script to validate them.

## Getting Started <a name = "getting_started"></a>

1. Clone this project to your local machine.
2. Run the install script once.
3. Work on teh FHIR Profiles build and validate them with the given script.

### Installing

To install the necessary tools run

```bash
sudo ./install_fhir_tools.sh
```

This will install

- Java SDK 17 JRE
- Sushi from <https://github.com/FHIR/sushi>
- dotnet-sdk-3.1
- firely.terminal
- yq yaml-parser

After successfull installation run:

```bash
./validate.sh -is
```
See `../validation_results/` for results.