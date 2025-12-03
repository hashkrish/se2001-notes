# Linux OPPE Question - Section 1 - Question 1

## Motivation

We can iterate over each line from standard input by using `while` and `read`
commands.

```bash
while read -r line; do
    # Process each line here
done
```

## Problem Statement

Given `/etc/passwd` file as standard input (`&0`),
extract the login shell and convert them to uppercase.

## Instructions

- Write your solution in `script.sh` shell script file.
- The script should read the input from standard input (`&0`).
- The output should be printed to standard output (`&1`).
- No files will be provided, so you need to read from standard input.

## Sample Input

```text
root:x:0:0:root:/root:/bin/bash
user:x:1000:1000:User:/home/user:/bin/bash
Sayan:x:1001:1001:Sayan:/home/sayan:/bin/zsh

```

## Sample Output

```text
BASH
BASH
ZSH
```

## Constraints

- The input will always be in the format of `/etc/passwd`.
- Login shells are the last field in each line, separated by a colon (`:`).

## Hints

- Try using variable manipulation solely to solve this question.
