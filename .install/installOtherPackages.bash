#! /usr/bin/env bash

printConfirmation "Do you want to install the numix icon theme?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo add-apt-repository --yes --update \
		ppa:numix/ppa
	sudo apt-get install --assume-yes --quiet \
		numix-icon-theme-circle numix-icon-theme-square numix-gtk-theme
fi

printConfirmation "Do you want to install the Ghostwriter markdown editor?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo add-apt-repository --yes --update \
		ppa:wereturtle/ppa
	sudo apt-get install --assume-yes --quiet \
		ghostwriter
fi
