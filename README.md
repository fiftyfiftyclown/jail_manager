* FreeBSD Jail Manager

This interactive jail manager allows for the interactive creation
of rudimentary jails that autostart and contain separate configuration
files. Users can also specify the hostname and version of FreeBSD
that is downloaded and installed.

** Usage
Initialize the directories & configurations required via the
`init.sh` script, this will require root permission and zfs root!

Start program via `menu.sh`, this will launch the program
and let you interactively manipulate the jails. This will
require `doas` installed, run `pkg install doas` and configure
to your liking.