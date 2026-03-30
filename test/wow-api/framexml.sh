#!/bin/bash

set -e

source dev-container-features-test-lib

INSTALL_ROOT="$_CONTAINER_USER_HOME/Annotations"

check "Ketho's annotations directory does not exist" ! test -d "$INSTALL_ROOT/Core"

check "Numy's FrameXML directory exists" test -d "$INSTALL_ROOT/FrameXML"
check "Numy's FrameXML contains Lua files" test -n "$(find "$INSTALL_ROOT/FrameXML" -name '*.lua' | head -1)"

reportResults
