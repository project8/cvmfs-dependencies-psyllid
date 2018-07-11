# setting dependencies and dep-psyllid build name
export P8DEPBUILD=build-2018-04-23
export P8DEPPSYLLIDBUILD=build-2018-07-99

# source the common dependencies 
source /cvmfs/hep.pnnl.gov/project8/dependencies-common/${P8DEPBUILD}/setup.sh

export P8DEPPSYLLIDBASEDIR=${P8BASEDIR}/dependencies-psyllid/${P8DEPPSYLLIDBUILD}

export PATH=${P8DEPPSYLLIDBASEDIR}/bin:${PATH}
export INCLUDE_PATH=${P8DEPPSYLLIDBASEDIR}/include:${INCLUDE_PATH}
export LIBRARY_PATH=${P8DEPPSYLLIDBASEDIR}/lib:${LIBRARY_PATH}
export LIBRARY_PATH=${P8DEPPSYLLIDBASEDIR}/lib64:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8DEPPSYLLIDBASEDIR}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8DEPPSYLLIDBASEDIR}/lib64:${LIBRARY_PATH}

export LIBDIR=${LD_LIBRARY_PATH}:${LIBDIR}


export MANPATH=${P8DEPPSYLLIDBASEDIR}/share/man/man1:${MANPATH}
export PKG_CONFIG_PATH=${P8DEPPSYLLIDBASEDIR}/lib/pkgconfig:${PKG_CONFIG_PATH}

export PYTHONPATH=${P8DEPPSYLLIDBASEDIR}/lib/root:${P8DEPPSYLLIDBASEDIR}/lib:${P8DEPPSYLLIDBASEDIR}:${PYTHONPATH}
export XDG_DATA_DIRS=${P8DEPPSYLLIDBASEDIR}/share:${XDG_DATA_DIRS}
