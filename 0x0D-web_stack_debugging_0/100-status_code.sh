#!/bin/bash
# This script displays only the status code of an http response
curl -s -o "/dev/null" -w "%{http_code}" "$1"
