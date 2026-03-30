#!/bin/sh
set -e

echo "Activating feature 'WoW Lua API'"

INSTALL_ROOT="$_REMOTE_USER_HOME/Annotations"

if ! command -v wget > /dev/null 2>&1 || ! command -v unzip > /dev/null 2>&1; then
    apt-get update
    apt-get install -y --no-install-recommends wget unzip
    rm -rf /var/lib/apt/lists/*
fi

download_zip() {
    url="$1"
    target="$2"
	folder="$3"

    tmp_zip="$(mktemp --suffix=.zip)"
    tmp_dir="$(mktemp -d)"

	echo "Download from $url to $tmp_zip"
    wget -q "$url" -O "$tmp_zip"

	echo "Unzip $tmp_zip to $tmp_dir"
    unzip -q "$tmp_zip" -d "$tmp_dir"
    rm "$tmp_zip"

    rm -rf "$target"
	mkdir -p "$target"

	echo "Move from $tmp_dir/*/$folder/*/ to $target"
    mv "$tmp_dir/*/$folder/*/" "$target"

    rmdir "$tmp_dir"
}

if [ "$DOWNLOAD_WOW_API" = "true" ]; then
    echo "Downloading Ketho's WoW annotations..."

    download_zip "https://github.com/Ketho/vscode-wow-api/archive/refs/heads/master.zip" "$INSTALL_ROOT/Core" "Annotations/Core"
fi

if [ "$DOWNLOAD_FRAMEXML" = "true" ]; then
    echo "Downloading Numy's FrameXML annotations..."

    download_zip "https://github.com/NumyAddon/FramexmlAnnotations/archive/refs/heads/${FRAMEXML_VERSION}-mix-into-source.zip" "$INSTALL_ROOT/FrameXML/$FRAMEXML_VERSION" "Annotations"
fi
