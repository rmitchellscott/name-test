#!/usr/bin/env bash
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
friendlyName=$(shuf -n 1 "$__dir/adjectives.txt")-$(shuf -n 1 "$__dir/names.txt")
echo $friendlyName
echo "SHA: "$GITHUB_SHA
echo "Ref: "$GITHUB_REF
echo "Logging into gh..."
gh auth login --with-token $GITHUB_TOKEN
gh pr view --json number,commits,headRefName
