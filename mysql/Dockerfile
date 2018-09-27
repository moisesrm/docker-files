#Ubuntu Mysql
FROM ubuntu:14.04
EXPOSE 3306

# Configuracao inicial
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y 
RUN apt-get install vim -y 
RUN apt-get update -y
RUN apt-get upgrade -y

# Instalacao MySql 5.6
RUN apt install mysql-server-5.6 -y
RUN apt install mysql-client-5.6 -y
RUN service mysql stop
RUN mysqld_safe --skip-grant-tables &
RUN /etc/init.d/mysql restart

# Criando Ambiente para Usuario
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME