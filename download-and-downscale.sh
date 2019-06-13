#! /bin/bash

URL=$1 # url of source video
FFR=$2 # first frame of segment to extract
LFR=$3 # last frame of segment to extract
OUT=$4 # output folder

# download video in output folder
mkdir -p $OUT/gray
mkdir -p $OUT/rgb
wget $URL $OUT

# extract frames from videos using ffmpeg
ffmpeg -i $OUT/$(basename $URL) -f image2 $OUT/tmp-%03d.png

# downscale only selected frame range
PLAMBDA="imscript-lite/plambda" 
BLUR="imscript-lite/blur"
DOWNSA="imscript-lite/downsa"
for i in $(seq $FFR $LFR);
do 
	n=$(printf "$OUT/tmp-%03d.png" $i)
	c=$(printf "$OUT/rgb/%03d.png" $i)
	g=$(printf "$OUT/gray/%03d.png" $i)

	$BLUR -s g 1.2 $n | $DOWNSA f 2 - $c
	$PLAMBDA $c "x[0] x[1] x[2] + + 3 /" -o $g
done
rm $OUT/tmp-???.png $OUT/$(basename $URL)
