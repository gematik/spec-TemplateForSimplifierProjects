1. Create GitHub Repsitory
2. Follow the instructions to create the first project via GitHub webpage
3. Settings > Actions > check "Allow all actions and reusable workflows" + "Require approval for first-time contributers" + "Read and write permissions" + "Allow GitHub Actions to create and approve pull requests" > save ;)
4. Settings > Secrets > create repository secrets > "SIMPLIFIER_PASSWORD" + "SIMPLIFIER_USERNAME" + values
5. Settings > Brances > Branch protection rule > Add rule > check "Require a pull request before merging" + "Require approvals" + "Require status checks to pass before merging" + "Require branches to be up to date before merging"  > save ;)