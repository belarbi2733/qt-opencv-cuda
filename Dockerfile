FROM nvidia/cuda:7.5

RUN sed -i "s/trusty universe/trusty universe multiverse/g" /etc/apt/sources.list && cat /etc/apt/sources.list && \
	apt-get update && apt-get install --assume-yes software-properties-common && \
	add-apt-repository ppa:mc3man/trusty-media && \
	apt-get update && apt-cache search ffmpeg && \
	apt-get install --assume-yes cmake build-essential git pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy \
	libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev \
	libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
	libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev \
	libvorbis-dev libxvidcore-dev v4l-utils qtcreator qt5-default qt5-doc qt5-doc-html qtbase5-doc-html qtbase5-examples

RUN cd /opt &&  git clone https://github.com/apc-llc/opencv-2.4.10.git
RUN cd /opt/opencv-2.4.10 && mkdir build && cd build && cmake -D WITH_CUDA=OFF -DHAVE_OPENCL=TRUE -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON \
       -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_VTK=ON -DCMAKE_INSTALL_PREFIX=$(pwd)/../install .. && make -j && make install
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer
USER developer
ENV HOME /home/developer
CMD /usr/bin/qtcreator
