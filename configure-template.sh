#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
SCRIPT_NAME="$(basename "$0")"


# VALUES OF THIS TEMPLATE PROJECT
#################################
VERSION="0.6.0"
THIS_PROJECT_NAME="template-python-project"
THIS_PACKAGE_NAME="${THIS_PROJECT_NAME//-/_}" 
THIS_AUTHOR="Leah Lackner"
THIS_AUTHOR_EMAIL="leah.lackner+github@gmail.com"
THIS_AUTHOR_GITHUB_HANDLE="leahevy"
THIS_PROJECT_COPYRIGHT_YEAR="2022"
THIS_DESCRIPTION="Template repository for Python projects\."
THIS_PYTHON_VERSION="3.10"


# DEFAULT VALUES
################
DEFAULT_USER_NAME="$THIS_AUTHOR"
DEFAULT_USER_MAIL="$THIS_AUTHOR_EMAIL"
DEFAULT_GITHUB_HANDLE="$THIS_AUTHOR_GITHUB_HANDLE"
DEFAULT_PYTHON_VERSION="$THIS_PYTHON_VERSION"
DEFAULT_VERSION="0.0.1"


# Read user data
################
echo "Provide the following information:"
read -p "Python project name (required): " PYTHON_PROJECT_NAME
if [ "${PYTHON_PROJECT_NAME}" = "" ]; then
    echo "+ Project name required" 1>&2
    exit 1
fi
PYTHON_PROJECT_NAME="${PYTHON_PROJECT_NAME//_/-}" 
PYTHON_PROJECT_NAME="$(echo "$PYTHON_PROJECT_NAME" | tr '[:upper:]' '[:lower:]')"

read -p "Python version to support [$DEFAULT_PYTHON_VERSION]: " PYTHON_VERSION
if [ "${PYTHON_VERSION}" = "" ]; then
    PYTHON_VERSION="$DEFAULT_PYTHON_VERSION"
fi

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

DEFAULT_PYTHON_PACKAGE_NAME="$PYTHON_PROJECT_NAME" 
DEFAULT_PYTHON_PACKAGE_NAME="${DEFAULT_PYTHON_PACKAGE_NAME//-/_}" 
DEFAULT_PYTHON_PACKAGE_NAME="$(echo "$DEFAULT_PYTHON_PACKAGE_NAME" | tr '[:upper:]' '[:lower:]')"
read -p "Python package name [$DEFAULT_PYTHON_PACKAGE_NAME]: " PYTHON_PACKAGE_NAME
if [ "${PYTHON_PACKAGE_NAME}" = "" ]; then
    PYTHON_PACKAGE_NAME="${PYTHON_PROJECT_NAME}"
fi
PYTHON_PACKAGE_NAME="${PYTHON_PACKAGE_NAME//-/_}" 
PYTHON_PACKAGE_NAME="$(echo "$PYTHON_PACKAGE_NAME" | tr '[:upper:]' '[:lower:]')"

DEFAULT_PYTHON_PACKAGE_DESCRIPTION="The $PYTHON_PROJECT_NAME package." 
read -p "Python package description [$DEFAULT_PYTHON_PACKAGE_DESCRIPTION]: " PYTHON_PACKAGE_DESCRIPTION
if [ "${PYTHON_PACKAGE_DESCRIPTION}" = "" ]; then
    PYTHON_PACKAGE_DESCRIPTION="${DEFAULT_PYTHON_PACKAGE_DESCRIPTION}"
fi

DEFAULT_PYTHON_PACKAGE_SHORT_NAME="tp" 
read -p "Short package import name (e.g. pd for pandas) [$DEFAULT_PYTHON_PACKAGE_SHORT_NAME]: " PYTHON_PACKAGE_SHORT_NAME
if [ "${PYTHON_PACKAGE_SHORT_NAME}" = "" ]; then
    PYTHON_PACKAGE_SHORT_NAME="${DEFAULT_PYTHON_PACKAGE_SHORT_NAME}"
fi


# Rename folders and files
##########################
find . -type d -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "$THIS_PROJECT_NAME" |
sed -n "s/\(.*\)$THIS_PROJECT_NAME\(.*\)/& \1$PYTHON_PROJECT_NAME\2/p" | 
xargs -n 2 mv || true

find . -type f -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "$THIS_PROJECT_NAME" |
sed -n "s/\(.*\)$THIS_PROJECT_NAME\(.*\)/& \1$PYTHON_PROJECT_NAME\2/p" | 
xargs -n 2 mv || true

find . -type d -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "$THIS_PACKAGE_NAME" |
sed -n "s/\(.*\)$THIS_PACKAGE_NAME\(.*\)/& \1$PYTHON_PACKAGE_NAME\2/p" | 
xargs -n 2 mv || true

find . -type f -not -path "*__pycache__*" -not -path "*.egg-info*" | grep "$THIS_PACKAGE_NAME" |
sed -n "s/\(.*\)$THIS_PACKAGE_NAME\(.*\)/& \1$PYTHON_PACKAGE_NAME\2/p" | 
xargs -n 2 mv || true


# Replace words
###############
find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$THIS_PROJECT_NAME,$PYTHON_PROJECT_NAME,g" || true

find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$THIS_PACKAGE_NAME,$PYTHON_PACKAGE_NAME,g" || true

find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s#$THIS_DESCRIPTION#$PYTHON_PACKAGE_DESCRIPTION#g" || true

find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$THIS_AUTHOR,$USER_NAME,g" || true

find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$THIS_AUTHOR_GITHUB_HANDLE,$GITHUB_HANDLE,g" || true

USER_MAIL="${USER_MAIL//@/\@}" 
USER_MAIL="$(echo "$USER_MAIL" | tr '[:upper:]' '[:lower:]')"
THIS_AUTHOR_EMAIL_QUOTED="$(echo "$THIS_AUTHOR_EMAIL" | tr '.' '\.' | tr '+' '\+' | tr '@' '\@')"
find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$THIS_AUTHOR_EMAIL_QUOTED,$USER_MAIL,g" || true

CURRENT_YEAR="$(date +'%Y')"
find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,Copyright \(C\) $THIS_PROJECT_COPYRIGHT_YEAR,Copyright (C) $CURRENT_YEAR,g" || true

find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,\"tp\",\"$PYTHON_PACKAGE_SHORT_NAME\",g" || true

VERSION_QUOTED="$(echo "$VERSION" | tr '.' '\.' | tr '+' '\+')"
find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$VERSION_QUOTED,$DEFAULT_VERSION,g" || true

THIS_PYTHON_VERSION_QUOTED="$(echo "$THIS_PYTHON_VERSION" | tr '.' '\.' | tr '+' '\+')"
find . -type f -not -path "*$SCRIPT_NAME" -not -path "*.git/*" -not -path "*__pycache__*" -not -path "*.egg-info*" -not -path "*.png" |
xargs -n 1 perl -pi -e "s,$THIS_PYTHON_VERSION_QUOTED,$PYTHON_VERSION,g" || true


# Delete self
#############
rm -f "./$SCRIPT_NAME"
