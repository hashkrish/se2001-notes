# Programming Practice Assignment - Week 3 - Question 2

## Problem Statement

Given a shell variable month supposed to contain a string value corresponding to some calendar month of 2023. Use the `cal` command to create a file named as `X.txt` where `X` is the string value in the variable month. Your command should also create a file named `error.txt` that should contain the error message if the string month does not correspond to any calendar month. Create all the files in the current working directory.

For example:

If the variable month contains the string "nov", your solution should create a file named `nov.txt` containing the calendar of November month and `error.txt` should be empty.
And if the variable month contains the string "garbage", your solution should create a file named `error.txt` containing the error from `cal` command and `garbage.txt` should be empty.

## Instructions

Write your code in a file called `calendar.sh`. The variable `month` will be present as a variable in the environment.

## Sample Input

```
sep
```

## Sample Output

`sep.txt`:

```
   September 2023
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
```

`error.txt` is empty.
