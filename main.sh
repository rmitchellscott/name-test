#!/usr/bin/env bash
mapfile -t adjective < adjectives
mapfile -t name < names
friendlyName=${adjective[RANDOM%${#adjective[@]}]-1}-${name[RANDOM%${#name[@]}]-1}
echo $friendlyName
