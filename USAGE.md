## Usage <a name = "usage"></a>

### Installing FHIR tools on your local machine
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

# Help

If you find issues with this template project, please leave an issue or create a Pull Request via  the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects).