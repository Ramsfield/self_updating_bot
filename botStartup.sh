#!/bin/bash

# This is the script that will set up and start your bot so that we can update it on the fly using silly trivial methods
# Please make sure you set up SSH keys for git on the system you'll be running it on

# VARIABLES YOU SHOULD CHANGE TO MAKE SENSE WITH YOUR SYSTEM
# PLEASE ALSO FIX PATH IN bot.service

PYTHON="/home/ramsfield/Documents/repos/self_updating_bot/venv/bin/python" #Location of python `which python` should work
PIP="/home/ramsfield/Documents/repos/self_updating_bot/venv/bin/pip" #Location of pip. usually with python. `which pip` helps
WORKING_DIRECTORY="/home/ramsfield/Documents/repos/self_updating_bot" #The location of this source code

# Make sure context works
cd ${WORKING_DIRECTORY}

git pull
"${PIP}" install -r "${WORKING_DIRECTORY}/requirements.txt"

"${PYTHON}" "${WORKING_DIRECTORY}/bot.py"
