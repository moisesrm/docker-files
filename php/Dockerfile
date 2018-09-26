#Ubuntu Php 5
FROM ubuntu:14.04
EXPOSE 80
EXPOSE 9000
EXPOSE 8000

# Configuracao inicial
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y 
RUN apt-get install vim -y 
RUN apt-get install libX11-xcb1 -y
RUN apt-get install libxss1 -y
RUN apt-get install wget -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install gdebi -y

# Instalando Php + Apache
RUN apt-get install apache2 -y 
RUN apt-get install php5 php5-mysql libapache2-mod-php5 php5-mcrypt -y
RUN apt-get install php5-xdebug -y

# Configuracao xDebug
RUN cd /etc/php5/apache2
RUN echo "xdebug.remote_enable = 1" >> php.ini
RUN echo "xdebug.remote_autostart = 1" >> php.ini
RUN cd ~

# Criando Ambiente para Usuario
ENV HOME /home/user
ENV VSCODEEXT /var/vscode-ext

RUN useradd --create-home --home-dir $HOME user \
    && mkdir /var/www/html -p \
    && mkdir $VSCODEEXT -p \
	&& chown -R user:user $HOME /var/www/html $VSCODEEXT

WORKDIR /var/www/html

# Instalando VSCode
RUN wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
RUN gdebi -n vscode.deb

# Opcional
#RUN rm -rf vscode.deb