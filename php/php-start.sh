#!/bin/bash

sudo service apache2 start &
sudo service ssh start &
su user -p -c "/usr/share/code/code . --extensions-dir /var/vscode-ext"
