#!/bin/bash


docker run -td -p 8081:80 -e "DRUPAL_VERSION=drupal-7" -e "DRUPAL_SITE_NAME=PD2" boran/drupal
