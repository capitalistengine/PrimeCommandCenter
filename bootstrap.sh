#!/bin/bash

echo "[+] PrimeCommandCenter: System Bootstrap Initializing"

# Grant docker access to current user (assumes 'prime' user exists)
usermod -aG docker prime

# Enable + start Docker
systemctl enable docker
systemctl start docker

# Pull & deploy agent stack
cd /opt/prime
docker compose pull
docker compose up -d

# Wait briefly for containers to come online
sleep 5

# Optional: spawn test agents inside container
echo "[+] Spawning initial agent batch..."
docker exec prime-agent python3 /agents/spawn.py --config /agents/tasks.yaml

echo "[+] PrimeCommandCenter is operational."
