#!/usr/bin/env bash
set -euo pipefail
out="${1:-example.pdf}"
typst compile --root . template/main.typ "$out"
