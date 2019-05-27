FROM kalilinux/kali-linux-docker

# docker build -t mykali20190526 --no-cache --build-arg HTTP_PROXY=http://127.0.0.1:3128 .

# https://github.com/dbeaver/dbeaver

RUN apt -y update --fix-missing && apt -y upgrade --fix-missing && apt-get -yy dist-upgrade && apt autoremove -yy \
    && apt -y install kali-linux  chkrootkit rkhunter clamav clamav-daemon lynis --fix-missing\
    && apt -y install kali-linux-top10 kali-linux-pwtools --fix-missing \
    && apt -y install cl-sql-oracle --fix-missing \
    && apt -y install oscanner tnscmd10g --fix-missing
    # libmono-oracle4.0-cil oracle-instantclient18.3-basic oracle-instantclient18.3-devel oracle-instantclient18.3-sqlplus

 