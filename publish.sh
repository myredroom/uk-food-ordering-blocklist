#!/bin/bash
# After editing uk-food-ordering.txt: commit, push, and publish a new release
# (the release asset is what users' blockers download, and GitHub counts it).
# Usage: ./publish.sh "what changed"
set -euo pipefail
cd "$(dirname "$0")"
msg="${1:?say what changed}"
git add uk-food-ordering.txt README.md
git commit -m "$msg"
git push -q
tag="v$(date +%Y.%m.%d)"
git tag -l "$tag" | grep -q . && tag="$tag.$(date +%H%M)"
gh release create "$tag" uk-food-ordering.txt --title "$tag" --notes "$msg"
echo "published $tag"
