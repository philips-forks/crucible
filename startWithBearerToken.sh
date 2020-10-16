#!/bin/bash
echo "This will do a git stash and insert the token."
echo "It will then build the docker image and start the containers."

read -n 1 -s -r -p "Press any key to continue"

tokenstring="##token##"
read -p "Enter the token: " token

git stash

sed -i .bak "s/$tokenstring/$token/" app/controllers/smarts_controller.rb
rm app/controllers/smarts_controller.rb.bak
sed -i .bak "s/$tokenstring/$token/" app/models/server.rb
rm app/models/server.rb.bak
sed -i .bak "s/$tokenstring/$token/" app/models/test_result.rb
rm app/models/test_result.rb.bak
sed -i .bak "s/$tokenstring/$token/" app/models/test_run.rb
rm app/models/test_run.rb.bak

docker-compose build
docker-compose up