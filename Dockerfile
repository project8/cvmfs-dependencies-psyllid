FROM project8/cvmfs-dependencies-common:build-2018-04-23

RUN mkdir -p /tmp_install

COPY ./setup.sh /tmp_install/setup.sh
COPY ./dependency_urls.txt /tmp_install/dependency_urls.txt
COPY ./download_pkg.sh /tmp_install/download_pkg.sh
COPY ./install.sh /tmp_install/install.sh
COPY ./run-cvmfs-install.sh /tmp_install/run-cvmfs-install.sh
COPY ./cleanup.sh /tmp_install/cleanup.sh

RUN cd /tmp_install && \
    ls && \
    source /opt/rh/devtoolset-3/enable && \
    echo "build dir is: ${P8DEPPSYLLIDBASEDIR}" &&\
    . /tmp_install/run-cvmfs-install.sh && \
    echo "build dir is: ${P8DEPPSYLLIDBASEDIR}" &&\
    /tmp_install/cleanup.sh && \
    echo "build dir is: ${P8DEPPSYLLIDBASEDIR}" &&\
    rm -rf /tmp_install && \
    /bin/true
