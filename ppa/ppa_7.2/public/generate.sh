#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

echo \
'5
Billie_Barron:INVESTMENT $16319#FROM 2026#TO 2026#
Jeremiah_Brennan:INVESTMENT $29440#FROM 2031#TO 2034#
Long_Mclaughlin:INVESTMENT $25906#FROM 2024#TO 2031#
Lorna_Trevino:INVESTMENT $1360#FROM 2030#TO 2032#
Mandy_Mueller:INVESTMENT $7979#FROM 2028#TO 2034#
5
bb1cc74d6e8c40efdbbbc0e6a657fca02a533fe7f438d5b09b47b43e31cb9a45 ./data/Mandy_Mueller
fe818c4ac047523ac14dbb341f365bbfcd857268a6bfb70d9abb701a80bfb9c3 ./data/Lorna_Trevino
e8b80161e4110a791a0d7c3e40a04099fc75f0e348c2033efe79a2a930a71e98 ./data/Long_Mclaughlin
b1b1222a15fcd532e511d0f461dbe7ae7bda825b68bc510eec2a22cbddd5dad2 ./data/Billie_Barron
6051c4f27079a41afc99a97f0fc7bb8ba2789cd282f4cd10a71c6a954089b63e ./data/Jeremiah_Brennan
3
bb1cc74d6e8c40efdbbbc0e6a657fca02a533fe7f438d5b09b47b43e31cb9a45
fe818c4ac047523ac14dbb341f365bbfcd857268a6bfb70d9abb701a80bfb9c3
e8b80161e4110a791a0d7c3e40a04099fc75f0e348c2033efe79a2a930a71e98' > x00.in


rm test_case_* -rf

for input in *.in; do
  number=${input%.in}
  number=${number#x0}
  test_case="test_case_$number"
  mkdir -p "$test_case"
  mv "$input" "$test_case/input.txt" -f
  ../script.sh < "$test_case/input.txt" > "$test_case/output.txt"
done
