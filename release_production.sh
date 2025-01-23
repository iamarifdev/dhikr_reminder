#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Releasing production version${NC}"

# echo
# echo -e "${GREEN}<<<<<<<<<<<<<<<<< Building app bundle >>>>>>>>>>>>>>>>>>>>>${NC}"
# flutter build appbundle --release --obfuscate --split-debug-info=build/obfuscate

echo
echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<< Building apk >>>>>>>>>>>>>>>>>>>>>>>>${NC}"
flutter build apk --release

# echo
# echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<< Building iOS >>>>>>>>>>>>>>>>>>>>>>>>${NC}"
# flutter build ios --release && open ios/Runner.xcworkspace