#!/bin/bash

# Prompt the user for their name
read -p "Enter your name: " name

# Set the main directory name
person_user="submission_reminder_${name}"

# Create the directory structure
mkdir -p "${person_user}/config"
mkdir -p "${person_user}/app"
mkdir -p "${person_user}/modules"
mkdir -p "${person_user}/assets"
# === config.env ===
cat > "${person_user}/config/config.env" << EOF
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
# === submissions.txt ===
cat > "${person_user}/assets/submissions.txt" << EOF
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, not submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Jennette, Shell Navigation, not submitted
Jeanne, Shell Navigation, not submitted
Nadia, Shell Navigation, submitted
Bruno, Shell Navigation, not submitted
Didier, Shell Navigation, submitted
EOF
# === functions.sh ===
cat > "${person_user}/modules/functions.sh" << 'EOF'

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}

EOF
# === reminder.sh ===
cat > "${person_user}/app/reminder.sh" << 'EOF'

# Source environment variables and helper functions
source "$(dirname "$0")/../config/config.env"
source "$(dirname "$0")/../modules/functions.sh"

# Path to the submissions file
submissions_file="$(dirname "$0")/../assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
EOF
# === startup.sh ===
cat > "${person_user}/startup.sh" << 'EOF'

# Launch the actual app from the scripts folder
bash "$(dirname "$0")/app/reminder.sh"
EOF


# Make all .sh files executable
find "$person_user" -type f -name "*.sh" -exec chmod +x {} \;

echo "Environment successfully setup in: ${person_user}"
