#!/bin/sh

if [ "$(uname)" == 'Darwin' ]; then
    brew install editorconfig
    brew install cmigemo --HEAD
    brew install ctags
    npm install -g cssfmt
#    brew install mono
    echo "darwin!!"
elif [ "$(uname)" == 'Linux' ]; then
    sudo apt-get install cmigemo
    sudo apt-get install ctags
fi

mv inits/el-get/tomorrow-theme/GNU\ Emacs/* inits/el-get/tomorrow-theme/
sudo rm -r inits/el-get/tomorrow-theme/*/
rm inits/el-get/tomorrow-theme/.gitignore
rm inits/el-get/tomorrow-theme/*.md
