#!/bin/bash

err(){
  echo "Error: $*"
  exit 1
}
for input_path in *.in ; do
  output_path="${input_path%.in}.out"
  rand_dir=$(mktemp -d XXXXXX)
  pushd "$rand_dir" > /dev/null || err "Failed to change directory"
  echo "some text" > abc.txt
  while read -r inp; do
    touch "$inp"
  done < "../$input_path"
  mkdir -p level1
  ../../script.sh  &> "../$output_path" || err "Failed to execute script.sh"
  popd > /dev/null || err "Failed to change directory"
  rm "${rand_dir?}" -rf
done
