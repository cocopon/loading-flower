#!/bin/bash

DELAY=1
LOOP=0
DISPOSE=Background
INPUT=tmp/*.png
OUTPUT=loading.gif

cd $(dirname $0)
convert\
	-delay $DELAY\
	-loop $LOOP\
	-alpha set\
	-dispose $DISPOSE\
	$INPUT\
	$OUTPUT

# If you prefer a transparent background,
# use `-transparent` option.
