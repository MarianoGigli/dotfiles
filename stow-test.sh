#!/bin/sh
for dir in bash  bin  common  config  git
do
    stow -Rnvv $dir
done
