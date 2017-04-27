#!/bin/bash

#ajouter une commande direct qui permet de lancer le docker qt
echo "nvidia-docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$(whoami)/qt-projets:/home/developer/qt-projets qt" > /usr/local/bin/qt-docker
chmod +x /usr/local/bin/qt-docker
