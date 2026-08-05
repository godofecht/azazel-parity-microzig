#!/bin/sh
set -eu
MZ_COMMIT=aabcd3e1824adac6aa3feca8023d50ee0ccbf8fc
DIR=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$DIR/vendor"
if [ -f "$DIR/vendor/flags.zig" ]; then echo "already staged"; exit 0; fi
curl -sL "https://raw.githubusercontent.com/ZigEmbeddedGroup/microzig/$MZ_COMMIT/tools/flags/src/root.zig" -o "$DIR/vendor/flags.zig"
echo "flags.zig staged"
