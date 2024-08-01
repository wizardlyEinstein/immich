#!/bin/bash
set -e
if [ ! -f ./immich.yaml ]; then
  helm repo add immich https://immich-app.github.io/immich-charts
  helm repo update
  helm template immich immich/immich --version 0.7.0 -f values.yaml > immich.yaml
fi
kustomize build . --enable-alpha-plugins > rendered.yaml
