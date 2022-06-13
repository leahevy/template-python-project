#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"

CMD="$1"

format() {
    isort --check .
    black --check .
}

style() {
    flake8 .
}

test() {
    pytest .
}

typechecks() {
    mypy .
}

build() {
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
