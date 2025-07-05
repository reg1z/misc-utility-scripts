#!/bin/bash

# ------------------------------
# See the open-webui
# quickstart for explanations
# of these commands.
#
# This script assumes you have
# a separate ollama server hosted
# at the OLLAMA_BASE_URL.
#
# https://docs.openwebui.com/getting-started/quick-start
#
# ------------------------------

PORT="11111"
NAME="open-webui"
NAME_NOAUTH="open-webui"
OLLAMA_BASE_URL="http://172.17.0.1:11434" # (default bridge docker0)

docker pull ghcr.io/open-webui/open-webui:main

# With Multiple Account Sign-up + Authentication
#docker run -d -p $PORT:8080 -e OLLAMA_BASE_URL=$OLLAMA_BASE_URL -v open-webui:/app/backend/data --name $NAME_NOAUTH --restart always ghcr.io/open-webui/open-webui:main

# Without all that
docker run -d \
  --network=bridge \
  -p $PORT:8080 \
  -e WEBUI_AUTH=False \
  -e MODEL_PROVIDER=ollama \
  -e OLLAMA_BASE_URL=$OLLAMA_BASE_URL \
  -v open-webui:/app/backend/data \
  --name $NAME_NOAUTH \
  --restart always \
  ghcr.io/open-webui/open-webui:main
