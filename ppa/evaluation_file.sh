#!/bin/bash

err(){
  echo "Error: $*"
  exit 1
}

req=( "diff" "basename" "col" "find")
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
    # shellcheck disable=1091
    if [[ $test_type == "private" ]]; then
      redir="/dev/null"
    else
      redir="/dev/stdout"
    fi
    if diff --color=always <( if [[ -e $ppa_path/env.sh ]] ; then source "$ppa_path"/env.sh; fi ; ./"$executable" < "$input_path" | col) <( col < "$output_path" ) &>"$redir" ; then
      echo "Passed!"
      ((passed++))
    else
      echo "Failed :("
    fi
  done
  if [[ $passed -eq $tc ]]; then
    echo "All $test_type test cases passed!"
  else
    echo "$passed/$tc $test_type test cases passed"
    exit 1
  fi
done
