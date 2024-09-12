#!/usr/bin/env sh

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
cd $DIR

command_success () {
    if [ $? -eq 0 ]; then
	echo "$1 success"
    else
	echo "$1 failed"
    fi
}

# set name here e.x. jellyfin, syncthing
printf "\n
JAIL DESTROYER (USE WITH CAUTION!)\n
----------------------------------
"
jls

printf "
----------------------------------\n
Enter jail name below:
"
read JAIL_NAME

service jail stop $JAIL_NAME

chflags -R 0 /usr/local/jails/containers/$JAIL_NAME
command_success "chflags -R 0 /usr/local/jails/containers/$JAIL_NAME"

rm -rf /usr/local/jails/containers/$JAIL_NAME
command_success "rm -rf /usr/local/jails/containers/$JAIL_NAME"

sysrc jail_list-=$JAIL_NAME
