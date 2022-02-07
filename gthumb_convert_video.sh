# Custom Command to put into gthumb
# mkdir -p /tmp/gthumb-convert-video && cp %F /tmp/gthumb-convert-video && paplay /usr/share/sounds/freedesktop/stereo/complete.oga & sh /usr/local/bin/gthumb_convert_video.sh %P


if hash HandBrakeCLI 2>/dev/null; then


	### Setup The Path for the Hotfolder

	# Create a Folder in /tmp and cd into it
	mkdir /tmp/gthumb-convert-video
	cd /tmp/gthumb-convert-video
	
	# Set A Variabel for a Unique FolderName
	NOW=$(date +"%Y-%m-%d %H:%M:%S")
	# Create that Folder
	mkdir "$NOW"
	# Wait in case files are still Copying // Workaround because apparently cp does not actually wait till finished.
	sleep 2
	# Move all the video files into that Folder
	mv *.* "$NOW"
	# cd into that Folder
	cd "$NOW"


	### Do the Converstion

	for filename in *.*; do
		# the handbrake convert code
		# added nice to which starts the converting process in lowes priority so you can still use your computer
		# HandBrakeCLI -i "$filename" -o "${filename%.*}_converted.m4v" --preset="High Profile"
		nice -n 19 HandBrakeCLI -i "$filename" -o "${filename%.*}_converted.m4v" --preset="Fast 1080p30"
		mv "${filename%.*}_converted.m4v" "$1"/
		rm "$filename"
	done

	notify-send 'Video Conversion Finished' 'Check it out!' -u normal


	### Cleanup


	# Delete our Temporary Workfolder
	rm -rf ../"$NOW"

else
	### Notify for Missing dependencies
	echo ERROR: Could not find HandBrakeCLI >&2
	echo HandBrakeCLI needs to installed and in standardpath for convert_video to work >&2
		
	notify-send 'ERROR: Could not find HandBrakeCLI' 'HandBrakeCLI needs to installed and in standardpath for convert_video to work	> Please install it and try again.' -u critical -i face-worried
	# delete the Copied Files
	rm /tmp/gthumb-convert-video/*.*
fi
