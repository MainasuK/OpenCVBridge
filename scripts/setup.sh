#!/bin/bash

set -exu

cd ..
readonly work_dir=$(pwd)
readonly opencv_version="4.3.0"

if [ ! -d "opencv-${opencv_version}" ]; then
    # download OpenCV release
    wget https://github.com/opencv/opencv/archive/${opencv_version}.zip
    unzip ${opencv_version}.zip
    mv ./${opencv_version}.zip $TMPDIR
fi


if [ ! -d "Frameworks/opencv2.framework" ]; then
	mkdir -p Frameworks
	python ${work_dir}/opencv-${opencv_version}/platforms/osx/build_framework.py ${work_dir}/Frameworks
fi
