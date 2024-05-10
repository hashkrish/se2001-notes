#!/bin/bash

err(){
  echo "Error: $*"
  exit 1
}

req=( "diff" "basename" "pushd" "popd" "col")
executable="script.sh"
for i in "${req[@]}"; do
  command -v "$i" > /dev/null 2>&1 || err "$i is not installed"
done

ppa=$(basename "$PWD")
ppa_path="/opt/se2001/$ppa"

[[ -d "$ppa_path" ]] || err "PPA not found at $ppa_path"

for test_type in public private ; do
  echo "${test_type^} Test Cases:"
  if [[ ! -d "$ppa_path/$test_type" ]]; then
    echo "No $test_type test cases found"
    continue
  fi
  tc=0
  passed=0
  IFS=$'\n'
  for input_path in $(find "$ppa_path/$test_type" -type f -name "*.in" ); do
    ((tc++))
    echo -n "Test Case $tc: "
    output_path="${input_path%.in}.out"
    if [[ ! -f "$output_path" ]]; then
      echo "Output file for $input_path not found at $output_path"
      continue
    fi
    rand_dir=$(mktemp -d XXXXXX)
    pushd "$rand_dir" > /dev/null || err "Failed to change directory"
    echo "some text" > abc.txt
    while read -r inp; do
      touch "$inp"
    done < "$input_path"
    mkdir -p level1
    if [[ $test_type == "private" ]]; then
      redir="/dev/null"
    else
      redir="/dev/stdout"
    fi
    if diff --color=always <(../script.sh 2>&1 | col) <( col < "$output_path" ) &>"$redir"; then
      echo "Passed!"
      ((passed++))
    else
      echo "Failed :("
    fi
    popd > /dev/null || err "Failed to change directory"
    rm "${rand_dir?}" -rf
  done
  if [[ $passed -eq $tc ]]; then
    echo "All $test_type test cases passed!"
  else
    echo "$passed/$tc $test_type test cases passed"
    exit 1
  fi
done
