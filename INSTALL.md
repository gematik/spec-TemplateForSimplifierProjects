# Setup Repo
1. Request a new Repo by creating a (OSPO ticket)[https://service.gematik.de/secure/CreateIssue!default.jspa]
    * Provide the [needed information](https://wiki.gematik.de/display/OSPO/GitHub+Berechtigungen#GitHubBerechtigungen-Anfordern) to the ticket
    * The name should correspond to "spec-[NameOfYourSimplifierProject]"
    
    <br/>

2. Clone the FHIR-Template
    * Log into your GitHub Account
    * Navigate to the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects)
    * Click on "Use this template"
    * Select the newly created repository as your destination

    <br/>

3. Your new repository is created

    <br/>

# Configure repo
* Follow the instructions to create the first project via GitHub webpage 
* Settings > Actions > General > check 
    * "Allow all actions and reusable workflows" 
    * "Require approval for first-time contributers" 
    * "Read and write permissions" 
    * "Allow GitHub Actions to create and approve pull requests"
    * save!
* Settings > Secrets > Actions > create repository secrets > New repository secret
    * Name: SIMPLIFIER_USERNAME, Secret: *your simplifier username*
    * Name: SIMPLIFIER_PASSWORD, Secret: *your simplifier password* 
* Settings > Branches > Branch protection rule > Add rule > check 
    * "Require a pull request before merging" 
    * "Require approvals" 
    * "Require status checks to pass before merging" 
    * "Require branches to be up to date before merging"  
    * save 

Now you can clone your repo to your local machine.
    
<br/>

# Install FHIR tools
The following script installs all necessary tools for specifying fhir resources onto your local machine.

```bash
./scripts/install_fhir_tools.sh
```
(requires admin)

