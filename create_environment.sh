#!/bin/bash

#Creating directory ~submission_reminder_Sedem~
echo "Enter your name"
read NAME
mkdir -p submission_reminder_$NAME

#Creating the sub-directories
mkdir -p submission_reminder_$NAME/app
touch submission_reminder_$NAME/app/reminder.sh
mkdir -p submission_reminder_$NAME/modules
touch submission_reminder_$NAME/modules/functions.sh
mkdir -p submission_reminder_$NAME/assets
touch submission_reminder_$NAME/assets/submissions.txt
mkdir -p submission_reminder_$NAME/config
touch submission_reminder_$NAME/config/config.env
touch submission_reminder_$NAME/startup.sh


chmod +x "submission_reminder_$NAME/app/reminder.sh"
chmod +x "submission_reminder_$NAME/modules/functions.sh"
chmod +x "submission_reminder_$NAME/startup.sh"

#Adding content to remidner.sh
cat << 'EOF' > submission_reminder_$NAME/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
#Shell Navigation
echo "Assignment: $ASSIGNMENT_1"
echo "Days remaining to submit: $DAYS_REMAINING_1 days"
echo "--------------------------------------------"

check_submissions "$submissions_file" "$ASSIGNMENT_1"

#Git
echo ""
echo "Assignment: $ASSIGNMENT_2"
echo "Days remaining to submit: $DAYS_REMAINING_2 days"
echo "--------------------------------------------"

check_submissions "$submissions_file" "$ASSIGNMENT_2"

#Shell Basics
echo ""
echo "Assignment: $ASSIGNMENT_3"
echo "Days remaining to submit: $DAYS_REMAINING_3 days"
echo "--------------------------------------------"

check_submissions "$submissions_file" "$ASSIGNMENT_3"
EOF

#Adding content to functions.sh
cat << 'EOF' >  submission_reminder_$NAME/modules/functions.sh

#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file="$1"
    local assignment_name="$2"
    echo "Checking submissions in \"$submissions_file\""

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$assignment_name" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $assignment assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF

#Adding content to submissions.txt
cat << EOF >  submission_reminder_$NAME/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Sedem, Shell Basics, not submitted
Kofi, Git, submitted
Kyle, Shell Navigation, not submitted
Oba, Git, submitted
Lamine, Git, not submitted

EOF

#Adding content to config.env
cat << EOF > submission_reminder_$NAME/config/config.env
# This is the config file
ASSIGNMENT_1="Shell Navigation"
ASSIGNMENT_2="Git"
ASSIGNMENT_3="Shell Basics"
DAYS_REMAINING_1=2
DAYS_REMAINING_2=6
DAYS_REMAINING_3=4
EOF

#Adding content to startup.sh
cat << EOF > submission_reminder_$NAME/startup.sh
#!/bin/bash

#Running script and validating
./app/reminder.sh

if [[ $? -eq 0 ]]; then
  echo "Reminder script executed successfully."
else
  echo "Error: Reminder script failed to run."
fi

EOF
