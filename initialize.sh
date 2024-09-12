#!/usr/bin/env sh


DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
cd $DIR

print_menu(){
    
    printf "\n
JAIL MANAGER
----------------------------------\n
OPTIONS:
download jail (b)ase
(c)reate jail
(d)elete jail
(e)xit

Enter lower case letter (b,c,d,e)
"
}

while true; do
    print_menu

    read input

    case $input in
	b)
	    echo "downloading base..."
	    doas sh jail_base_download.sh
	    ;;

	c)
	    echo "creating jail..."
	    doas sh jail_create.sh
	    ;;
	
	d)
	    echo "deleting jail..."
	    doas sh jail_delete.sh
	    ;;

	e)
	    echo "exiting program..."
	    exit 0
	    ;;

	*)
	    echo "invalid input, please input specified letter"

    esac
done
