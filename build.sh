#!/bin/sh

cd /code
CONDA_ENVS_PATH=$PWD/envs CONDA_BLD_PATH=$PWD/conda-bld conda build CONDA_PY=$CONDA_PY ./root$ROOT
retval=$?
if [ $retval -eq 0 ]; then
    echo "Uploading to main channel...."
    chown -R $MYUID .
    anaconda upload $PWD/conda-bld/*/root-$ROOT*.tar.bz2 --force
else
    echo "Building failed."
fi
