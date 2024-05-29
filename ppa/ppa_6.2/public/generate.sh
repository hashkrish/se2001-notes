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
This is a sample file
this is not end justsay start
that contains say
some number
say like 10
or
20
or
233
444
or say 3444
and now it ends.
EOF

cat > x01.in << EOF
This is a sample file
this is not end justsay start
that contains say
some number
say like 10
or
20
or
233
444
or say 3444
and now it ends.
that contains say
some number
say like 10
or
20
or
233
444
sudo command
as dhti
32
555 sdf
23ddsf
23sd
sdf4
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
