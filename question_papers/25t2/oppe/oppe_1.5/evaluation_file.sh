#!/usr/bin/env bash

err(){
  echo "Error: $*"
  exit 1
}

req=( "diff" "basename" "col" "find" )
executable="script.awk"
for i in "${req[@]}"; do
  command -v "$i" > /dev/null 2>&1 || err "$i is not installed"
done

cat << EOF > script.sh
#!/usr/bin/env bash

exec="./\$(dirname "\${BASH_SOURCE[0]}")/$executable"

[[ -r "\$exec" ]] || exit 1

gawk -f "\$exec" 2>&1

EOF
chmod u+x script.sh

lab=$(basename "$PWD")
lab_path="/opt/se2001/$lab"

[[ -d "$lab_path" ]] || err "lab not found at $lab_path"

test_type="$1"
test_type=${test_type:-"public"}
test_type=${test_type%/}

echo "${test_type^} Test Cases:"
if [[ ! -d "$lab_path/$test_type" ]]; then
  err "No $test_type test cases found"
fi
tc=0
passed=0
IFS=$'\n'
echo "< Actual Output | Expected Output >"
for test_path in $(find "$lab_path/$test_type" -type d -name "test_case_*" | sort ); do
  ((tc++))
  echo -n "Test Case $tc: "
  input_path="$test_path/input.txt"
  output_path="$test_path/output.txt"
  if [[ ! -f "$output_path" ]]; then
    echo "Output file for $input_path not found at $output_path"
    continue
  fi
  if diff --color=always <( ./"script.sh" < "$input_path" | col) <( col < "$output_path" ) ; then
    echo "Passed!"
    ((passed++))
  else
    echo "Failed :("
  fi
done
if [[ $tc -eq 0 ]]; then
  err "No $test_type test cases found"
fi
if [[ $passed -eq $tc ]]; then
  echo "All $test_type test cases passed!"
else
  echo "$passed/$tc $test_type test cases passed"
  exit 1
fi
