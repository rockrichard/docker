#!/bin/bash

##
## Create Persistent Data 
##
# sudo mkdir -f ~/disks/data/nexus
# sudo chown -R 200 ~/disks/data/nexus
docker run -td -p 8082:8081 --name nexus \
      -v ~/disks/data/nexus:/nexus-data \
      -e NEXUS_CONTEXT=/ \
      sonatype/docker-nexus3

##
## Verify
##      
# docker logs -f nexus

# Ref: https://github.com/sonatype/docker-nexus3  
# Login: admin/admin123    