# Programming Practice Assignment - Week 6 - Question 1

## Problem Statement

Given a file `words.txt` containing a string in each line in the format `FIRST_second`.
Every string is a combination of two words joined with an underscore(_),
the first word `FIRST` consists of all uppercase letters
and the second word `second` consists of all lowercase letters.

Write a bash command/script using `sed` to convert all the string to `SECOND_first`.

After conversion:

- The **first** and the **second** words should be swapped.
- The **uppercase** word should be converted to **lowercase** word and vice versa.

The file `words.txt` is located in the current working directory.

## Instructions

Write your solution in the file `swapcase.sh`.
Your script will not receive any input from the standard input or command line arguments.
Your script should output to the standard output.

## Sample Input

```text
AD_ux
AD_uy
```

## Sample Output

```text
UX_ad
UY_ad
```
