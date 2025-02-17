#!/bin/bash

# Replace the HOST_NAME in the index.html for container
sed -i.bak 's/HOST_NAME/'"$HOSTNAME"'/g' /usr/share/nginx/html/index.html

# Startup the cmd
exec "$@"
