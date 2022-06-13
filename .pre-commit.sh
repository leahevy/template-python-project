#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"

CMD="$1"

format() {
    isort --check -l 79 .
    black --check -l 79 .
}

style() {
    flake8 --select=E9,F63,F7,F82 --show-source .
    flake8 --max-complexity=13 --show-source .
}

test() {
    pytest .
}

typechecks() {
    mypy --pretty --warn-unused-configs --disallow-any-generics --disallow-subclassing-any --disallow-untyped-calls --disallow-untyped-defs --disallow-incomplete-defs --check-untyped-defs --disallow-untyped-decorators --no-implicit-optional --warn-redundant-casts --warn-return-any --no-implicit-reexport --strict-equality .
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
    *)
        echo "Invalid command $CMD" >&2
        exit 1
        ;;
esac
