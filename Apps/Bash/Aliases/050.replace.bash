#!/usr/bin/env bash
# vi:syntax=bash

# ●▬▬▬▬▬๑۩  Functions ۩๑▬▬▬▬▬●

##### Removes garbage tags lines form a diff file
##### $1: The file name
function diffClean()
{
	cat "$1" |\
	/usr/bin/env perl -0pe "s/^diff --git.*\n//mg" |\
	/usr/bin/env perl -0pe "s/index .*\n//mg" |\
	tee "$1"
}
