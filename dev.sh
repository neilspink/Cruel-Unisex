#!/bin/bash
cd /usr/share/nano
sudo wget https://raw.githubusercontent.com/serialhex/nano-highlight/master/js.nanorc
cat << EOF > ~/.nanorc
include /usr/share/nano/javascript.nanorc
EOF
