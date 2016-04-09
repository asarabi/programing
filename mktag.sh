#!/bin/sh
rm -rf cscope.files
rm -rf tags

find . -name *.[chsCHS] -print > cscope.files

cscope -b -i cscope.files

ctags -R .
