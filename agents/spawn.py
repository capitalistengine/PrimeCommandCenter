import yaml
import time

with open('/agents/tasks.yaml') as f:
    tasks = yaml.safe_load(f)

for task in tasks:
    print(f"[+] Spawning agent: {task['name']}")
    time.sleep(1)
    print(f"    - Goal: {task['goal']}")
    print("    - Agent completed round 1.\n")
