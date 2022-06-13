#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"

DEFAULT_USER_NAME="Leah Lackner"
DEFAULT_USER_MAIL="leah.lackner+github@gmail.com"
DEFAULT_GITHUB_HANDLE="leahevy"

# Read user data
################
echo "Provide the following information:"
read -p "Your full name [$DEFAULT_USER_NAME]: " USER_NAME
if [ "${USER_NAME}" = "" ]; then
    USER_NAME="$DEFAULT_USER_NAME"
fi

read -p "Your mail [$DEFAULT_USER_MAIL]: " USER_MAIL
if [ "${USER_MAIL}" = "" ]; then
    USER_MAIL="$DEFAULT_USER_MAIL"
fi

read -p "Your GitHub handle [$DEFAULT_GITHUB_HANDLE]: " GITHUB_HANDLE
if [ "${GITHUB_HANDLE}" = "" ]; then
    GITHUB_HANDLE="$DEFAULT_GITHUB_HANDLE"
fi

read -p "Python project name (required): " PYTHON_PROJECT_NAME
if [ "${PYTHON_PROJECT_NAME}" = "" ]; then
    echo "+ Project name required" 1>&2
    exit 1
fi
PYTHON_PROJECT_NAME="${PYTHON_PROJECT_NAME//_/-}" 
PYTHON_PROJECT_NAME="$(echo "$PYTHON_PROJECT_NAME" | tr '[:upper:]' '[:lower:]')"

DEFAULT_PYTHON_PACKAGE_NAME="$PYTHON_PROJECT_NAME" 
DEFAULT_PYTHON_PACKAGE_NAME="${DEFAULT_PYTHON_PACKAGE_NAME//-/_}" 
DEFAULT_PYTHON_PACKAGE_NAME="$(echo "$DEFAULT_PYTHON_PACKAGE_NAME" | tr '[:upper:]' '[:lower:]')"
read -p "Python package name [$DEFAULT_PYTHON_PACKAGE_NAME]: " PYTHON_PACKAGE_NAME
if [ "${PYTHON_PACKAGE_NAME}" = "" ]; then
    PYTHON_PACKAGE_NAME="${PYTHON_PROJECT_NAME}"
fi
PYTHON_PACKAGE_NAME="${PYTHON_PACKAGE_NAME//-/_}" 
PYTHON_PACKAGE_NAME="$(echo "$PYTHON_PACKAGE_NAME" | tr '[:upper:]' '[:lower:]')"

read -p "Python package description (optional): " PYTHON_PACKAGE_DESCRIPTION


# Rename folders and files
##########################
find . -type d -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "template-python-with-setup" |
sed -n "s/\(.*\)template-python-with-setup\(.*\)/& \1$PYTHON_PROJECT_NAME\2/p" | 
xargs -n 2 mv || true

find . -type f -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "template-python-with-setup" |
sed -n "s/\(.*\)template-python-with-setup\(.*\)/& \1$PYTHON_PROJECT_NAME\2/p" | 
xargs -n 2 mv || true

find . -type d -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "template_python_with_setup" |
sed -n "s/\(.*\)template_python_with_setup\(.*\)/& \1$PYTHON_PACKAGE_NAME\2/p" | 
xargs -n 2 mv || true

find . -type f -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "template_python_with_setup" |
sed -n "s/\(.*\)template_python_with_setup\(.*\)/& \1$PYTHON_PACKAGE_NAME\2/p" | 
xargs -n 2 mv || true


# Replace words
###############
find . -type f -not -path "*configure.sh" -not -path "*.git*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,template-python-with-setup,$PYTHON_PROJECT_NAME,g" || true

find . -type f -not -path "*configure.sh" -not -path "*.git*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,template_python_with_setup,$PYTHON_PACKAGE_NAME,g" || true

find . -type f -not -path "*configure.sh" -not -path "*.git*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s#A Python template project for a basic and reusable Python project layout with a setup.py file\.#$PYTHON_PACKAGE_DESCRIPTION#g" || true

find . -type f -not -path "*configure.sh" -not -path "*.git*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,Leah Lackner,$USER_NAME,g" || true

find . -type f -not -path "*configure.sh" -not -path "*.git*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,leahevy,$GITHUB_HANDLE,g" || true

USER_MAIL="${USER_MAIL//@/\@}" 
USER_MAIL="$(echo "$USER_MAIL" | tr '[:upper:]' '[:lower:]')"
find . -type f -not -path "*configure.sh" -not -path "*.git*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,leah\.lackner\+github\@gmail\.com,$USER_MAIL,g" || true

rm ./configure.sh
