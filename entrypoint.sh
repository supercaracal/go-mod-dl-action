#!/bin/sh

readonly URL=$1

if [ -z ${URL} ]; then
  echo "`url` input parameter required."
  exit 1
fi

wget -q ${URL}

readonly FILENAME=${URL##*/}

if [ "${URL%.tar.gz}" != "${URL}" ]; then
  tar zxf ${FILENAME}
elif [ "${URL%.zip}" != "${URL}" ]; then
  unzip ${FILENAME}
else
  echo "Unkown file extension."
  exit 1
fi

readonly WORKDIR="/github/${GITHUB_WORKSPACE}"
readonly DIRNAME=${FILENAME%%.*}
readonly MODNAME=${DIRNAME%%_*}

mv ${DIRNAME}/${MODNAME} ${WORKDIR}/

echo "::set-output name=file::${GITHUB_WORKSPACE}/${MODNAME}"
