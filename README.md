# Submission Reminder Application Setup

This repository contains a shell script (`create_environment.sh`) to set up the environment for the Submission Reminder application. This application helps track student submissions for assignments and sends reminders to those who haven't submitted.

## Setup Instructions

1.  **Clone the Repository (Optional):** If you've downloaded this as a zip file, skip this step. If you're using Git, clone the repository to your local machine:

    ````bash
    git clone [https://github.com/](https://github.com/)[your_username]/submission_reminder_setup.git  # Replace with your repo URL
    cd submission_reminder_setup
    ````

2.  **Run the Setup Script:** Make the `create_environment.sh` script executable and then run it:

    ````bash
    chmod +x create_environment.sh
    ./create_environment.sh
    ````

    The script will prompt you for your name. This name will be used to create the main directory for the application.

3.  **Navigate to the Application Directory:** After the script finishes, a directory named `submission_reminder_{yourName}` will be created (where `{yourName}` is the name you entered). Navigate into this directory:

    ````bash
    cd submission_reminder_{yourName}  # Replace with the actual directory name
    ````

## Directory Structure

The `create_environment.sh` script will create the following directory and file structure:

Markdown

# Submission Reminder Application Setup

This repository contains a shell script (`create_environment.sh`) to set up the environment for the Submission Reminder application. This application helps track student submissions for assignments and sends reminders to those who haven't submitted.

## Setup Instructions

1.  **Clone the Repository (Optional):** If you've downloaded this as a zip file, skip this step. If you're using Git, clone the repository to your local machine:

    ````bash
    git clone [https://github.com/](https://github.com/)[your_username]/submission_reminder_setup.git  # Replace with your repo URL
    cd submission_reminder_setup
    ````

2.  **Run the Setup Script:** Make the `create_environment.sh` script executable and then run it:

    ````bash
    chmod +x create_environment.sh
    ./create_environment.sh
    ````

    The script will prompt you for your name. This name will be used to create the main directory for the application.

3.  **Navigate to the Application Directory:** After the script finishes, a directory named `submission_reminder_{yourName}` will be created (where `{yourName}` is the name you entered). Navigate into this directory:

    ````bash
    cd submission_reminder_{yourName}  # Replace with the actual directory name
    ````

## Directory Structure

The `create_environment.sh` script will create the following directory and file structure:

````submission_reminder_{yourName}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
````
## Running the Application

To run the application, execute the `startup.sh` script:

```bash
./startup.sh
