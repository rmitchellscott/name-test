#!/usr/bin/env bash
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
#mapfile -t adjective < $__dir/adjectives
#mapfile -t name < $__dir/names
#friendlyName=${adjective[RANDOM%${#adjective[@]}]-1}-${name[RANDOM%${#name[@]}]-1}
friendlyName=$(shuf -n 1 "$__dir/adjectives.txt")-$(shuf -n 1 "$__dir/names.txt")
echo $friendlyName
