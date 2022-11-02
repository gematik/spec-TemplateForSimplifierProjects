# Create the repository on GitHub
1. Request a new Repo by creating a [OSPO ticket](https://service.gematik.de/secure/CreateIssue!default.jspa)
    * Provide the [needed information](https://wiki.gematik.de/display/OSPO/GitHub+Berechtigungen#GitHubBerechtigungen-Anfordern) to the ticket
    * The name should correspond to "spec-[NameOfYourSimplifierProject]"
    * A new repository will be created for you which is based on the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects)
    
    <br/>

2. Your new repository is created
3. Add your repository to our [GitHub Projects page](https://wiki.gematik.de/display/QM/GitHub+Projects) and leave the needed details

    <br/>

# Configure the repository on GitHub
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



