#!/bin/bash

# by Andy Maloney
# http://asmaloney.com/2013/07/howto/packaging-a-mac-os-x-application-using-a-dmg/

# Modified by Jason Borowski (esc0rtd3w)
# http://www.crackacademy.com


# make sure we are in the correct dir when we double-click a .command file
dir=${0%/*}
if [ -d "$dir" ]; then
  cd "$dir"
fi


# Set defaults for input files
APP_NAME="BLANK"
APP_EXE_NAME="BLANK"
VERSION="1.0.0"
DMG_BACKGROUND_IMG="background.png"

# Set window variables for dimensions
axisX=920 # default 920
axisY=510 # default 440
axisXa=410 # default 400
axisYa=100 # default 100

# Set positions for Game icon
posGameIconX=160  # default 160
posGameIconY=205  # default 205

# Set positions for Applications folder
posAppFolderX=360  # default 360
posAppFolderY=205  # default 205

# Set icon size
sizeIcon=72  # default 72

# Set Sleep Timer after mounting Temp DMG Image
SLEEP_TIMER=6  # default 2



# Get AppName
#clear
#echo "Enter {APP_NAME}.app Name and press ENTER:"
#echo ""

#read APP_NAME_TEMP

#case "$APP_NAME_TEMP" in

#*)
#APP_NAME="$APP_NAME_TEMP"
#;;

#esac

# Remove the .app from end to get NAME_ONLY
APP_NAME=$(ls | grep .app | sed "s/....$//")


# Get AppExeName
#clear
#echo "Enter Contents/MacOS/{APP_EXE_NAME} and press ENTER:"
#echo ""
#read APP_EXE_NAME_TEMP

#case "$APP_EXE_NAME_TEMP" in

#*)
#APP_EXE_NAME="$APP_EXE_NAME_TEMP"
#;;

#esac

cd "$dir/${APP_NAME}.app/Contents/MacOS"
APP_EXE_NAME=$(ls)

clear
echo "$APP_EXE_NAME"
echo ""
echo ""
echo "If above lists MORE THAN ONE file, type name and press ENTER"
echo ""
echo "If there is only ONE file listed above, then just press ENTER"
echo ""

read APP_EXE_NAME_TEMP

case "$APP_EXE_NAME_TEMP" in

"")
APP_EXE_NAME="$APP_EXE_NAME"
;;

*)
APP_EXE_NAME="$APP_EXE_NAME_TEMP"
;;

esac


# Get back out to main working directory
cd "$dir"


# Get Version Number
clear
echo "Enter Version Number and press ENTER:"
echo ""
echo "Example: 1.0.0"
echo ""
read VERSION_TEMP

case "$VERSION_TEMP" in

"")
VERSION="1.0.0"
;;

*)
VERSION="$VERSION_TEMP"
;;

esac

# Get background PNG
clear
echo "Enter your background PNG image filename and press ENTER:"
echo ""
read DMG_BACKGROUND_IMG_TEMP

case "$DMG_BACKGROUND_IMG_TEMP" in

"")
DMG_BACKGROUND_IMG="background.png"
;;

*)
DMG_BACKGROUND_IMG="$DMG_BACKGROUND_IMG_TEMP"
;;

esac


clear
echo "Working..."
echo ""

# MOVED TO TOP!!!
# set up your app name, version number, and background image file name
#APP_NAME=""
#APP_EXE_NAME=""
#VERSION="1.0.0"
#DMG_BACKGROUND_IMG="background.png"

# you should not need to change these
APP_EXE="${APP_NAME}.app/Contents/MacOS/${APP_EXE_NAME}"

#VOL_NAME="${APP_NAME} ${VERSION}"
VOL_NAME="${APP_NAME}"
DMG_TMP="${VOL_NAME}.temp.dmg"
DMG_FINAL="${VOL_NAME}.dmg"         # final DMG name will be "{APP_NAME}.dmg"
STAGING_DIR="./temp"             # we copy all our stuff into this dir


# Check the background image DPI and convert it if it isn't 72x72
_BACKGROUND_IMAGE_DPI_H=`sips -g dpiHeight ${DMG_BACKGROUND_IMG} | grep -Eo '[0-9]+\.[0-9]+'`
_BACKGROUND_IMAGE_DPI_W=`sips -g dpiWidth ${DMG_BACKGROUND_IMG} | grep -Eo '[0-9]+\.[0-9]+'`

if [ $(echo " $_BACKGROUND_IMAGE_DPI_H != 72.0 " | bc) -eq 1 -o $(echo " $_BACKGROUND_IMAGE_DPI_W != 72.0 " | bc) -eq 1 ]; then
   echo "WARNING: The background image's DPI is not 72.  This will result in distorted backgrounds on Mac OS X 10.7+."
   echo "         I will convert it to 72 DPI for you."
   
   _DMG_BACKGROUND_TMP="${DMG_BACKGROUND_IMG%.*}"_dpifix."${DMG_BACKGROUND_IMG##*.}"

   sips -s dpiWidth 72 -s dpiHeight 72 ${DMG_BACKGROUND_IMG} --out ${_DMG_BACKGROUND_TMP}
   
   DMG_BACKGROUND_IMG="${_DMG_BACKGROUND_TMP}"
fi

# clear out any old data
rm -rf "${STAGING_DIR}" "${DMG_TMP}" "${DMG_FINAL}"

# copy over the stuff we want in the final disk image to our staging dir
echo ""
echo ""
echo "Copying files from ${APP_NAME}.app to Temp Directory..."
echo ""
mkdir -p "${STAGING_DIR}"
cp -rpf "${APP_NAME}.app" "${STAGING_DIR}"
# ... cp anything else you want in the DMG - documentation, etc.

pushd "${STAGING_DIR}"

# strip the executable
echo ""
echo ""
echo "Stripping ${APP_EXE}..."
echo ""
strip -u -r "${APP_EXE}"

# compress the executable if we have upx in PATH
#  UPX: http://upx.sourceforge.net/
if hash upx 2>/dev/null; then
   echo "Compressing (UPX) ${APP_EXE}..."
   echo ""
   upx -9 "${APP_EXE}"
fi

# ... perform any other stripping/compressing of libs and executables

popd

# figure out how big our DMG needs to be
#  assumes our contents are at least 1M!
SIZE=`du -sh "${STAGING_DIR}" | sed 's/\([0-9\.]*\)M\(.*\)/\1/'` 
SIZE=`echo "${SIZE} + 1.0" | bc | awk '{print int($1+0.5)}'`


# Get current size and offer to increase it
# This solves "Out of Disk Space" errors when building DMG
#echo ""
#echo ""
#echo "Current Size for Temp DMG Image File: ${SIZE}"
#echo ""
#echo ""
#echo "Enter New Size for Temp DMG Image File (Roughly 6%+ Higher): "
#echo ""
#read SIZE_TEMP

#case "$SIZE_TEMP" in

#*)
#SIZE="$SIZE_TEMP"
#;;

#esac

# New auto method to add 7% to SIZE
SIZE_NEW=$(awk "BEGIN {print ${SIZE}*0.07+${SIZE}}")

# Now set SIZE to SIZE_NEW
SIZE="$SIZE_NEW"


if [ $? -ne 0 ]; then
   echo "Error: Cannot compute size of staging dir"
   echo ""
   exit
fi

# create the temp DMG file
echo ""
echo ""
echo "Creating Temp DMG Image File...."
echo ""
hdiutil create -srcfolder "${STAGING_DIR}" -volname "${VOL_NAME}" -fs HFS+ \
      -fsargs "-c c=64,a=16,e=16" -format UDRW -size ${SIZE}M "${DMG_TMP}"

echo ""
echo ""
echo "Created DMG: ${DMG_TMP}"
echo ""


echo ""
echo ""
echo "Mounting Temp DMG Image File...."
echo ""
# mount it and save the device
DEVICE=$(hdiutil attach -readwrite -noverify "${DMG_TMP}" | \
         egrep '^/dev/' | sed 1q | awk '{print $1}')
         
sleep ${SLEEP_TIMER}

# add a link to the Applications dir
echo ""
echo ""
echo "Add link to /Applications"
echo ""
pushd /Volumes/"${VOL_NAME}"
ln -s /Applications
popd

# add a background image
echo ""
echo ""
echo "Adding Background Image...."
echo ""
mkdir /Volumes/"${VOL_NAME}"/.background
cp "${DMG_BACKGROUND_IMG}" /Volumes/"${VOL_NAME}"/.background/


echo ""
echo ""
echo "Setting Window Properties...."
echo ""

# tell the Finder to resize the window, set the background,
#  change the icon size, place the icons in the right position, etc.

echo '
   tell application "Finder"
     tell disk "'${VOL_NAME}'"
           open
           set current view of container window to icon view
           set toolbar visible of container window to false
           set statusbar visible of container window to false
           #set the bounds of container window to {400, 100, 920, 440}
           set the bounds of container window to {'${axisXa}', '${axisYa}', '${axisX}', '${axisY}'}
           set viewOptions to the icon view options of container window
           set arrangement of viewOptions to not arranged
           #set icon size of viewOptions to 72
           set icon size of viewOptions to '${sizeIcon}'
           set background picture of viewOptions to file ".background:'${DMG_BACKGROUND_IMG}'"
           #set position of item "'${APP_NAME}'.app" of container window to {160, 205}
           #set position of item "Applications" of container window to {360, 205}
           set position of item "'${APP_NAME}'.app" of container window to {'${posGameIconX}', '${posGameIconY}'}
           set position of item "Applications" of container window to {'${posAppFolderX}', '${posAppFolderY}'}
           close
           open
           update without registering applications
           delay 2
     end tell
   end tell
' | osascript

sync

echo ""
echo ""
echo "Unmounting Temp DMG Image File...."
echo ""
# unmount it
hdiutil detach "${DEVICE}"

# now make the final image a compressed disk image
echo ""
echo ""
echo "Creating Final DMG Image File"
echo ""
hdiutil convert "${DMG_TMP}" -format UDZO -imagekey zlib-level=9 -o "${DMG_FINAL}"

# clean up
rm -rf "${DMG_TMP}"
rm -rf "${STAGING_DIR}"

echo ""
echo ""
echo 'Done.'
echo ""

exit