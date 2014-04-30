#! /usr/bin/env sh
#
# This makes a simple html-formatted pdf for quick publishing/drafting.

touch tempfile # We'll stuff all the pages into here.
files=$(cat book-order) # All the files we'll be cat-ing to the above
stamp=$(date -d @`date +%s` "+%Y%m%d") # Get today's date.
savename="CCARPS-$stamp"
echo "Collecting files..."
for f in $files # "For each line in file..."
do
	cat $f >> tempfile # Another one bites the dust!
	echo "$f added to collection."
done

echo "Doing some fancy Markdown->HTML->PDF voodoo..."
# Now this is the best part...
markdown tempfile | htmldoc --book --cont --headfootsize 8.0 --linkcolor blue --linkstyle plain --format pdf14 - > $savename.pdf

echo "Cleaning up..."
# Remove evidence we were here.
rm tempfile
echo "Done!"
