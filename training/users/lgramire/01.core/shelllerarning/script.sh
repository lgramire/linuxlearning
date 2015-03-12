#!/bin/sh

#set -x

LOCATION=$1
VERSION=$2
FILETYPE=$3

# Variables Kernel.org
WGET=wget
KERNELORG_PAT="https://www.kernel.org/pub/linux/kernel/v3.x/"
KERNELORG_FILE="linux-"
KERNELORG_VERSION=$VERSION
KERNELORG_FILETYPE=".tar."$FILETYPE
KERNELORG_OURFILE="$KERNELORG_FILE$KERNELORG_VERSION$KERNELORG_FILETYPE"

#echo $KERNELORG_OURFILE

download(){
echo "Verify if Kernel file already exists"
if [ ! -f "$KERNELORG_OURFILE" ];
then
	echo "Downloading file:"
	wget $KERNELORG_PAT$KERNELORG_OURFILE
	tar xf $KERNELORG_OURFILE
else
	echo "Kernel File already exists!"
fi
}
download

exit 0
