#!/usr/bin/env bash

if [[ -z "$1" ]]
then
    echo "ecrit un commentaire mon esti"
    exit 1
fi

git add packages/lane_pp/scripts/lane_pp_node.py
git commit -m "$1"
git push
dts devel build --push -u tobic

docker -H daffybot.local pull tobic/pp -a
dts duckiebot demo --demo_name lane_pp --package_name lane_pp --duckiebot_name daffybot --image tobic/pp:v1-arm32v7
docker -H daffybot.local logs -f demo_lane_pp
