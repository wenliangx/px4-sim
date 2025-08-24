#!/bin/bash
cd "$(dirname "$0")"

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    cp docker-compose.mac.yml docker-compose.override.yml
else
    # Linux
    cp docker-compose.ubuntu.yml docker-compose.override.yml
fi