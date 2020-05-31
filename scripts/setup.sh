#!/bin/bash

set -exu

cd ..
readonly work_dir=$(pwd)
readonly opencv_version="4.3.0"
readonly opencv_contrib_version="4.3.0"

if [ ! -d "opencv-${opencv_version}" ]; then
    # download OpenCV release
    wget https://github.com/opencv/opencv/archive/${opencv_version}.zip
    unzip ${opencv_version}.zip
    mv ${work_dir}/${opencv_version}.zip $TMPDIR

    wget https://github.com/opencv/opencv_contrib/archive/${opencv_contrib_version}.zip
    unzip ${opencv_contrib_version}.zip
    mv ${work_dir}/${opencv_contrib_version}.zip $TMPDIR
fi


if [ ! -d "Frameworks/opencv2.framework" ]; then
	mkdir -p Frameworks
	python ${work_dir}/opencv-${opencv_version}/platforms/osx/build_framework.py \
		${work_dir}/Frameworks \
		--without videoio \
		--without video \
		--without ts \
		--without stitching \
		--without python \
		--without js \
		--without java \
		--enable_nonfree \
		--contrib ${work_dir}/opencv_contrib-${opencv_contrib_version} 
fi
