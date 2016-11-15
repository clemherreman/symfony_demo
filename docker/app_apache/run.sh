#!/bin/bash

chmod 777 -R var/cache var/logs

echo "RUN apache"
apache2-foreground
