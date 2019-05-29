docker ps -a|grep Exited|grep apt|awk '{print $1}'|xargs docker rm
xxx=$(docker images|grep none|awk '{print $3}')
for i in ${xxx[@]}
do
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker stop 
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker rm 
done

docker images|grep none|awk '{print $3}'|xargs docker rmi 
docker rmi mykali_mtx
docker start squid;CURIP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`
docker start squid;CURIP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'` docker-compose build --no-cache --build-arg CURIP=$CURIP
