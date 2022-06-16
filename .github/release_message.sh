#!/bin/bash
current_tag="$(git tag --sort=-creatordate | head -n 1)"
previous_tag="$(git tag --sort=-creatordate | sed -n 2p)"

echo "## Version ${current_tag}"
echo
echo "- Source code: <https://github.com/leahevy/template-python-project/tree/$current_tag>"
echo "- Release: <https://github.com/leahevy/template-python-project/releases/tag/$current_tag>"
echo
echo "### Changelog"
echo
git shortlog -e -n "${previous_tag}.." |
    sed 's/^./    &/' |
    sed 's/ ([[:digit:]][[:digit:]]*):/:/g' |
    sed '/\s*Release: version /d' |
    sed '/\s*Bump version: /d' |
    sed 's/^    //g' |
    sed 's/^  */- /g'