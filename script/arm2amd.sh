#!/bin/bash

cd $(dirname $0)
mkdir -p ../.backup 2>/dev/null

mv ../amd64 ../.backup/amd64_$(date +%s)
cp -pr ../arm64 ../amd64

find ../amd64 -name "*.yml" | xargs sed -i 's/-arm64//g'

diff -r ../arm64 ../amd64

echo "images in amd64:"
grep -r image ../amd64

echo "images in arm64:"
grep -r image ../arm64