FROM kalilinux/kali-linux-docker

# docker build -t mykali20190526 --no-cache --build-arg HTTP_PROXY=http://127.0.0.1:3128 .

# https://github.com/dbeaver/dbeaver
# https://github.com/jindrapetrik/jpexs-decompiler

COPY oracle_client_12_2_exp_imp /usr/share/
COPY sqlcl /usr/share/
COPY expMysql /usr/local/bin/
COPY oracle /usr/lib/
COPY bashrc /root/.bashrc

 
RUN apt -y update --fix-missing && apt -y upgrade --fix-missing && apt-get -yy dist-upgrade && apt autoremove -yy \
    && apt -y install kali-linux  chkrootkit rkhunter clamav clamav-daemon lynis --fix-missing\
    && apt -y install kali-linux-top10 kali-linux-pwtools xrdp python-scapy wmi-client winrmcp winexe wig git ant shellter samdump2 rdesktop --fix-missing \
    && apt -y install cl-sql-oracle --fix-missing \
    && apt -y install oscanner tnscmd10g --fix-missing \
    && pip install cx_Oracle \
    && cd /usr/share/ && git clone https://github.com/jindrapetrik/jpexs-decompiler  && cd jpexs-decompiler && ant build \
    && chmod +x /usr/local/bin/expMysql \
    && ln -s /usr/share/set/setoolkit /usr/local/bin/SET
    # libmono-oracle4.0-cil oracle-instantclient18.3-basic oracle-instantclient18.3-devel oracle-instantclient18.3-sqlplus
