#!/usr/bin/env bash
# vi:syntax=bash
#
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
########## There should be one TERM entry for each colorizable termtype
TERM					Eterm
TERM					ansi
TERM					color-xterm
TERM					con132x25
TERM					con132x30
TERM					con132x43
TERM					con132x60
TERM					con80x25
TERM					con80x28
TERM					con80x30
TERM					con80x43
TERM					con80x50
TERM					con80x60
TERM					cons25
TERM					console
TERM					cygwin
TERM					dtterm
TERM					eterm-color
TERM					gnome
TERM					gnome-256color
TERM					jfbterm
TERM					konsole
TERM					kterm
TERM					linux
TERM					linux-c
TERM					mach-color
TERM					mlterm
TERM					putty
TERM					rxvt
TERM					rxvt-256color
TERM					rxvt-cygwin
TERM					rxvt-cygwin-native
TERM					rxvt-unicode
TERM					rxvt-unicode-256color
TERM					rxvt-unicode256
TERM					screen
TERM					screen-256color
TERM					screen-256color-bce
TERM					screen-bce
TERM					screen-w
TERM					screen.Eterm
TERM					screen.rxvt
TERM					screen.linux
TERM					st
TERM					st-256color
TERM					terminator
TERM					vt100
TERM					xterm
TERM					xterm-16color
TERM					xterm-256color
TERM					xterm-88color
TERM					xterm-color
TERM					xterm-debian

########## Generic types
DIR 					38;5;27		# directory
LINK 					38;5;39		# symbolic link. (If you set this to 'target' instead of a numerical value,
									# the color is as for the file pointed to.)
MULTIHARDLINK			00			# regular file with more than one link
FIFO 					48;5;240	# pipe
SOCK 					48;5;240	# socket
DOOR 					48;5;240	# door
BLK 					48;5;243	# block device driver
CHR 					48;5;243	# character device driver
ORPHAN 					38;5;196	# symlink to nonexistent file, or non-stat'able file
SETUID					37;41		# file that is setuid (u+s)
SETGID					30;43		# file that is setgid (g+s)
CAPABILITY				30;41		# file with capability
STICKY_OTHER_WRITABLE 	38;5;166 	# dir that is sticky and other-writable (+t,o+w)
OTHER_WRITABLE 			38;5;166 	# dir that is other-writable (o+w) and not sticky
STICKY 					37;44 		# dir with the sticky bit set (+t) and not other-writable
EXEC 					38;5;46		# This is for files with execute permission:

########## Scripts and configurations
.bash					03
.zsh					03
.c						03
.cc						03
.conf                   03
.csh					03
.css					03
.html					03
.ini                    03
.js						03
.json					03
.ori                    03
.php					03
.py						03
.sh						03
.sql					03
.xml					03
.yml					03

########## Log files
.log                    38;5;15

########## Fonts
.ttf                    38;5;209
.otf                    38;5;208

########## Known binaries
.phar                   38;5;14
.dat                    38;5;14

########## Markup documents
.md						38;5;226
.mdown					38;5;226
.markdown				38;5;226
.cls					38;5;228
.tex					38;5;228
.sty					38;5;228

########## Documents
.doc					38;5;80
.docx					38;5;80
.odp					38;5;80
.ods					38;5;80
.odt					38;5;80
.pdf					38;5;80
.pps					38;5;80
.ppsx					38;5;80
.txt					38;5;80

########## Image files
.bmp					38;5;48
.cgm					38;5;48
.dl						38;5;48
.emf					38;5;48
.gif					38;5;48
.gl						38;5;48
.jpeg					38;5;48
.jpg					38;5;48
.pbm					38;5;48
.pcx					38;5;48
.pgm					38;5;48
.png					38;5;48
.ppm					38;5;48
.qt						38;5;48
.rm						38;5;48
.rmvb					38;5;48
.svg					38;5;48
.svgz					38;5;48
.tga					38;5;48
.tif					38;5;48
.tiff					38;5;48
.xbm					38;5;48
.xcf					38;5;48
.xpm					38;5;48
.xwd					38;5;48
.yuv					38;5;48

########## Video & sound
.avi					38;5;226
.flc					38;5;226
.fli					38;5;226
.flv					38;5;226
.asf					38;5;226
.m2v					38;5;226
.m4v					38;5;226
.mkv					38;5;226
.mng					38;5;226
.mov					38;5;226
.mp4					38;5;226
.mp4v					38;5;226
.mpeg					38;5;226
.mpg					38;5;226
.nuv					38;5;226
.ogm					38;5;226
.vob					38;5;226
.webm					38;5;226
.wmv					38;5;226
.axv					38;5;226
.anx					38;5;226
.ogv					38;5;226
.ogx					38;5;226
.aac					38;5;226
.au						38;5;226
.flac					38;5;226
.mid					38;5;226
.midi					38;5;226
.mka					38;5;226
.mp3					38;5;226
.mpc					38;5;226
.ogg					38;5;226
.ra						38;5;226
.wav					38;5;226
.axa					38;5;226
.oga					38;5;226
.spx					38;5;226
.xspf					38;5;226

########## Archives	or compressed
.7z						38;5;199
.ace					38;5;199
.arj					38;5;199
.bz2					38;5;199
.bz						38;5;199
.cpio					38;5;199
.deb					38;5;199
.dz						38;5;199
.ear					38;5;199
.gz						38;5;199
.jar					38;5;199
.lz						38;5;199
.lzh					38;5;199
.lzma					38;5;199
.rar					38;5;199
.rpm					38;5;199
.rz						38;5;199
.sar					38;5;199
.tar					38;5;199
.taz					38;5;199
.tbz2					38;5;199
.tbz					38;5;199
.tgz					38;5;199
.tlz					38;5;199
.txz					38;5;199
.tz						38;5;199
.war					38;5;199
.xz						38;5;199
.z						38;5;199
.Z						38;5;199
.zip					38;5;199
.zoo					38;5;199
.deb					38;5;199
.dpkg					38;5;199
