#!/bin/bash

echo "{
  \"version\": 4,
  \"configurePresets\": [
    {
      \"name\": \"vcpkg\",
      \"generator\": \"Ninja\",
      \"binaryDir\": \"\${sourceDir}/build\",
      \"cacheVariables\": {
        \"CMAKE_TOOLCHAIN_FILE\": \"\$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake\"
      }
    }
  ]
}" > CMakePresets.json
echo "{
  \"version\": 4,
  \"configurePresets\": [
    {
      \"name\": \"default\",
      \"inherits\": \"vcpkg\",
      \"environment\": {
        \"VCPKG_ROOT\": \"<path/to/vcpkg/root>\"
      }
    }
  ]
}" > CMakeUserPresets.json

echo "CMakeUserPresets.json" >> .gitignore

echo ""
echo "Make sure to run the following and replace <path/to/vcpkg/root> in CMakeUserPresets.json:"
echo ""
echo "echo \$VCPKG_ROOT >> CMakeUserPresets.json"
echo ""
