A small convenience docker image for converting Markdown files to docx and syncing with a Google Drive folder for use in Matsuri Japon projects.

# Typical usage
Use this docker file in a CI config file and use the tools included in your build steps. A service account `credentials.json` file is needed to sync with Google Drive.

For instance, with CircleCI:

```yaml
version: 2
jobs:
  build:
    docker:
    - image: matsuri-japon/md2drive:latest
    working_directory: /work
    branches:
      only:
        - master
    steps:
    - checkout
    - run: echo ${GOOGLE_CREDS} | base64 --decode > /home/.gdrive/credentials.json
    - run: md2drive ${TARGET_FOLDER_ID}
```