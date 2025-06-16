#!/bin/bash
read -p "Enter your name " name
person_user="submission_reminder_$name"
case $name in
	*)
        mkdir "$person_user"
        cd "$person_user" || exit
        mkdir app
        cd app
        touch reminder.sh
         cd ..
         mkdir modules
         cd modules
         touch functions.sh
         cd ..
	 mkdir assets
	 cd assets
	 touch submissions.txt
	 cd ..
         mkdir config
         cd config
         touch config.env
         cd ..
         touch startup.sh
         ;;
esac	 
