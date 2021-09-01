# Github actions
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
