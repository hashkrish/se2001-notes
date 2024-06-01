#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

awk '
BEGIN{ FPAT="([^,]+)|(\"[^\"]+\")" }
NR!=1{ print $5 }
' ../Pincode_info.csv | sort -u > pins

i=0
for _ in {1..10}; do
  shuf pins | head -1 > "x0$i.in"
  ((i++))
done

rm pins -f
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
