#!/bin/bash

set -exu

cd ..
readonly work_dir=$(pwd)
readonly opencv_version="4.3.0"
readonly opencv_contrib_version="4.3.0"

if [ -d "opencv-${opencv_version}" ]; then
    rm -rf ${work_dir}/opencv-${opencv_version}
fi

if [ -d "opencv_contrib-${opencv_contrib_version}" ]; then
    rm -rf ${work_dir}/opencv_contrib-${opencv_contrib_version}
fi


if [ -d "build_framework" ]; then
	rm -rf "build_framework"
fi
