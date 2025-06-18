#!/bin/bash

# Find the directory that starts with submission_reminder_ (user's app folder)

env_script=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1)

# Check if the directory was found; exit if not found
if [[ ! -d "$env_script" ]]; then
  echo "No submission_reminder_* folder found."
  exit 1
fi
# Set the path to the config file inside the found directory
config_file="$env_script/config/config.env"

# Check if the config file exists; exit if not found
if [[ ! -f "$config_file" ]]; then
  echo "Config file not found at $config_file"
  exit 1
fi
# Prompt the user to enter a new assignment name
read -p "Enter new assignment name: " new_assignment

# Use sed to replace the ASSIGNMENT value in the config.env file
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"

# Confirm the update to the user
echo "Assignment updated to '$new_assignment' in $config_file"

# Run the startup script to check for new non-submissions
bash "$env_script/startup.sh"
