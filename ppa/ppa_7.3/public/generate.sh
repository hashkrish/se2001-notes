#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

cat > x00.in <<EOF
file1.txt
1
2
3
4
5

file2.txt
1
2
3

file3.txt
1


EOF

cat > x01.in <<EOF
file1.txt
1
2
3
4
5

file2.txt
1
2
3

file3.txt
1
2
3
4
5
6
7
8


EOF


rm test_case_* -rf

for input in *.in; do
  number=${input%.in}
  number=${number#x0}
  test_case="test_case_$number"
  mkdir -p "$test_case"
  mv "$input" "$test_case/input.txt" -f
  ../script.sh < "$test_case/input.txt" > "$test_case/output.txt"
done
