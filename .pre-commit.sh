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
    rm -rf dist
    python -m build .
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
    on-commit)
        # Tests and build are not run on commit-hook,
        # since we only want to ensure that the code is
        # in good shape at this point.
        format
        style
        typechecks
        ;;
    all)
        test
        build
        format
        style
        typechecks
        ;;
    *)
        echo "Invalid command $CMD" >&2
        exit 1
        ;;
esac
