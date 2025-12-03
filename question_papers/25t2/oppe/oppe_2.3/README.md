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

You are given a positive integer `n`. Your task is to print a right triangle
of `n` rows consisting of the first $n \times (n + 1) / 2$ fibonacci numbers.

## Instructions

- Write your solution in `script.sh` shell script file.
- The script should read the integer `n` from standard input.
- The output should be formatted as a triangle, with each row containing the
  appropriate number of fibonacci numbers.

## Sample Input

```text
5
```

## Sample Output

```text
				1
			1	2
		3	5	8
	13	21	34	55
89	144	233	377	610
```

## Constraints

- `n` is a positive integer.
- The padding for each row is using tabs to align the triangle.
- The output should be formatted with each number separated by a tab.
