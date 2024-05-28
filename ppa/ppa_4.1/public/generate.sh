#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

grep '^[a-z]\{4,6\}$' /usr/share/dict/words > words.tmp

i=0
for _ in {1..10}; do # template
  paste <( shuf words.tmp | head -8) <( echo $((RANDOM%8))$((RANDOM%8)){0..7} | tr ' ' '\n' | shuf) > x0$i.in
  ((i++))
done

rm words.tmp
rm test_case_* -rf

for input in *.in; do
  number=${input%.in}
  number=${number#x0}
  test_case="test_case_$number"
  mkdir -p "$test_case"
  mv "$input" "$test_case/input.txt" -f
  ../script.sh < "$test_case/input.txt" > "$test_case/output.txt"
done
