# 42Hive Setting up a Github to Vogsphere Pipeline

This workflow pipeline allows you to focus on setting up your work to push to a personal Github Repository, and automate the process for vogsphere submission.

Why you say? Investing a bit of time to build a pipeline at the start of your project allows you to be more efficient in the long run. 

Imagine that you want to showcase your work on a public repository to potential employers. You want to include a descriptive README file, the pdf of the project, test files, and have a well organised folder structure built to your liking. Doing this in parallel with the school projects at Hive, which has very strict requirements for what you can and cannot include in a project repository, means you'll need to work on 2 separate repositories.

Creating and working on 2 separate repositories for the same project is inefficient and tedious. Much of the work in both repositories overlap with each other, but you might structure the folders differently, and include some extra test files and READMEs in the Github repository. This also has the added complexity of making sure both repositories have the latest work. 

Therefore, the idea behind this is to allow you to set up your workflow such that you **ONLY** have to focus on one thing: building and pushing work for a personal Github repository. The rest (that is cloning, adding to, committing and pushing to the vogsphere repository) will be automated by Github Actions, so you don't have to worry about it.

I recommend taking the time to learn about [Github Actions](https://docs.github.com/en/actions). It is an extraordinatily useful tool for automating developer workflows. Github Actions is one example of a technology that forms a significant component of CI/CD (Continuous integration / Continuous Deployment) which is integral to all software development projects these days. Knowing about these concepts will make you much more attractive to employers, there is a fantastic course component on CI/CD from the [Full Stack Open Course](https://fullstackopen.com/en/part11/introduction_to_ci_cd) by Helsinki University. Please do take the time to check it out, you will find it very instructive!

## Usage
1. First, start off by initialising your own Github repository on Github, and clone it on your own computer.
2. In your current working repository, add a directory from the root of the repository: ./.github/workflows
```
mkdir -p .github/workflows
```
the `-p` option tells `mkdir` to create any intermediate directories as required.

3. Download the `main.yml` file into the directory `.github/workflows` you just created. 

4. Create a shell file `deploy_vogsphere.sh` in the root of the repository. This will contain your business logic of how you want to structure the repository for vogsphere submission. This will be explained in the section futher [down](#Setting-up-vogsphere-repo)

5. Once you are set up, you can get to work adding files, committing to, and pushing to your own Github repository. The rest will all be taken care of. **NOTE**: When pushing to your repository, the pipeline action happens automatically everytime you push. If you want to avoid pushing to the vogsphere, then include the string: \[skip ci\] including the brackets, in the commit message. This will cause it to skip the vogsphere submission step.

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
The `deploy_vogsphere.sh` is a shell script in which you will write the logic for how you want to allocate files from your Github repository, into the vogsphere repository. 

It should be fairly simple, and you won't need to add anything complicated. The process is simply copying using the `cp` command from the working github repository (which is the name you gave your repository) into the vogsphere repository (which starts with intra-uuid-\*).

It is totally up to you, it will depend on how you've structured your own repository, and what is expected for the project's vogsphere repository. You can check out the example shown in this repo's [shell script](https://github.com/Caruychen/42Hive-Github-Vogsphere-Actions/blob/main/deploy_vogsphere.sh)

This example is based on my [Libft github repository](https://github.com/Caruychen/42Hive-Libft).
