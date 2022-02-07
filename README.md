# gthumb_convert_video

Convert Videos out of Gthumb

My Standardprocess to reduce Videos Drastically in Size to store them Longterm

derived from https://github.com/paskalito/gthumb_make_panorama

### Install / Update

#### Dependencies
The Following Programs must be Installed (Install them from your Pakage manager)
- HandbrakeCLI


#### 1 Install/Update the Script
Open a **Terminal**, **Paste** the Following **Code** and hit **Enter**, **Type** in your **Password** when are asked to
````
cd /tmp && wget https://raw.githubusercontent.com/paskalito/gthumb_convert_video/main/gthumb_convert_video.sh && sudo chmod +x gthumb_convert_video.sh && sudo mv -f gthumb_convert_video.sh /usr/local/bin/gthumb_convert_video.sh
````
_In Case you want to Update to a newer Version of the Script just run this Command again, and you are good to go_

#### 2 Setup the Custom Script in gthumb
1. Open gthumb
2. In the Top Bar click
3. Toolbar > Personalize... > New

Name: `Convert Video`

Command: `mkdir -p /tmp/gthumb-convert-video && cp %F /tmp/gthumb-convert-video && paplay /usr/share/sounds/freedesktop/stereo/complete.oga & sh /usr/local/bin/gthumb_convert_video.sh %P`

Keyboardshortcut: `as you like :D (highly recomended)`

4. Save > Ok > Happy video converting!

### Usage
1. Select any Amount of videos
2. Go to **Toolbar** and click **Convert Video ** (Or use your **Shortcut**)
3. Wait for the converted Video to appear next to your original videofile (in gthumb)

