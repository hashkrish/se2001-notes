#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

echo {A..C}{D..F}_{u..w}{x..y} | tr ' ' '\n' > x00.in
echo {A..D}{A..D}{A..D}_{a..m}{a..m} | tr ' ' '\n' > x01.in
{ echo {A..M}{A..M}_{a..m}{a..m}; echo {A..D}{A..D}{A..D}_{a..m}{a..m}; } | tr ' ' '\n' > x02.in

rm test_case_* -rf

for input in *.in; do
  number=${input%.in}
  number=${number#x0}
  test_case="test_case_$number"
  mkdir -p "$test_case"
  mv "$input" "$test_case/input.txt" -f
  ../script.sh < "$test_case/input.txt" > "$test_case/output.txt"
done
