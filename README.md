# 42Hive-Github-Vogsphere-Actions

This action allows you to focus on setting up your work for a public repository on your personal Github page, and automate the submission process for vogsphere submission.

## Usage
In your current working repository, add a directory from the root of the repository: ./.github/workflows
```
mkdir -p .github/workflows
```
the `-p` option tells `mkdir` to create any intermediate directories as required.

Download the `main.yml` file into the directory `.github/workflows` you just created. 

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
`KNOWN_HOSTS` Lets Github know about all the remotely connected hosts for the ssh client to use. It contains the host public key for all known hosts, which allows your Github Actions server to communicate with the vogsphere server. To find your known hosts, enter the following command, and copy into the `KNOWN_HOSTS` value:
```
cat ~/.ssh/known_hosts
```
`SSH_PRIVATE_KEY` is your secret ssh key. To find this use the following command and copy the output into the `SSH_PRIVATE_KEY` value:
```
cat ~/.ssh/id_rsa
```
`USER_EMAIL` and `USER_NAME` are pretty simple, you should know them.

`VOGSPHERE_REPO` is the git repository link that you have on your project's intra page. NOTE: Should you fail a project, which you will, this value will need to be updated with the new git repository link. 
 
