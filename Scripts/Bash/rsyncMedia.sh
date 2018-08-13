#!/bin/bash

if [ -d "/data/FS/MediaSD/01.Music" ]; then
	rsync -avz --delete "/data/FS/Media/01.Music" "/data/FS/MediaSD/"
fi



