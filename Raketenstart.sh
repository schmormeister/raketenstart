#!/bin/sh
printf '\033c\033]0;%s\a' Raketenstart
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Raketenstart.x86_64" "$@"
