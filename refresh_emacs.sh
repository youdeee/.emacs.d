#!/bin/sh

brew install editorconfig
brew install cmigemo --HEAD

mv inits/el-get/tomorrow-theme/GNU\Emacs/* inits/el-get/tomorrow-theme/
sudo rm -r inits/el-get/tomorrow-theme/*/
rm inits/el-get/tomorrow-theme/.gitignore
rm inits/el-get/tomorrow-theme/*.md

brew install ctags
