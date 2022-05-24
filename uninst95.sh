#!/bin/sh
if [[ "$EUID" -ne 0 ]];
	  then echo "Please run sudo."
		    exit
else

	  [[ "$EUID" -ne 1 ]];

fi

echo "Are you sure you want to completely remove windows 95?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "removing virtual win95" && ./remw95.sh; exit;;
        No ) exit;;
    esac
done

#echo "win95 uninstalled."
