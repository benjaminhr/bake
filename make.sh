#!/bin/sh
set -e
set -o pipefail

read -p "Directory name: " DIRNAME
# "|| { exit 1; }" if directory name already exists, quit program
cd ~/dev && mkdir $DIRNAME || { exit 1; } && cd $DIRNAME

read -p "HTML [y/n]: " HTML
read -p "CSS [y/n]: " CSS
read -p "JS [y/n]: " JS
read -p "RUBY [y/n]: " RUBY

if [ "$HTML" = "y" ]
then
  touch index.html
  echo '
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="">
    <title>'"$DIRNAME"'</title>
  </head>
  <body>
    <h1>LOL</h1>
  </body>
  </html>' >> index.html
else
  :
fi

if [ "$CSS" = "y" ]
then
  touch main.css
else
  :
fi

if [ "$JS" = "y" ]
then
  touch main.js
else
  :
fi

if [ "$RUBY" = "y" ]
then
  touch app.rb
else
  :
fi

echo "\xE2\x9A\xA1 Great success!\xE2\x9A\xA1"
