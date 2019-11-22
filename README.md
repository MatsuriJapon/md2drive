[![CircleCI](https://circleci.com/gh/MatsuriJapon/md2drive.svg?style=svg)](https://circleci.com/gh/MatsuriJapon/md2drive)

A small convenience docker image for converting Markdown files to PDF and syncing with a Google Drive folder for use in Matsuri Japon projects.

# Typical usage
Use this docker file in a CI config file and use the tools included in your build steps. A service account `credentials.json` file is needed to sync with Google Drive.

For instance, with CircleCI:

```yaml
version: 2
jobs:
  build:
    docker:
    - image: matsurijapon/md2drive:latest
    working_directory: /work
    branches:
      only:
        - master
    steps:
    - checkout
    - run: echo ${GOOGLE_CREDS} | base64 --decode > /root/.gdrive/credentials.json
    - run: md2drive ${TARGET_FOLDER_ID}
```

# Limitations
Due to limitations with `gdrive`, subfolders may not be supported.