#!/bin/bash

service apache2 start -D
su user -p -c "/usr/share/code/code . --extensions-dir /var/vscode-ext"