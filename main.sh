#!/usr/bin/env bash
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
friendlyName=$(shuf -n 1 "$__dir/adjectives.txt")-$(shuf -n 1 "$__dir/names.txt")
echo $friendlyName
echo $GITHUB_SHA
echo $GITHUB_REF
gh auth --with-token - <<< $GITHUB_TOKEN
gh pr view --json number,commits,headRefName
