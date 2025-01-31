# Programming Practice Assignment - Week 7 - Question 2

## Problem Statement

Write an awk script to find unintentionally repeated (duplicate) words in the file 'myfile.txt'.

For example, sometimes a file can contain sentences like:
"The the building is beautiful".

Print the repeated words in the order of occurence, one word per line.

A word should not be printed more than once.

## Instructions

Write your command in a file called `repeat.awk`.
The file should be an **awk** script, and not a shell script.
Your script will not receive any input from the standard input or command line arguments.
Your script should output to the standard output.

## Sample Input

```text
Long years ago, we made a tryst with destiny; and now the the time comes when we shall redeem our pledge, not not wholly or in full measure, but very very substantially.
At the stroke of the midnight hour, when the world sleeps, India will will awake to life and freedom.
```

## Sample Output

```text
the
not
very
will
```
