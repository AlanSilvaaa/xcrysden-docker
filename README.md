# XCrySDen on docker
Docker that can execute the [xcrysden](http://www.xcrysden.org/XCrySDen.html) app for analysis of crystalline structures and densities

## Requirements
Have a X server on your local machine, e.g:
- [xming](https://sourceforge.net/projects/xming/)

## Installation
first download the image:
```bash
docker pull teg57/xcrysden:1.6.2
```

then to run it:
```bash
docker run --rm -e DISPLAY=host.docker.internal:0.0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2
```

this will
- `docker run ... teg57/xcrysden`: start the docker file
- `--rm`: remove the container once you finished
- `-e DISPLAY=host.docker.internal:0.0`: export the host of you local machine to the docker to allow the container to find the X server IP.
- `-v "$env:USERPROFILE\Documents\xcrysden:/mnt/data"`: create a mount point to access the files of you local machine from the docker container. By default, it chooses `your_username\Documents\xcrysden`, but you can change this depending on your needs or operating system. e.g. `/home/teg57/Downloads:/mnt/data`, this will show all the files of Downloads on the /mnt/data of the docker. Important to access files.


|  |  |  |  |  |
| :---------------- | :------: | ----: | :------: | :------: |
| Personal PC | teg57\Documents\xcrysden | <---------> | /mnt/data | Docker container |

