#!/bin/bash

git add . --all
git commit -m $1
git push origin master
git push heroku master
