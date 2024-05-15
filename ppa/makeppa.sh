#!/bin/bash

number=$1

err() {
    echo "$*" >&2
    exit 1
}

while [[ -z "$number" ]]; do
    read -rp "Enter the PPA number (1.1): " number
done

number=${number// /}

pattern='^[0-9]+\.[0-9]+$'

if [[ ! $number =~ $pattern ]]; then
    err "Invalid PPA number"
fi

ppa="ppa_$number"

if [[ -d "$ppa" ]]; then
    err "PPA $ppa already exists"
fi

mkdir "$ppa" || err "Failed to create directory $ppa"

cp evaluation_file.sh "$ppa" || err "Failed to copy evaluation_file.sh"

cat > "$ppa/README.md" <<EOF
# Programming Practice Assignment - Week ${number%.*} - Question ${number#*.}

## Problem Statement

## Instructions

## Sample Input

\`\`\`
\`\`\`

## Sample Output

\`\`\`
\`\`\`

## Constraints

EOF

mkdir -p "$ppa"/{public,private} || err "Failed to create directories"

cat >"$ppa"/private/generate.sh <<EOF
#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

for _ in {1..30}; do # template
  tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 10
  echo
done | shuf | split -n l/10 --additional-suffix=.in -d

rm test_case_* -rf

for input in *.in; do
  number=\${input%.in}
  number=\${number#x0}
  test_case="test_case_\$number"
  mkdir -p "\$test_case"
  mv "\$input" "\$test_case/input.txt" -f
  ../script.sh < "\$test_case/input.txt" > "\$test_case/output.txt"
done

find . -type d -name 'test_case_*' | sort | sed "s/^\./\$(basename "\$PWD")/" > ../private_test_cases.txt
EOF

cat >"$ppa"/public/generate.sh <<EOF
#!/bin/bash
if [[ ! -f ../script.sh ]]; then
  echo "script.sh not found"
  exit 1
fi

if [[ ! -x ../script.sh ]]; then
  echo "script.sh is not executable"
  exit 1
fi

for _ in {1..30}; do # template
  tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 10
  echo
done | shuf | split -n l/10 --additional-suffix=.in -d

rm test_case_* -rf

for input in *.in; do
  number=\${input%.in}
  number=\${number#x0}
  test_case="test_case_\$number"
  mkdir -p "\$test_case"
  mv "\$input" "\$test_case/input.txt" -f
  ../script.sh < "\$test_case/input.txt" > "\$test_case/output.txt"
done
EOF

chmod u+x "$ppa"/{public,private}/generate.sh
touch "$ppa"/{script.sh,.gitignore}

ln -s "$(realpath "$ppa")" /opt/se2001/"$ppa"

