#!/bin/bash

cd $(dirname $0)
mkdir -p ../.backup 2>/dev/null

mv ../arm64 ../.backup/arm64_$(date +%s)
cp -pr ../amd64 ../arm64

find ../arm64 -name "*.yml" | xargs sed -i 's/\(image: edgexfoundry\/[^:]\+\)/\1-arm64/g'

diff -r ../amd64 ../arm64

echo "images in amd64:"
grep -r image ../amd64

echo "images in arm64:"
grep -r image ../arm64