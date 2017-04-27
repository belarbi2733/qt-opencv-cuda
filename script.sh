#!/bin/bash
# créer un dossier a partager entre le container et la machine hot
mkdir /home/$(whoami)/qt-projets
chmod 777 /home/$(whoami)/qt-projets
DISPLAY="$DISPLAY"
#ajouter une commande direct qui permet de lancer le docker qt
echo "nvidia-docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$(whoami)/qt-projets:/home/developer/qt-projets qt" > /usr/local/bin/qt-docker
chmod +x /usr/local/bin/qt-docker
