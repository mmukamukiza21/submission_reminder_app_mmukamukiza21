# submission_reminder_app_mmukamukiza21
summative in short how i didi it 
# commments
Submission Reminder App
This is a simple Bash-based app that helps track students who have not submitted a specific assignment. It creates a folder structure, loads data, and checks for missing submissions using a startup script

 What This Repository Contains
This repository contains:

create_environment.sh – Sets up the directory structure and initializes the app with necessary files and permissions.

copilot_shell_script.sh – Allows users to update the assignment name and re-check for pending submissions.

README.md – Instructions on how to run the application.
Main script that:

Directory Structure
Once you run create_environment.sh, the script creates a directory named submission_reminder_{yourName} with the following structure:

arduino
Copy
Edit
submission_reminder_{yourName}/
├── config/
│   └── config.env
├── data/
│   └── submissions.txt
├── scripts/
│   ├── reminder.sh
│   ├── functions.sh
│   └── startup.sh
# How to Run
#Clone this repository:
git clone https://github.com/yourusername/submission_reminder_app_yourusername.git
#Make the setup script executable and run it:
chmod +x create_environment.sh
./create_environment.sh
#To change the assignment name later and re-run the check:
chmod +x copilot_shell_script.sh
./copilot_shell_script

# Git Branching
Development work should be done on a branch like feature/setup.

Only create_environment.sh, copilot_shell_script.sh, and README.md should be in the main branch after merging.



#Loads the config and function files
#Prints assignment info
#Runs the reminder check

#This script:

Asks for your name (e.g., "Milliam")

Creates a folder named submission_reminder_Milliam
Inside the folder, it creates:
config/ → Stores environment config
app/ → Contains reminder.sh (main logic)
modules/ → Contains functions like check_submissions
assets/ → Stores data like the submissions list
It also writes all the necessary .sh files and makes them executable
