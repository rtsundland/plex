#!/bin/sh

docker-compose -f volumes.yaml -f plex.yaml -f tautulli.yaml up -d --build
