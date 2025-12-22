#!/usr/bin/env bash
set -euo pipefail
out="${1:-example.pdf}"
docker run --rm -v "$PWD":/work -w /work type-report-builder:0.1.0 compile --root /work template/main.typ "$out"
