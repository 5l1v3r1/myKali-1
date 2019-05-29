#!/bin/bash
git commit -m "up" .;git push
docker start squid
cd jpexs-decompiler
git submodule init
git submodule update
cd ..
cd DependencyCheck
git submodule init
git submodule update
cd ..

wget -c --no-check-certificate --user-agent="Mozilla/5.0 (X11;U;Linux i686;en-US;rv:1.9.0.3) Geco/2008092416 Firefox/3.0.3" -O dbeaver-ce-6.0.5-linux.gtk.x86_64.tar.gz  https://github.com/dbeaver/dbeaver/releases/download/6.0.5/dbeaver-ce-6.0.5-linux.gtk.x86_64.tar.gz

docker ps -a|grep Exited|grep apt|awk '{print $1}'|xargs docker rm
xxx=$(docker images|grep none|awk '{print $3}')
for i in ${xxx[@]}
do
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker stop 
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker rm 
done

docker images|grep none|awk '{print $3}'|xargs docker rmi 
docker rmi mykali_mtx
docker start squid;
CURIP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`
CURIP=$CURIP docker-compose build --no-cache --build-arg CURIP=$CURIP

docker ps -a|grep Exited|grep apt|awk '{print $1}'|xargs docker rm
xxx=$(docker images|grep none|awk '{print $3}')
for i in ${xxx[@]}
do
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker stop 
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker rm 
done

docker images|grep none|awk '{print $3}'|xargs docker rmi 
