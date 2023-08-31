#!/bin/sh

dirlocation=`pwd`/.
# If no argument is provided, use "master" as the default value
default_branch="master"
branch="${1:-$default_branch}"

echo "Selected branch: $branch"
echo "We're working with $dirlocation"
cd $dirlocation


updaterepo(){
        cd $dirlocation
        echo "Build " $1
        if [ ! -d $1 ]; then
                git clone --single-branch --branch $branch https://github.com/openslice/$1.git
                cd $1/
        else
                cd $1/
                git checkout develop
                git pull
        fi
}

updaterepo io.openslice.main
updaterepo io.openslice.sol005nbi.osm
updaterepo io.openslice.sol005nbi.osm10
updaterepo io.openslice.centrallog.client
updaterepo io.openslice.centrallog.service
updaterepo io.openslice.model
updaterepo io.openslice.portal.api
updaterepo io.openslice.gateway.api
updaterepo io.openslice.mano
updaterepo io.openslice.bugzilla
updaterepo io.openslice.osom
updaterepo io.openslice.oas
updaterepo io.openslice.portal.web
updaterepo io.openslice.tmf.api
updaterepo io.openslice.tmf.web

cd $dirlocation
docker run -it --rm -v "/home/ubuntu/.m2":/root/.m2 -v "$(pwd)":/opt/maven -w /opt/maven/io.openslice.main maven:3.9.3-ibm-semeru-17-focal mvn clean verify -DskipTests



cd $dirlocation/io.openslice.tmf.web

if [ ! -f  "./src/assets/config/theming.scss" ]; then
    cp ./src/assets/config/theming.default.scss ./src/assets/config/theming.scss
fi
if [ ! -f  "./src/assets/config/config.prod.json" ]; then
    cp ./src/assets/config/config.prod.default.json ./src/assets/config/config.prod.json
fi

docker run -u 0 --rm -v "$PWD":/app trion/ng-cli:14.2.6 npm install
docker run -u 0 --rm -v "$PWD":/app trion/ng-cli:14.2.6 ng build --configuration production --deleteOutputPath=false
