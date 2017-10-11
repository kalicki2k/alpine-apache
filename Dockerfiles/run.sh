#!/bin/bash
#
# Purpose: Starting apache damon...
# Version: 1.0
#

echo "Starting apache daemon..."
httpd -D FOREGROUND
