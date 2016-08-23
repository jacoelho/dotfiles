#!/bin/sh

for dir in */; do
    stow -v 2 ${dir%*/}
done
