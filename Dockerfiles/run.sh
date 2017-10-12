#!/bin/sh
#
# Purpose: Starting apache damon...
# Version: 1.0
#

#
# Make sure we're not confused by old, incompletely-shutdown httpd context after restarting the container.
# httpd won't start correctly if it thinks it is already running.
#

rm -rf /run/apache2/*
echo "Starting apache daemon..."
exec /usr/sbin/httpd -D FOREGROUND
