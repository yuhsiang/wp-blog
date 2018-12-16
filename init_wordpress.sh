#!/bin/bash

# create dependency files/folders
mkdir www
mkdir db

# run containers
docker-compose -f docker-compose.yml up -d
