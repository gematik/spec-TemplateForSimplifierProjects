# About
This template standardizes the development of fhir resources with .fsh resources. It should reduce time for setup and ease the development process.

The following features are provided:

* Best practices for modeling fsh files [see /Resources/input/fsh folder](./Resources/input/fsh).
* Scripted creation and validation of fsh files and the generated fhir resources using a Hapi validator.
* Sorting of validation results by severity in subfolders.
* Validation of committed fsh files via github-action with different validators (hapi, simplifier).
# Installation

Here you can find the [installation instructions](INSTALL.md)

# Setup
You can browse through the [best practice files](./Resources/input/fsh) for some examples. Before you start specifying your own artifacts you should
* configure [sushi-config.yaml](./Resources/sushi-config.yaml) with the dependencies that your project needs. These will be placed in the ~/.fhir/packages directory
* delete all files in [./Resources/input/fsh](./Resources/input/fsh)
* delete all files in [./Resources/fsh-generated/resources](./Resources/fsh-generated/resources)
* delete [downloaded_validation_script.sh](./scripts/downloaded_validation_script.sh)
* delete [install_fhir_tools.sh](./scripts/install_fhir_tools.sh)
* delete [this readme file](./README.md) and rename Readme_template.md with README.md
* populate the new README.md with information for your repository

You can run [setup.sh](./scripts/setup.sh) or run these commands manually from the root of your repository and then adapt the README.md

```bash
rm ./Resources/input/fsh/*
rm ./Resources/fsh-generated/resources/*
rm ./scripts/downloaded_validation_script.sh
rm ./scripts/install_fhir_tools.sh
rm ./README.md
mv ./Readme_template ./README.md
rm ./scripts/setup.sh
```


# Usage <a name = "usage"></a>

Run script `validate.sh` to

1. Run sushi FHIR Files generator
2. Validate all files in the `./Resources` folder
3. Get a html output file for each FHIR file in `../val_out/<current_directory_name>`

You can use following script options

### Install dependencies from sushi-config.yaml

`-i` installs dependencies with firely.terminal from `./<foldername>/sushi-config.yaml` file

```bash
./validate.sh -i
```

### Sort resulting html files into severity folders

`-s` sorts resulting html files in folders by the severities of the findings.
Categories are: `error`, `warning`, `information` and `unknown`

```bash
./validate.sh -s
```

### Change default folder

`-d foldername` sets foldername for validation. Default is: `./Resources`

```bash
validate.sh -d ./Testresources
```

### Process single file

`-f filename` sets filename for single validation.

```bash
validate.sh -f ./Resources/fsh-generated/resources/myProfile.json
```

### Work with specific version of Hapi Validator

`-v version` defines a version od the used Hapi Validator. If the specified version of the hapi validator is not present the default will be used. Validator-JARs will be downloaded to ~/.fhir/validators/.

```bash
validate.sh -v 5.6.70
```

# Help

If you find issues with this template project, please leave an issue or create a Pull Request via  the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects).