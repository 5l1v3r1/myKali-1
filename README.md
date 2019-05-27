# myKali
myKali

## clamscan
```
apt install clamscan
clamscan -r --bell -i ./myKali
find . -size +20000k|grep -v "git"|sed -E 's/.*\.//g'|sort -u|xargs -I % git lfs track "*.%"

find . -size +20000k|grep -v ".git"
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch sqldeveloper/sqldeveloper/extensions/oracle.datamodeler.jar'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch sqldeveloper/ords/ords.war'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle/18.3/client64/lib/libclntsh.so.18.1'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle/18.3/client64/lib/libociei.so'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle_client_12_2_exp_imp/lib/libclntsh.so.12.1'
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch oracle_client_12_2_exp_imp/lib/libociei.so'


<!-- git filter-branch --tree-filter 'rm sqldeveloper/sqldeveloper/extensions/oracle.datamodeler.jar' HEAD
git filter-branch --tree-filter 'rm sqldeveloper/ords/ords.war' HEAD
git filter-branch --tree-filter 'rm oracle/18.3/client64/lib/libclntsh.so.18.1' HEAD
git filter-branch --tree-filter 'rm oracle/18.3/client64/lib/libociei.so' HEAD
git filter-branch --tree-filter 'rm oracle_client_12_2_exp_imp/lib/libclntsh.so.12.1' HEAD
git filter-branch --tree-filter 'rm oracle_client_12_2_exp_imp/lib/libociei.so' HEAD
git push -->

git pull --rebase .
git push -f origin master --force
git commit -m "fix" .
git pull --allow-unrelated-histories origin master

```

## build
```
git clone https://github.com/hktalent/myKali && cd myKali

docker build -t mykali20190526 --no-cache .
```
