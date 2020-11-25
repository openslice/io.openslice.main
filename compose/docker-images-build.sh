#!/bin/sh

dirlocation=`pwd`/.
echo "We're working with $dirlocation"
cd $dirlocation
tagname=latest

buildimg(){
        cd $dirlocation/$1
        echo "Build " $1
        sudo docker build -t openslice/$1:$tagname -f $2 .
        sudo docker push  openslice/$1:$tagname
}

buildimg io.openslice.centrallog.service Dockerfile.centrallog
buildimg io.openslice.portal.api Dockerfile.portalapi
buildimg io.openslice.mano Dockerfile.mano
buildimg io.openslice.bugzilla Dockerfile.bugzilla
buildimg io.openslice.osom Dockerfile.osom
buildimg io.openslice.portal.web Dockerfile
buildimg io.openslice.tmf.api Dockerfile.tmfapi
buildimg io.openslice.tmf.web Dockerfile
