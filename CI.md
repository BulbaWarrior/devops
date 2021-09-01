# Github actions
## Best practices
1. Keep your Actions minimal
2. Don’t install dependencies unnecessarily
3. Never hardcode secrets
4. Limit environment variables to the narrowest possible scope
5. Ensure every repository contains a CI/CD workflow
6. Store authors in Action metadata to promote code ownership
7. Don’t use self-hosted runners in a public repository

There are two workflows in the repository
## ci.yaml
The workflow is triggered on pushes to master and cicd/gh_actions (the letter was used for testing the workflow) as well as pull requests.
If the workflow is triggered by a pull request, only `lint and test` job is run. An additional `build` job is run on pushes.
* The code and linted and tested first
* If the lint and test job finishes without errors, a new docker image is built and pushed to docker hub

#### Features
* Caches are created and shared between workflow runs
* A problem matcher is used to detect linter error and highlight them to programmers
<img width="1221" alt="Screenshot 2021-09-01 at 20 51 40" src="https://user-images.githubusercontent.com/42455524/131719657-5129e8b4-713d-487c-ae2d-ac942b42b173.png">

## release.yaml
A simple workflow that creates a github release and generates a commit link when a new tag is pushed - this simplifies the submission to moodle process

# Jenkins
## Best practices
1. Keep Jenkins Secure At All Times
2. Always Backup The “JENKINS_HOME” Directory
3. Setup A Different Job/Project For Each Maintenance Or Development Branch Created
4. Prevent Resource Collisions In Jobs That Are Running In Parallel
5. Use “File Fingerprinting” To Manage Dependencies
6. Avoid Complicated Groovy Codesode In Pipelines
