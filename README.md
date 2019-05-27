# myKali
myKali

## clamscan
```
apt install clamscan
clamscan -r --bell -i ./myKali
```

## build
```
git clone https://github.com/hktalent/myKali && cd myKali
find . -size +2000k|grep -v "git"|sed -E 's/.*\.//g'|sort -u|xargs -I % git lfs track "*.%"
docker build -t mykali20190526 --no-cache .
```
