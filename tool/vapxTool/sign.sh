#!/bin/bash

# Define the certificate identifier or SHA-1 hash
#CERTIFICATE="Apple Development: nenseso@163.com (FTZJFBHM6N)"

# Iterate over all files in the frameworks/ directory
for tool in /Users/husn/Documents/study/vap/vap-master/tool/vapxTool/frameworks/Bento4-SDK-1-5-1-628/bin/*; do
    # Sign each binary with Hardened Runtime enabled
    codesign --force --deep --options runtime --sign F4F2DAC98077CA360B0C496B4A0EE0EE6A7B2476 "$tool"
    
    # Verify the signature
    codesign --verify --verbose "$tool"
done

echo "All binaries have been signed and verified."