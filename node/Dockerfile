#Ubuntu NodeJS
FROM ubuntu:18.04
EXPOSE 3000

# Configuracao inicial
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install build-essential -y  \
    && apt-get install vim -y  \
    && apt-get install curl -y  \
    && apt-get install gdebi -y \
    && apt-get install wget -y  \
    && apt-get install libasound2 -y \
    && apt-get install npm -y \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install sudo -y 

# Instalando Node e Vue
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install nodejs -y

# Criando Ambiente para Usuario
ENV HOME /home/user
ENV VSCODEEXT /var/vscode-ext

RUN useradd -m -s /bin/bash user \
    && echo 'user:user.,' |chpasswd \
    && mkdir $HOME/projetos -p \
    && mkdir $VSCODEEXT -p \
    && mkdir $HOME/npm -p \
	&& chown -R user:user $HOME $VSCODEEXT $HOME/projetos $HOME/npm \
	&& adduser user sudo

WORKDIR $HOME/projetos

# Instalando VSCode
RUN wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
RUN gdebi -n vscode.deb

RUN su user -c "code --extensions-dir $VSCODEEXT --install-extension grogdunn.netbeans-keybindings --install-extension eamodio.gitlens --install-extension aaron-bond.better-comments --install-extension octref.vetur"

# Opcional
#RUN rm -rf vscode.deb
#RUN su user -c "ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N 'user.,'"

RUN apt-get purge -y --auto-remove wget \
    && apt-get purge -y --auto-remove gdebi \
    && apt-get purge -y --auto-remove curl


COPY node-start.sh /home/user/
RUN chmod 777 /home/user/node-start.sh
CMD ["/home/user/node-start.sh"]