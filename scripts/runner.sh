#!/usr/bin/env bash
echo "Fetching credentials from $REGISTRY_USERS"

curl -o /etc/nginx/.htpasswd $REGISTRY_USERS

/usr/sbin/nginx -c /etc/nginx/nginx.conf
