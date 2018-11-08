#Ubuntu Mysql
FROM ubuntu:14.04
EXPOSE 22
EXPOSE 3306

# Configuracao inicial
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install build-essential -y  \
    && apt-get install vim -y  \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install sudo -y

# Instalacao MySql 5.6
RUN apt install mysql-server-5.6 -y \
    && apt install mysql-client-5.6 -y

# Criando Ambiente para Usuario
ENV HOME /home/user
RUN useradd -ms /bin/bash user \
    && echo 'user:user.,' |chpasswd \
    && adduser user sudo

# Configuracao MySql 5.6
RUN service mysql stop \
    && echo -ne '\n' | (mysqld_safe --skip-grant-tables &) \
    && service mysql start \
    && mysql -u root \
             -D mysql \
             -e "UPDATE user SET password=PASSWORD('root') WHERE User='root'; flush privileges;" \
    && /etc/init.d/mysql restart


# Configuracao SSH
# RUN su user -c "ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N 'user.,'"

COPY mysql-start.sh /home/user/
RUN chmod 777 /home/user/mysql-start.sh
CMD ["/home/user/mysql-start.sh"]