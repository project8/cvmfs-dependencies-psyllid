# Project 8 CVMFS Psyllid Dependencies

This repository can be used in two ways:

1. To install on the actual CVMFS system, use the `run-cvmfs-install.sh` script
1. To use the docker mockup CVMFS system, use the Dockerfile

When updating the dependencies build on GitHub, please make sure that both the build date in `setup.sh` is updated.  When a new official build is ready, tag it with the build name (the same as the build directory)

## Information

This repository provides the dependencies for the Psyllid software installations on the CVMFS system used on the PNNL HEP cluster.

It's based on the cvmfs-dependencies-common image (https://hub.docker.com/project8/cvmfs-dependencies-common).

Project 8 software is installed in the `/cvmfs/hep.pnnl.gov/project8` directory.  From there, installed dependencies go in the `dependencies-psyllid` subdirectory.  For any images based on this image, their software should go in their own directories to avoid issues with directory names that change as builds are updated.  For example:

```
/cvmfs/hep.pnnl.gov/project8
   |
   +- dependencies-psyllid
   |     |
   |     +- build-[DATE]
   |           |
   |           +- bin, lib, include, . . .
   |
   +- psyllid
   . . .
```

This repo can either be used to build a Docker image using the included Dockerfile, or installed directly in the actual CVMFS system by running the `run-cvmfs-install.sh` script.  Instructions for both builds are below.

Cleanup of the source directory is performed by the cleanup.sh script, which is run from the Dockerfile so that it is not automatically run when doing an install on the actual CVMFS system.  It can, of course, be run manually on that system if so desired.

## Scripts

* download_pkg.sh: Downloads dependency source packages and unpacks.
* install.sh: Builds dependencies from source.
* run-cvmfs-install.sh: Builds and installs everything given a proper environment (either the real CVMFS environment or the one provided by the Docker base image)
* setup.sh: Sets up the necessary environment variables both for installing software and using the software.

## Installing on the actual CVMFS system

1. Clone the `cmvfs-dependencies-psyllid` repo
1. Make sure the dependency-psyllid build version in `setup.sh` (variable `P8DEPPSYLLIDBUILD`) is set correctly
1. Execute `run-cvmfs-install.sh`

## Using the Docker mockup of the CVMFS system

1. Clone the `cmvfs-dependencies-psyllid`` repo
1. Make sure the dependency-psyllid build version in `setup.sh` (variable `P8DEPPSYLLIDBUILD`) is set correctly
1. Execute `docker build -t project8/cvmfs-dependencies-psyllid .`

### Updating a dependency

Your situation: There's a new version of a dependency (e.g. boost) out that we need to use for one of our packages.  Here's how to update this image with the new dependency information and rebuild the container.

1. Update the URL with the new dependency version in dependency_urls.txt
1. Update the corresponding file and directory names in download_pkg.sh
1. Update the build date in setup.sh (environment variable `P8DEPPSYLLIDBUILD`)
1. Test the build locally
1. If the build works, push the changes to the CVMFS-dependencies repo
1. On the Docker Hub page for the `project8/cvmfs-dependencies-psyllid` image, go to Build Settings
1. Update the date in the Docker Tag Name column of the second container build
1. Trigger a rebuild of both containers (`latest` and `build-[date]`)
1. If the rebuild works, and the rebuild of anything that depends on this image works, notify the DIRAC team of the changes that need to be pushed to CVMFS, providing them with the appropriate tag name
1. Proceed with updating any downstream images that use the `cvmfs-dependencies-psyllid` image
