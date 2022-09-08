#Installation
1. Request a new Repo by creating a (OSPO ticket)[https://service.gematik.de/secure/CreateIssue!default.jspa]
* Provide the [needed information](https://wiki.gematik.de/display/OSPO/GitHub+Berechtigungen#GitHubBerechtigungen-Anfordern) to the ticket
* The name should correspond to "spec-[NameOfYourSimplifierProject]"
2. Clone this Template-Repository
3. Copy the scripts folder to your new repository
#Setup and configure
* Follow the instructions to create the first project via GitHub webpage 
* Settings > Actions > check "Allow all actions and reusable workflows" + "Require approval for first-time contributers" + "Read and write permissions" + "Allow GitHub Actions to create and approve pull requests" > save ;)
* Settings > Secrets > create repository secrets > "SIMPLIFIER_PASSWORD" + "SIMPLIFIER_USERNAME" + values 
* Settings > Brances > Branch protection rule > Add rule > check "Require a pull request before merging" + "Require approvals" + "Require status checks to pass before merging" + "Require branches to be up to date before merging"  > save ;)