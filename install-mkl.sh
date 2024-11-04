#!/bin/bash
set -eux

SCRIPT_DIR=$(cd $(dirname $0); pwd)

VERSION="2025.0.0.940"
PREFIX=intel-onemkl-${VERSION}_offline

curl -sfLO http://registrationcenter-download.intel.com/akdlm/IRC_NAS/79153e0f-74d7-45af-b8c2-258941adf58a/${PREFIX}.sh
chmod +x ${PREFIX}.sh
./${PREFIX}.sh -a -s --eula accept --ignore-errors --install-dir /opt/intel
