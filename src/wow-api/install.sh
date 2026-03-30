#!/bin/sh
set -e

echo "Activating feature 'WoW Lua API'"

INSTALL_ROOT="$_CONTAINER_USER_HOME/Annotations"

mkdir -p "$INSTALL_ROOT"

download_zip() {
    url="$1"
    target="$2"
	folder="$3"

    tmp_zip="$(mktemp --suffix=.zip)"
    tmp_dir="$(mktemp -d)"

    curl -fsSL "$url" -o "$tmp_zip"
    unzip -q "$tmp_zip" -d "$tmp_dir"
    rm "$tmp_zip"

    rm -rf "$target"

    mv "$tmp_dir"/*/"$folder"/*/ "$target"
    rmdir "$tmp_dir"
}

if [ "$DOWNLOAD_WOW_API" = "true" ]; then
    echo "Downloading Ketho WoW annotations..."

    download_zip "https://github.com/Ketho/vscode-wow-api/archive/refs/heads/master.zip" "$INSTALL_ROOT/Core" "Annotations/Core"
fi

if [ "$DOWNLOAD_FRAMEXML" = "true" ]; then
    echo "Downloading Numy FrameXML annotations..."

    download_zip "https://github.com/NumyAddon/FramexmlAnnotations/archive/refs/heads/${FRAMEXML_VERSION}-mix-into-source.zip" "$INSTALL_ROOT/FrameXML" "Annotations"

	echo "$FRAMEXML_VERSION" > "$INSTALL_ROOT/FrameXML/.flavor"
fi
