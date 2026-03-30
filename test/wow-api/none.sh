#!/bin/bash

set -e

source dev-container-features-test-lib

INSTALL_ROOT="$_REMOTE_USER_HOME/Annotations"

check "Ketho's annotations directory exists" test -d "$INSTALL_ROOT/Core"
check "Ketho's annotations contain Lua files" test -n "$(find "$INSTALL_ROOT/Core" -name '*.lua' | head -1)"

check "Numy's FrameXML directory does not exist" ! test -d "$INSTALL_ROOT/FrameXML"

reportResults
