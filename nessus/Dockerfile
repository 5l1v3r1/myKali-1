FROM debian:latest

LABEL maintainer="51pwn.com<s1pwned@gmail.com>" \
    description="my nessus https://github.com/hktalent/nessus" \
    version="1.0"

# docker build --tag mynessus .
# docker run -it -p 8834:8834 mynessus /bin/bash
# docker stop 81433e5c530a;docker rm 81433e5c530a
# docker export df4ceed175d4 >  /Users/0x101/Downloads/myDcocker/myNessus.rar
# xtmt2016
# xtmt2016***
# docker start df4ceed175d4;docker exec -it df4ceed175d4 /bin/bash
COPY ["Nessus-8.5.1-debian6_amd64.deb","/tmp/"] 

# https://unix.stackexchange.com/questions/429729/apt-get-update-error-in-kali-linux-after-dist-upgrade/ 
RUN set +e \
    && cd /tmp \
    && dpkg -i Nessus-8.5.1-debian6_amd64.deb \
    && /opt/nessus/sbin/nessuscli fetch --register 5DD6-28B1-BB12-D854-3180 \
    && /opt/nessus/sbin/nessuscli update --all \
    && echo "/etc/init.d/nessusd start &" >> /root/.bashrc \
    && echo "/opt/nessus/sbin/nessusd start &" >> /root/.bashrc
    # libmono-oracle4.0-cil oracle-instantclient18.3-basic oracle-instantclient18.3-devel oracle-instantclient18.3-sqlplus

EXPOSE 8834-8834
# ENTRYPOINT ["/etc/init.d/nessusd","start"]
# ENTRYPOINT ["/opt/nessus/sbin/nessusd","start"]
