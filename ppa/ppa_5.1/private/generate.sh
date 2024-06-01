#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

grep -xE '[a-z]{5}' /usr/share/dict/words > corpus

for _ in {1..100}; do
  words=$((RANDOM % 5 + 1))
  shuf corpus | head -n "$words" | paste -s -d ' '
done | split -n l/10 --additional-suffix=.in -d

rm corpus -f
rm ./test_case_* -rf

for input in *.in; do
  number=${input%.in}
  number=${number#x0}
  test_case="test_case_$number"
  mkdir -p "$test_case"
  mv "$input" "$test_case/input.txt" -f
  ../script.sh < "$test_case/input.txt" > "$test_case/output.txt"
done

find . -type d -name 'test_case_*' | sort | sed "s/^\./$(basename "$PWD")/" > ../private_test_cases.txt
