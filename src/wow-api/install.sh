#!/bin/sh
set -e

echo "Activating feature 'WoW Lua API'"

echo "Install WoW API? ${DOWNLOAD_WOW_API}"
echo "Install FrameXML? ${DOWNLOAD_FRAMEXML}"

INSTALL_ROOT="$_CONTAINER_USER_HOME/Annotations"

mkdir -p "$INSTALL_ROOT"

if [ "$DOWNLOAD_WOW_API" ]; then
	echo "Downloading Ketho WoW annotations..."

fi

if [ "${DOWNLOAD_FRAMEXML}" ]; then
	echo "Downloading Numy FrameXML annotations..."
fi
