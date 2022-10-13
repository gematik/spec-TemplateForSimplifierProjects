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
./scripts/setup.sh
```


# Usage <a name = "usage"></a>
Information about using the validator can be found in [usage page](./USAGE.md).

# Help

If you find issues with this template project, please leave an issue or create a Pull Request via  the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects).
