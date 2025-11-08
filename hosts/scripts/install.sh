#!/bin/bash

set -euo pipefail

echo "[INFO] Upgrade packages!"
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common