#!/bin/sh

set -eu

readonly URL=$1
readonly FILENAME=${URL##*/}
readonly MODNAME=${FILENAME%%_*}

wget -q ${URL}

if [ "${URL%.tar.gz}" != "${URL}" ]; then
  tar zxf ${FILENAME}
  readonly DIRNAME=${FILENAME%.tar.gz}
elif [ "${URL%.zip}" != "${URL}" ]; then
  unzip ${FILENAME}
  readonly DIRNAME=${FILENAME%.zip}
else
  echo "Unkown file extension."
  exit 1
fi

echo "URL:      ${URL}"
echo "FILENAME: ${FILENAME}"
echo "MODNAME:  ${MODNAME}"
echo "DIRNAME:  ${DIRNAME}"

mv ${DIRNAME}/${MODNAME} ${GITHUB_WORKSPACE}
rm -rf ${DIRNAME} ${FILENAME}

echo "::set-output name=file::${MODNAME}"
