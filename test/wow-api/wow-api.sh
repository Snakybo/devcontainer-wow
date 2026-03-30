#!/bin/bash

set -e

source dev-container-features-test-lib

INSTALL_ROOT="$_REMOTE_USER_HOME/Annotations"

check "Ketho's annotations directory does not exist" ! test -d "$INSTALL_ROOT/Core"

check "Numy's FrameXML directory does not exist" ! test -d "$INSTALL_ROOT/FrameXML"

reportResults
