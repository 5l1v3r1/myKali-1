FROM kalilinux/kali-linux-docker

LABEL maintainer="51pwn.com<s1pwned@gmail.com>" \
    description="my kali https://github.com/hktalent/myKali" \
    version="1.0"

# https://github.com/dbeaver/dbeaver
# https://github.com/jindrapetrik/jpexs-decompiler

COPY ["oracle_client_12_2_exp_imp","sqlcl","sqldeveloper","DependencyCheck","dbeaver-ce-6.0.5-linux.gtk.x86_64.tar.gz","/usr/share/"] \
    ["oracle","/usr/lib/"] \
    ["bashrc","/root/.bashrc"] \
    ["expMysql","/usr/local/bin/"]

ARG CURIP

# ENV http_proxy=http://$CURIP:3128 \
#     https_proxy=http://$CURIP:3128 \
#     ftp_proxy=http://$CURIP:3128

# https://unix.stackexchange.com/questions/429729/apt-get-update-error-in-kali-linux-after-dist-upgrade/ 
RUN set +e \
    && echo "CURIP = " $CURIP \
    # && apt -y update --fix-missing \
    && apt -y install gnupg gnupg2 gnupg1 --fix-missing \
    # && chmod +x /usr/local/bin/expMysql \
    && echo -e "deb https://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list \
    && apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys 7D8D0BF6 \
    && apt -y update --fix-missing && apt -y upgrade --fix-missing && apt -yy dist-upgrade && apt autoremove -yy \
    && apt -y install kali-linux  chkrootkit rkhunter clamav clamtk clamav-daemon lynis --fix-missing \
    && apt -y  install xvfb --fix-missing  \
    && apt -y  install net-tools --fix-missing  \
    && apt -y  install masscan --fix-missing  \
    && apt -y  install proxychains --fix-missing  \
    && apt -y  install netcat --fix-missing  \
    && apt -y  install maven  --fix-missing  \
    && apt -y  install python3-pip --fix-missing  \
    && apt -y  install python --fix-missing  \
    && apt -y  install nodejs --fix-missing  \
    && apt -y  install -y devscripts git-buildpackage debhelper debootstrap python-all --fix-missing  \
    && apt -y  install build-essential ipython python-setuptools --fix-missing \
    && apt -y  install python-pip python-dev libssl-dev libffi-dev --fix-missing   \
    && apt -y  install pkg-config libssl-dev libffi-dev libxml2-dev --fix-missing  \ 
    && apt -y  install libxslt1-dev libfreetype6-dev libpng-dev --fix-missing  \
    && apt -y  install openvas wfuzz --fix-missing  \
    && apt -y  install tcpdump --fix-missing  \
    && apt -y  install ettercap-text-only --fix-missing  \
    && apt -y  install bettercap jsql arachni hurl reaver gobuster golismero t50 sqlmap --fix-missing  \
    && apt -y  install redis-server jboss-autopwn dotdotpwn fimap  --fix-missing  \
    && apt -y  install zaproxy  apache-users sslsplit sqlninja inspy  powerfuzzer --fix-missing \
    && apt -y  install sysfsutils  --fix-missing  \
    # kali-linux-full kali-linux-top10 kali-linux-pwtools kali-linux-forensic kali-linux-gpu kali-linux-wireless
    && apt -y install kali-linux-top10 kali-linux-pwtools kali-linux-web  software-properties-common xrdp python-scapy wmi-client winrmcp winexe wig colordiff colortail unzip vim tmux xterm zsh curl strace tmate ant shellter samdump2 rdesktop --fix-missing \
    && apt -y install cl-sql-oracle set --fix-missing \
    && apt -y install oscanner tnscmd10g --fix-missing \
    && apt -y install tcpdump graphviz imagemagick python-gnuplot python-crypto python-pyx \
    && cd /usr/share/ && tar xzf dbeaver-ce-6.0.5-linux.gtk.x86_64.tar.gz && rm -rf dbeaver-ce-6.0.5-linux.gtk.x86_64.tar.gz \
    # && rkhunter --update && freshclam --verbose \
    && pip install cx_Oracle scapy \
    # && cd /usr/share/ && git clone https://github.com/jindrapetrik/jpexs-decompiler  && cd jpexs-decompiler && ant build \
    && ln -s /usr/share/set/setoolkit /usr/local/bin/SET \
    # && source /root/.bashrc \
    # && dependency-check --updateonly \
    && apt update -y --fix-missing &&  apt upgrade  -y --fix-missing  && apt autoclean  -y --fix-missing
    # libmono-oracle4.0-cil oracle-instantclient18.3-basic oracle-instantclient18.3-devel oracle-instantclient18.3-sqlplus

EXPOSE 4000-9000 \
      13742:13742
# ENTRYPOINT ["","",""]