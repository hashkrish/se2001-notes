# Linux OPPE Question - Section 1 - Question 3

## Motivation

### Fibonacci Numbers

Fibonacci numbers are a sequence of numbers where each number is the sum of the
two preceding ones, usually starting with 1 and 1.
The sequence commonly starts as follows: 1, 1, 2, 3, 5, 8, 13, 21, and so on.

$$
F_n = F_{n-1} + F_{n-2}
$$

## Problem Statement

You are given a positive integer `n`. Your task is to print a triangle of `n`
rows consisting of the first $n \times (n + 1) / 2$ fibonacci numbers.

## Instructions

- Write your solution in `script.sh` shell script file.
- The script should read the integer `n` from standard input.
- The output should be formatted as a triangle, with each row containing the
  appropriate number of fibonacci numbers.

## Sample Input

```text
4
```

## Sample Output

```text
1
1 2
3 5 8
13 21 34 55
```

## Constraints

- `n` is a positive integer.
- The output should be formatted with each number separated by a space.
- The last number in each row should not have a trailing space.
