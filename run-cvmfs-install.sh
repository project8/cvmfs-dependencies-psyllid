#!/bin/bash

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# call the setup script to establish all necessary environment variables
source ${SCRIPT_DIR}/setup.sh

# make the dependencies build directory
mkdir -p ${P8DEPPSYLLIDBASEDIR}

# copy in the necessary scripts
cp ${SCRIPT_DIR}/setup.sh ${P8DEPPSYLLIDBASEDIR}/setup.sh
cp ${SCRIPT_DIR}/dependency_urls.txt ${P8DEPPSYLLIDBASEDIR}/dependency_urls.txt
cp ${SCRIPT_DIR}/download_pkg.sh ${P8DEPPSYLLIDBASEDIR}/download_pkg.sh
cp ${SCRIPT_DIR}/install.sh ${P8DEPPSYLLIDBASEDIR}/install.sh

# run the download and install scripts
${P8DEPPSYLLIDBASEDIR}/download_pkg.sh
${P8DEPPSYLLIDBASEDIR}/install.sh
