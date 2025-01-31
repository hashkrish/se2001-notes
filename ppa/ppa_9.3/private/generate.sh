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

for i in {0..9}; do
  true > "x0$i.in"
  files=$((RANDOM%10+1))
  for _ in $(seq $files); do
    filename=$(shuf -n 1 words).txt
    sed -i "/^$filename\$/d" words
    echo "$filename" >> "x0$i.in"
    lines=$((RANDOM%10+1))
    for __ in $(seq $lines); do
      words=$((RANDOM%10+1))
      for ___ in $(seq $words); do
        echo -n "$(shuf -n 1 words) "
      done | col >> "x0$i.in"
    done
    echo >> "x0$i.in"
  done
done

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
