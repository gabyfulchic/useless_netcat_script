#!/bin/sh

echo $1
if [ $? != 0 ]
then
    var1='false'
else
    var1='true'
fi

echo $2
if [ $? != 0 ]
then
    var2='false'
else
    var2='true'
fi

echo $3
if [ $? != 0 ]
then
    var3='false'
else
    var3='true'
fi

echo $4
if [ "$4" == "udp" ]
then
    var4='true'
else
    var4='false'
fi

# Maintenant suivant les arguments donnés la ligne de commande sera différente
# var1 = hôte distant
# var2 = port précis
# var3 = port de fin de la range var2-var3
# var4 = 'udp' seulement si on veut test l'udp

if [ "$var1" == "true" ]
then
    if [ "$var2" == "true" ]
    then
        if [ "$var3" == "true" ]
        then
            if [ "$var4" == "true" ]
            then
                nc -vu $1 $2-$3 $4 >> /tmp/`date +"%d-%m-%Y"`_netcat.log
            else
                nc -v $1 $2-$3 >> /tmp/`date +"%d-%m-%Y"`_netcat.log
	    fi
        else
            nc -v $1 $2 >> /tmp/`date +"%d-%m-%Y"`_netcat.log
	fi
    else
        nc -v $1 >> /tmp/`date +"%d-%m-%Y"`_netcat.log
    fi
else
    echo "tu as oublié les arguments bonhomme."
fi
