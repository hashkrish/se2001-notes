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

touch "$ppa"/env.sh || err "Failed to make env.sh file"

touch "$ppa/script.sh" || err "Failed to make script.sh file"
