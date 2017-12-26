#!/usr/bin/env bash

if pgrep caffeine >/dev/null; then
    echo "Running"
else
    echo "Not Running"
fi
