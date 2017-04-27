#!/bin/bash
# créer un dossier a partager entre le container et la machine hot
mkdir /opt/qt-projets
chmod 777 /opt/qt-projets
#ajouter une commande direct qui permet de lancer le docker qt
DISPLAY="$DISPLAY"
echo "nvidia-docker run -ti --rm -e DISPLAY=\$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /opt/qt-projets:/home/developer/qt-projets qt" > /usr/local/bin/qt-docker
chmod +x /usr/local/bin/qt-docker
