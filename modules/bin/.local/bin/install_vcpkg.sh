#!/bin/bash

git clone https://github.com/microsoft/vcpkg.git
cd vcpkg && ./bootstrap-vcpkg.sh
echo "VCPKG_ROOT=$PWD" >> $HOME/.bashrc
source $HOME/.bashrc
echo "# vcpkg environment variable" >> $HOME/.bash_profile
echo "export PATH=\"\$PATH:$VCPKG_ROOT\"" >> $HOME/.bash_profile