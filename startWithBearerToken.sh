#!/bin/bash
echo "This will do a git stash and insert the token."
echo "It will then build the docker image and start the containers."

read -n 1 -s -r -p "Press any key to continue"

tokenstring = "##token##"
read -p "Enter the token: " token

git stash

sed -i "s/$tokenstring/$token/" app/controllers/smarts_controller.rb
sed -i "s/$tokenstring/$token/"app/models/server.rb
sed -i "s/$tokenstring/$token/" app/models/test_result.rb
sed -i "s/$tokenstring/$token/" app/models/test_run.rb