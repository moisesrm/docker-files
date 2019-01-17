#Ubuntu Mysql
FROM ubuntu:14.04
EXPOSE 27017

# Configuracao inicial
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install build-essential -y  \
    && apt-get install vim -y  \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install sudo -y

# Instalacao Mongo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 \
    && echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list \
    && apt-get install apt-transport-https -y \
    && apt-get update -y \
    && apt-get install mongodb-org -y

# Criando Ambiente para Usuario
RUN useradd -m -s /bin/bash user \
    && echo 'user:user.,' |chpasswd \
    && adduser user sudo

COPY mongodb-start.sh /home/user/
RUN chmod 777 /home/user/mongodb-start.sh
ENTRYPOINT ["/home/user/mongodb-start.sh"]