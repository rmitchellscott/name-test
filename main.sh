#!/usr/bin/env bash

set -euo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

_log() {
    local IFS=$' \n\t'
    printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" >&2;
}

_log "SHA: "$GITHUB_SHA
_log "Ref: "$GITHUB_REF
_log Verify this is a PR
_log "event:"$EVENT
#type=$(echo $GITHUB_REF | awk -F/ '{print $1}')
re='^[0-9]+$'
if [ $EVENT =~ $re ]; then
    prNum=$EVENT
else
    prNum=$(gh pr view --json number --jq .number)
    if [ ! $? -eq 0 ]; then
        _log "We're not operating on a pull request! Aborting."
    fi
fi
#if [ $type=="pull" ]; then
#    prNum=$(echo $GITHUB_REF | awk -F/ '{print $3}')
#else
#    prNum=$(gh pr view --json number --jq .number)
#    if [ ! $? -eq 0 ]; then
#        _log "We're not operating on a pull request! Aborting."
#        exit 1
#    fi
#fi
prNum=$EVENT
environment="pr"$prNum
_log $environment
