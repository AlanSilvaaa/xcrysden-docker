# XCrySDen on docker
THe objective of this project is to make a docker image that can run xcrysden without the need of installing it on your local machine.

## Requirements
- Make every tag multi-architecture, so it can run on amd64 and arm64.
- Each tag must have a README.md explaining how to use it.
- Each tag's readme must have at least the following sections:
  - Description of the tag
  - Instructions to pull and run the image from dockerhub for each architecture
  - Instructions to build and run the image locally for each architecture

## Project structure
This project is separated in different tags, to see the tags, go to the `tags` folder. Each tag has its own folder with the name of the tag, and inside it, a `README.md` explaining how to use it, as well as the dockerfile and any other file needed. If the tag needs to have different dockerfiles for different architectures, the dockerfiles will be named `dockerfile-amd` and `dockerfile-arm`.

This is an example of the project structure:
```
/
binary
└─ xcrysden-arm64.tar.gz
tags
├─ min
│  ├─ dockerfile-amd
│  ├─ dockerfile-arm
│  └─ README.md
└─ web
   ├─ dockerfile-amd
   ├─ dockerfile-arm
   ├─ README.md
   └─ start_xcrysden_web.sh
.gitignore
README.md
```