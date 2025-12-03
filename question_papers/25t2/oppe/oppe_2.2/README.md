# Linux OPPE Question - Section 1 - Question 2

## Motivation

### Folding

A line of text can be folded into multiple lines in two broad ways:

- **Fixed-width folding**: where each line has a fixed number of characters.
  This can be done using the `fold` command in Linux.
- **Variable-width folding**: where the line is folded based on the content,
  such as breaking at spaces or punctuation.
  This can be done using the `grep -o` command in Linux.

```bash
> cat data
123456789
> fold -w 3 data
123
456
789
```

```bash
> grep -o '[0-9]\+' <<< "1,23,456"
1
23
456
```

### Unfolding

Unfolding is the reverse of folding, where multiple lines are combined into a single line.
This can be done using the `paste` command in Linux.

```bash
> cat data
1
2
3
> paste -sd+ < data
1+2+3
```

Read more about them in `man fold`, `man grep`, and `man paste`.

## Problem Statement

You are given a line of vector arithmetic expression in the form of
`[a1,a2,...,an]+[b1,b2,...,bn]`, where `ai` and `bi` are integers.
Your task is to compute the result of the vector addition and
return it in the same format.

## Instructions

- Write your solution in `script.sh` shell script file.
- The script should read the input from standard input (`&0`).
- The output should be printed to standard output (`&1`).
- You can use temporary files in your current directory if required.

## Sample Input

```text
[1,2,3]+[2,6,2]
```

## Sample Output

```text
[3,8,5]
```

## Constraints

- To keep the question simple, the expressions will always be of a sum of two vectors.
- The expressions will always be well-formed.
- The number of elements in the vectors will be the same.
