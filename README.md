# myKali
myKali

## clamscan
```
apt install clamscan
clamscan -r --bell -i ./myKali

```
## fix git
```
find . -size +20000k|grep -v "git"|sed -E 's/.*\.//g'|sort -u|xargs -I % git lfs track "*.%"

find . -size +20000k|grep -v ".git"
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch sqldeveloper/sqldeveloper/extensions/oracle.datamodeler.jar'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch sqldeveloper/ords/ords.war'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle/18.3/client64/lib/libclntsh.so.18.1'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle/18.3/client64/lib/libociei.so'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle_client_12_2_exp_imp/lib/libclntsh.so.12.1'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle_client_12_2_exp_imp/lib/libociei.so'

git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch dbeaver'

git push -u origin master

git filter-branch --tree-filter 'rm sqldeveloper/sqldeveloper/extensions/oracle.datamodeler.jar' HEAD
git filter-branch --tree-filter 'rm sqldeveloper/ords/ords.war' HEAD
git filter-branch --tree-filter 'rm oracle/18.3/client64/lib/libclntsh.so.18.1' HEAD
git filter-branch --tree-filter 'rm oracle/18.3/client64/lib/libociei.so' HEAD
git filter-branch --tree-filter 'rm oracle_client_12_2_exp_imp/lib/libclntsh.so.12.1' HEAD
git filter-branch --tree-filter 'rm oracle_client_12_2_exp_imp/lib/libociei.so' HEAD
git push 
git pull --rebase .
git push -f origin master --force
git commit -m "fix" .
git pull --allow-unrelated-histories origin master
```


## build
```
git clone https://github.com/hktalent/myKali && cd myKali
git submodule add https://github.com/jindrapetrik/jpexs-decompiler
cd jpexs-decompiler
git submodule init
git submodule update
brew install ant || apt install ant
ant build
cd ..

git submodule add https://github.com/jeremylong/DependencyCheck
cd DependencyCheck
git submodule init
git submodule update
cd ..
echo "insecure" >> ~/.curlrc
echo "check_certificate = off" >> ~/.wgetrc

wget -c --no-check-certificate --user-agent="Mozilla/5.0 (X11;U;Linux i686;en-US;rv:1.9.0.3) Geco/2008092416 Firefox/3.0.3" -O xxx.tar.gz https://github.com/dbeaver/dbeaver/releases/download/6.0.5/dbeaver-ce-6.0.5-linux.gtk.x86_64.tar.gz 
```
### build cache server
optimization  fast cache for:
- docker build
- dependency-check --updateonly
- apt upgrade openvas
- greenbone-scapdata-sync
- greenbone-certdata-sync
- greenbone-nvt-sync
- /opt/nessus/sbin/nessuscli update --all

```
curme=`whoami`
# ls /Users/${curme}/safe/cache |grep -v "squid-simple.conf"|xargs rm -rf 
docker stop squid
docker rm -v squid

docker run --name squid -d \
  --publish 3128:3128 \
  --restart=always \
  -v `pwd`/squid-simple.conf:/etc/squid/squid.conf \
  -v `pwd`/cache:/var/spool/squid \
  sameersbn/squid
docker start squid
# docker exec -it squid /bin/bash
# docker exec -it squid tail -f /var/log/squid/access.log
```
### build from bash shell
```
docker rmi mykali_mtx
CURIP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
echo "CURIP = " ${CURIP}
docker build -t mykali_mtx --no-cache --build-arg http_proxy=http://${CURIP}:3128 \
    --build-arg https_proxy=http://${CURIP}:3128 \
    --build-arg ftp_proxy=http://${CURIP}:3128 .
```
### build from docker-compose
```
docker rmi mykali_mtx
CURIP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'` docker-compose build --no-cache --build-arg CURIP=$CURIP
```

### build cleanup
```
docker ps -a|grep Exited|grep apt|awk '{print $1}'|xargs docker rm
xxx=$(docker images|grep none|awk '{print $3}')
for i in ${xxx[@]}
do
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker stop 
   docker ps -a |grep ${i}|awk '{print $1}'|xargs docker rm 
done

docker images|grep none|awk '{print $3}'|xargs docker rmi 
docker images|grep -E "kali|openvas"
```

### run docker 
```
CURIP=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`  docker-compose up 
```

## tools
### any database tools
- dbeaver
### oracle database tools
#### /usr/share/oracle_client_12_2_exp_imp/
- exp
- expdp
- imp
- impdp
- sqlldr
- wrc
- lib/adrci
- lib/genezi
- lib/uidrvci

#### /usr/share/sqlcl/bin/
- adrci
- genezi
- sqlplus

#### /usr/share/sqldeveloper
- sqldeveloper.sh

### MSSQL Server database tools
#### /usr/share/sqlcl
- bin/sql

### jpexs-decompiler,swf file decompiler
- ffdec

### lynis audit system
```
lynis --check-all -Q
lynis audit system remote 192.168.10.216
```

### clamav,clamav-daemon
```
freshclam
clamscan -r --bell -i ~/
clamscan -r --remove /

```

### chkrootkit,rkhunter
```
rkhunter -c
chkrootkit|grep not
```
