#!/bin/sh

rm init.el*
git pull origin master
sed -ie 's/147/115/g' init.el
sed -ie 's/45/32/g' init.el
rm init.ele
