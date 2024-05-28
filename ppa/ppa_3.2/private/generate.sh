#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

months=(jan feb mar apr may jun jul aug sep oct nov dec)
(
for _ in {1..6}; do
  tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 10
  echo
done
for _ in {1..4}; do
  echo "${months[$((RANDOM % 12))]}"
done
)| shuf | split -l 1 --additional-suffix=.in -d

rm test_case_* -rf

for input in *.in; do
  number=${input%.in}
  number=${number#x0}
  test_case="test_case_$number"
  mkdir -p "$test_case"
  mv "$input" "$test_case/input.txt" -f
  ../script.sh < "$test_case/input.txt" > "$test_case/output.txt"
done

find . -type d -name 'test_case_*' | sort | sed "s/^\./$(basename "$PWD")/" > ../private_test_cases.txt
