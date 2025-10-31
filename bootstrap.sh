#!/bin/bash

echo "[+] PrimeCommandCenter: Initializing System Bootstrap"

# Add Docker group access
usermod -aG docker prime

# Enable Docker on boot
systemctl enable docker
systemctl start docker

# Pull containers
cd /opt/prime
docker compose pull
docker compose up -d

# Optional: Spawn default agents
echo "[+] Spawning initial agents..."
docker exec prime-agent python3 /agents/spawn.py --config /agents/tasks.yaml

echo "[+] Bootstrap complete. PCC is operational."
