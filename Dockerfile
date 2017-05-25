FROM centos:6.9

MAINTAINER "Boudewijn Rempt <boudewijnrempt@users.noreply.github.com>"

RUN yum install centos-release-scl && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y install \
    wget tar bzip2 git libtool which fuse fuse-devel libpng-devel \
    automake libtool mesa-libEGL cppunit-devel cmake3 glibc-headers lbstdc++-devel \
    gcc-c++ freetype-devel fontconfig-devel libxml2-devel libstdc++-devel \
    libXrender-devel patch xcb-util-keysyms-devel libXi-devel \
    mesa-libGL-devel libxcb libxcb-devel xcb-util xcb-util-devel \
    centos-release-scl-rh \
    devtoolset-3-gcc devtoolset-3-gcc-c++ devtoolset-3-binutils

RUN groupadd --gid 1000 builder && useradd --uid 1000 --gid 1000 --comment "" builder

ADD build-appimage.sh /build-appimage.sh

USER 1000

