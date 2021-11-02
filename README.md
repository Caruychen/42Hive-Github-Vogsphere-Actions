# 42Hive-Github-Vogsphere-Actions

This workflow pipeline allows you to focus on setting up your work to push to a personal Github Repository, and automate the submission process for vogsphere submission.

Why you say? Investing a bit of time to build a workflow pipeline at the start of your project allows you to be more efficient in the long run. 
Imagine that you want to showcase your work on a public repository to potential employers. You want to include a descriptive README file, the pdf of the project, test files, and have a well organised folder structure built to your liking. Doing this in parallel with the school projects at Hive, which has very strict requirements for what you can and cannot include in a project repository, means you'll need to work on 2 separate repositories.
Creating and working on 2 separate repositories for the same project is inefficient and tedious, especially since much of the work in both repositories overlap with each other. This also has the added complexity of making sure both repositories have the latest work. 
Therefore, the idea behind this is to allow you to set up your workflow such that you ONLY have to focus on one thing, building and pushing work for a personal Github repository. The rest (that is cloning, adding to, committing and pushing for the vogsphere repository) will be automated by the Github Actions, so you don't have to worry about it.

## Usage
In your current working repository, add a directory from the root of the repository: ./.github/workflows
```
mkdir -p .github/workflows
```
the `-p` option tells `mkdir` to create any intermediate directories as required.

Download the `main.yml` file into the directory `.github/workflows` you just created. 

Create a shell file `deploy_vogsphere.sh` in the root of the repository. This will contain your business logic of how you want to structure the repository for vogsphere submission. This will be explained in the section futher [down](#Setting-up-vogsphere-repo)

**DISCLAIMER**: This approach of using Github Actions to push work to the vogsphere is dependent on Hive Helsinki keeping remote working live. Should Hive decide that you can only work on campus, then we will need to find another solution.

### Setup keys for use in pushing to the vogsphere
For the Github actions workflows to work, you will need to set up the following secret variables in your github repository
1. `KNOWN_HOSTS`
2. `SSH_PRIVATE_KEY`
3. `USER_EMAIL`
4. `USER_NAME`
5. `VOGSPHERE_REPO`

#### How to set up the keys for secret variables
From your Github Repository in the Web browser, go to **Settings**, and find the **Secrets** section in the left sidebar. There you will be able to create and add secrets.
Github provides a useful and simple guide to setting up secrets [here](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository)

### Where to find the relevant values for the keys
1. `KNOWN_HOSTS` Lets Github know about all the remotely connected hosts for the ssh client to use. It contains the host public key for all known hosts, which allows your Github Actions server to communicate with the vogsphere server. To find your known hosts, enter the following command, and copy into the `KNOWN_HOSTS` value:
```
cat ~/.ssh/known_hosts
```
2. `SSH_PRIVATE_KEY` is your secret ssh key. To find this use the following command and copy the output into the `SSH_PRIVATE_KEY` value:
```
cat ~/.ssh/id_rsa
```
3. `USER_EMAIL` and `USER_NAME` are pretty simple, you should know them.

4. `VOGSPHERE_REPO` is the git repository link that you have on your project's intra page. NOTE: Should you fail a project, which you will, this value will need to be updated with the new git repository link. 
 
### Setting up vogsphere repo
