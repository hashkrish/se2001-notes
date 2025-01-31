#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

for _ in {1..100}; do
  words=$((RANDOM%5+1))
  for __ in $(seq "$words"); do
    digonly=$((RANDOM%2))
    issay=$((RANDOM%4))
    if ((issay==0)); then
      printf "say "
      continue
    fi
    if ((digonly==0)); then
      tr -dc '0-9' < /dev/urandom | head -c 5
      printf " "
      continue
    fi
    tr -dc 'a-zA-Z' < /dev/urandom | head -c 5
    printf " "
  done
  echo
done | col | shuf | split -n l/10 --additional-suffix=.in -d

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
