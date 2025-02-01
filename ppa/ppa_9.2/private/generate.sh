#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi


grep -xE '[a-z]{5}' /usr/share/dict/words > words
for _ in {1..100}; do
  for __ in {1..10}; do
    word=$(shuf -n 1 words)
    if [ -n "$prev" ] && ((RANDOM%2==0)); then
        word="$prev"
    fi
    prev="$word"
    echo -n "$word "
  done | col
done | split -n l/10 --additional-suffix=.in -d

rm words -f
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
