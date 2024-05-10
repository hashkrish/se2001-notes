#!/bin/bash

for ext in .txt .html .py ; do
  for _ in {1..10}; do
    tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 10
    echo $ext
  done
done | shuf | split -n l/10 --additional-suffix=.in -d
