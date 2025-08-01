# XCrySDen on docker
Docker that can execute the [xcrysden](http://www.xcrysden.org/XCrySDen.html) app for analysis of crystalline structures and densities. Click [here](https://hub.docker.com/repository/docker/teg57/xcrysden/general) to go to the Docker Hub. 

## Requirements
Have a X server on your local machine, e.g:
- [xming](https://sourceforge.net/projects/xming/)

## Installation
first download the image:
```bash
docker pull teg57/xcrysden:1.6.2
```

if you want to build the project locally:
```bash
docker build -t teg57/xcrysden:1.6.2 .
```

or build the min version:
```bash
docker build -f dockerfile-min -t teg57/xcrysden:1.6.2-min .
```

## Usage
### xcrysden
To run xcrysden, do:
```bash
docker run --rm -e DISPLAY=host.docker.internal:0.0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2
```

this will
- `docker run ... teg57/xcrysden`: start the docker file
- `--rm`: remove the container once you finished
- `-e DISPLAY=host.docker.internal:0.0`: export the host of you local machine to the docker to allow the container to find the X server IP.
- `-v "$env:USERPROFILE\Documents\xcrysden:/mnt/data"`: create a mount point to access the files of you local machine from the docker container. By default, it chooses `your_username\Documents\xcrysden`, but you can change this depending on your needs or operating system. e.g. `/home/teg57/Downloads:/mnt/data`, this will show all the files of Downloads on the /mnt/data of the docker. Important to access files.

Here is a little diagram that represents the comunication between the local PC and the docker container.

```
(Personal PC) teg57\Documents\xcrysden <---------> /mnt/data (Docker container)
```

### .cif to .xsf
Xcrysden cannot read .cif files like VESTA can, but you can convert it to a file that xcrysden can read, like .xsf. To do that, just add the flag `--convert` followed by the path of the file. Here is an example:

```bash
docker run --rm -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2 --convert /mnt/data/5000108.cif
```
note the following:
- the file is located on `teg57\Documents\xcrysden`, and because that path is linked to the docker container, you can and should access using /mnt/data.
- because we are not using xcrysden, it is not necesary to run the command with `-e DISPLAY=host.docker.internal:0.0` as before.

> [!WARNING]
> This only works if pulled the 1.6.2 version (not the min), because this contains all the features.

## Tags
### 1.6.2
Contains xcrysden as well as features like a python script to convert .cif to .xsf files.

### 1.6.2-min
The minimal version. Only contains xcrysden, nothing more.

```bash
docker run --rm -e DISPLAY=host.docker.internal:0.0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min
```

## Author
[@AlanSilvaaa](https://github.com/AlanSilvaaa/)
