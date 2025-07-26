#!/bin/sh
echo "$MESSAGE"> /usr/share/nginx/html/index.html
exec nginx -g "daemon off;"
