#!/usr/bin/env sh

echo "FreeBSD base version to download e.g. 14.1"
read BSD_VER

fetch https://download.freebsd.org/releases/amd64/amd64/$BSD_VER-RELEASE/base.txz -o /usr/local/jails/media/$BSD_VER-RELEASE-base.txz
