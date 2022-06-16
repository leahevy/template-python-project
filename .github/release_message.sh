#!/bin/bash
previous_tag="$(git tag --sort=-creatordate | sed -n 2p)"
git shortlog "${previous_tag}.." |
    sed 's/^./    &/' |
    sed '/\s*Release: version /d' |
    sed '/\s*Bump version: /d'