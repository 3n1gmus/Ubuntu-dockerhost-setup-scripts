#!/bin/bash
# Usage: ./clone-user.sh src_user_name new_user_name
# From: https://blog.yucas.net/2020/11/08/clone-linux-user-copy-user-based-on-another-one/

SRC=$1
DEST=$2

SRC_GROUPS=$(id -Gn ${SRC} | sed "s/ /,/g" | sed -r 's/\<'${SRC}'\>\b,?//g')
SRC_SHELL=$(awk -F : -v name=${SRC} '(name == $1) { print $7 }' /etc/passwd)

sudo useradd --groups ${SRC_GROUPS} --shell ${SRC_SHELL} --create-home ${DEST}
sudo passwd ${DEST}