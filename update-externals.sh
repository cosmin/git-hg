#!/bin/sh

git submodule foreach git checkout master '&&' git pull
