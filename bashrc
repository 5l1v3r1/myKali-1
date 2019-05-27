export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:/usr/share/oracle_client_12_2_exp_imp/lib
alias sql=/usr/share/sqlcl/bin/sql
alias sqlcl=/usr/share/sqlcl/bin/sql
alias py2=`which python`
alias py3=`which python3`
alias tor-browser="su - kali bash -c 'cd /home/kali/tor-browser_en-US/&&./start-tor-browser.desktop'"
alias ffdec='java -jar /usr/share/jpexs-decompiler/dist/ffdec.jar'
alias c='clear'
alias less='less --RAW-CONTROL-CHARS'
export LS_OPTS='--color=auto'
alias ls='ls ${LS_OPTS}'
alias whoami="clear&&echo -e 'xxxx\\administrator\n\n\n\n\n\n'"
export ORACLE_HOME=/usr/lib/oracle/18.3/client64/
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$ORACLE_HOME/bin:/root/mytools/oracle_client_12_2_exp_imp/:$PATH
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export DISPLAY="docker.for.mac.localhost:0"
export GOPATH=/root/go
JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

