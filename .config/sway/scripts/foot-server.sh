#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

nohup foot --server >/dev/null 2>&1 &
