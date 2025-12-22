#!/usr/bin/env bash
set -euo pipefail
docker build -t typst-report-builder:0.1.0 \
  --build-arg PKG_NAME=type-report-template \
  --build-arg PKG_VERSION=0.1.0 \
  .
