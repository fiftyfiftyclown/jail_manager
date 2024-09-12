#!/usr/bin/env sh

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
cd $DIR

CONTAINERS=/usr/local/jails/containers

command_success () {
if [ $? -eq 0 ]; then
	echo "$1 success"
else
	echo "$1 failed"
fi
}

# set name here e.x. jellyfin, syncthing

printf "\n
JAIL CREATOR
----------------------------------\n
Enter jail name (your choice :P)
"
read JAIL_NAME
echo "Enter FreeBSD version number e.g. 14.1: "
read BSD_VER
echo "Creating jail: $JAIL_NAME"

mkdir -p $CONTAINERS/$JAIL_NAME
command_success "mkdir -p $CONTAINERS/$JAIL_NAME"

tar -xf /usr/local/jails/media/$BSD_VER-RELEASE-base.txz -C $CONTAINERS/$JAIL_NAME --unlink
command_success "tar -xf /usr/local/jails/media/$BSD_VER-RELEASE-base.txz -C $CONTAINERS/$JAIL_NAME --unlink"

cp /etc/resolv.conf $CONTAINERS/$JAIL_NAME/etc/resolv.conf
command_success "cp /etc/resolv.conf $CONTAINERS/$JAIL_NAME/etc/resolv.conf"

cp /etc/localtime $CONTAINERS/$JAIL_NAME/etc/localtime
command_success "cp /etc/localtime $CONTAINERS/$JAIL_NAME/etc/localtime"

echo "Installing FreeBSD..."
freebsd-update -b $CONTAINERS/$JAIL_NAME/ fetch install

cp sample.conf /etc/jail.conf.d/$JAIL_NAME.conf
sed "s/sample/$JAIL_NAME/g" sample.conf > /etc/jail.conf.d/$JAIL_NAME.conf


sysrc jail_list+=$JAIL_NAME
service jail start $JAIL_NAME
jls
