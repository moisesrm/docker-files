#Ubuntu C
FROM ubuntu:14.04


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
    && apt-get install gdebi -y \
    && apt-get install libcppunit-dev -y \
    && apt-get install sudo -y

# Criando Ambiente para Usuario
ENV HOME /home/user
ENV VSCODEEXT /var/vscode-ext

RUN useradd -ms /bin/bash user \
    && echo 'user:user.,' |chpasswd \
    && mkdir /var/www/html -p \
    && mkdir $VSCODEEXT -p \
	&& chown -R user:user $HOME /var/www/html $VSCODEEXT \
	&& adduser user sudo

WORKDIR /var/www/html

# Instalando VSCode
RUN wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
RUN gdebi -n vscode.deb

RUN su user -c "code --extensions-dir $VSCODEEXT --install-extension ms-vscode.cpptools --install-extension aaron-bond.better-comments --install-extension austin.code-gnu-global --install-extension maelvalais.autoconf --install-extension grogdunn.netbeans-keybindings --install-extension eamodio.gitlens"

# Opcional

COPY c-start.sh /home/user/
RUN chmod 777 /home/user/c-start.sh
CMD ["/home/user/c-start.sh"]