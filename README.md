# Overview

This is an Apache2.4-based staging web server using docker compose that is similar to the CSE target environment to use for local offline PHP7 development.

The main features are:
 - Making the logs available external to the container to aid debugging (and dialing up the log level)
 - Making the apache config available outside of the container to tweak and experiment.
 - Mounting a local directory as `/home/someuser/public_html` to simulate the target environment.
 - Using suexec and binfmt for PHP cgi scripts.

## To Use

 1. Fill in the build arguments in `docker-compose.yml`
	 - `TARGET_USER=` the user name of `someuser` on the target system (CSE).
     - `TARGET_GROUP=` the group name with the `someuser` account on the target system (CSE).
     - `HOST_UID=` the local uid of your local account
     - `HOST_GID=` the local gid of your local account
 2. Place a copy of your website in `home/someuser/public_html` in the source tree.
 3. Build and run the container
```
docker-compose build
docker-compose up
```
 4. The website should appear at `localhost:8080`
