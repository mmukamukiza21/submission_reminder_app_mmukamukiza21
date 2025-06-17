#!/bin/bash

# auto-detect the directory
env_script=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1)

if [[ ! -d "$env_script" ]]; then
  echo "No submission_reminder_* folder found."
  exit 1
fi

config_file="$env_script/config/config.env"

if [[ ! -f "$config_file" ]]; then
  echo "Config file not found at $config_file"
  exit 1
fi

read -p "Enter new assignment name: " new_assignment

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"

echo "Assignment updated to '$new_assignment' in $config_file"

bash "$env_script/startup.sh"
