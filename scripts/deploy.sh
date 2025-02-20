#!/bin/bash
# Blue-Green deployment switcher script
# Usage: ./deploy.sh blue   OR   ./deploy.sh green

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [blue|green]"
    exit 1
fi

TARGET=$1

if [ "$TARGET" != "blue" ] && [ "$TARGET" != "green" ]; then
    echo "Invalid target. Use 'blue' or 'green'."
    exit 1
fi

echo "Switching active deployment to $TARGET..."

# Copy the corresponding Nginx configuration file
if [ "$TARGET" = "blue" ]; then
    cp nginx/blue.conf nginx/default.conf
else
    cp nginx/green.conf nginx/default.conf
fi

# Restart the Nginx container to apply the new configuration
docker-compose restart nginx

echo "Deployment switched to $TARGET."
