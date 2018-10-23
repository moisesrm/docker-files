#Ubuntu Php 5
FROM ubuntu:14.04
EXPOSE 22
EXPOSE 80
EXPOSE 9000
EXPOSE 8000

# Configuracao inicial
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install build-essential -y  \
    && apt-get install vim -y  \
    && apt-get install libX11-xcb1 -y \
    && apt-get install libxss1 -y \
    && apt-get install wget -y  \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install gdebi -y

# Instalando Php + Apache
RUN apt-get install apache2 -y \
    && apt-get install php5 php5-mysql libapache2-mod-php5 php5-mcrypt -y \
    && apt-get install php5-xdebug -y

# Configuracao xDebug
RUN cd /etc/php5/apache2
RUN echo "xdebug.remote_enable = 1" >> php.ini \
    && echo "xdebug.remote_autostart = 1" >> php.ini

# Criando Ambiente para Usuario
ENV HOME /home/user
ENV VSCODEEXT /var/vscode-ext

RUN useradd -ms /bin/bash user \
    && echo 'user:user.,' |chpasswd \
    && mkdir /var/www/html -p \
    && mkdir $VSCODEEXT -p \
	&& chown -R user:user $HOME /var/www/html $VSCODEEXT

WORKDIR /var/www/html

# Instalando VSCode
RUN wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
RUN gdebi -n vscode.deb

RUN su user -c "code --extensions-dir $VSCODEEXT --install-extension bmewburn.vscode-intelephense-client --install-extension aaron-bond.better-comments --install-extension felixfbecker.php-debug --install-extension neilbrayfield.php-docblocker --install-extension grogdunn.netbeans-keybindings --install-extension eamodio.gitlens"

# Opcional
#RUN rm -rf vscode.deb
#RUN su user -c "ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N 'user.,'"

COPY php-start.sh /home/user/
RUN chmod 777 /home/user/php-start.sh
CMD ["/home/user/php-start.sh"]