#!/bin/bash
#
# update chrome.desktop file to scale x1.5
#


set -e

readonly SCRIPT_NAME=$(basename $0)
readonly DEFAULT_TARGET_PATH=/usr/share/applications/chromium.desktop


target=$DEFAULT_TARGET_PATH
if [ -n "$1" ]; then
    target=$1
fi


if [ -e $target ]; then
    :   # ok, file exists.
else
    echo "Error: file not exists! $target" 1>&2
    exit 1
fi


sed -i.backup -e '/^Exec/s/%U/--force-device-scale-factor=1.5 %U/' $target

exit 0

