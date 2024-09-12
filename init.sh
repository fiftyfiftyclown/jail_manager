#!/usr/bin/env sh

sysrc jail_enable="YES"
sysrc jail_parallel_start="YES"

zfs create -o mountpoint=/usr/local/jails zroot/jails
zfs create zroot/jails/media
zfs create zroot/jails/templates
zfs create zroot/jails/containers
