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
Long years ago, we made a tryst with destiny; and now the the time comes when we shall redeem our pledge, not not wholly or in full measure, but very very substantially.
At the stroke of the midnight hour, when the world sleeps, India will will awake to life and freedom.
EOF

cat > x01.in <<EOF
Long years ago, we made a tryst with destiny; and now the time comes when we shall redeem our pledge, not not wholly or in full measure, but very very substantially.
At the stroke of the midnight hour, when the world sleeps, India will will awake to life and freedom.
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
