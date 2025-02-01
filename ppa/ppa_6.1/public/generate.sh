#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

# find source/ -mindepth 1 -exec ls -dF {} \; | xsel -ib

cat > x00.in <<EOF
source/2/
source/2/c
source/2/b
source/2/d
source/2/a
source/1/
source/1/y
source/1/z
source/1/x
source/6
source/5
source/10
source/3
source/4
source/7
source/9
source/8
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
