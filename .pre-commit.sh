#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"

CMD="$1"

format() {
    echo "Running isort"
    isort --check .
    echo "Running black"
    black --check .
}

style() {
    echo "Running flake8"
    flake8 .
}

test() {
    echo "Running pytest"
    pytest .
}

typechecks() {
    echo "Running mypy"
    mypy .
}

build() {
    echo "Building package"
    python setup.py sdist
}

case "$CMD" in
    format)
        format
        ;;
    style)
        style
        ;;
    test)
        test
        ;;
    typechecks)
        typechecks
        ;;
    build)
        build
        ;;
    all)
        format
        style
        test
        typechecks
        build
        ;;
    *)
        echo "Invalid command $CMD" >&2
        exit 1
        ;;
esac
