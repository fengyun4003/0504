#!/bin/bash
# This command instructs the script to exit immediately if any command returns a non-zero (error) status. It ensures that the script stops at the first failure, preventing further execution.
set -e

# if the environment variable GITHUB_EVENT_PATH is set and contains a non-empty value (-n checks if the string is non-empty).
if [ -n "$GITHUB_EVENT_PATH" ];
then
    EVENT_PATH=$GITHUB_EVENT_PATH
# checks whether a file named sample_push_event.json exists in the current directory (-f checks if a file exists).
elif [ -f ./sample_push_event.json ];
then
    EVENT_PATH='./sample_push_event.json'
    LOCAL_TEST=true
else
    echo "No JSON data to process! :("
    exit 1
fi

# The env command prints all the environment variables, which can be useful for debugging or logging the current environment state.
env

# Uses the jq tool (a command-line JSON processor) to pretty-print the JSON data from the file specified by EVENT_PATH. The < operator redirects the content of the file into jq.
jq . < $EVENT_PATH

# Extracts the commit messages and the head commit message from the JSON file.
# The grep command searches for the keyword (passed as an argument to the script) in a case-insensitive (-i) and quiet (-q, suppresses output) mode. If the keyword is found, the condition is true.
if jq '.commits[].message, .head_commit.message' < $EVENT_PATH | grep -i -q "$*";
then
    echo "Found keyword."
# Exit gracefully if no keyword is found
else
    echo "Nothing to process."
fi
