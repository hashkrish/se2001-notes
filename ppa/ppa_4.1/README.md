# Programming Practice Assignment - Week 4 - Question 1

## Problem Statement

Write a command to print the name of directories(in the current working directory) that have read, write and execute permissions for other users.
Print only the directory name on each line.

## Instructions

Your command should be stored in a file named `dirs.sh`.
The script will not recieve any input from the arguments or standard input.
The script should print the output to the standard output.

## Sample Input

If the current working directory has the following directories:
```bash
$ ls -l
drwxrwxrwx 2 user user 4096 Sep  1 12:00 dir1
drwxrwxr-x 2 user user 4096 Sep  1 12:00 dir2
drwxr-xrwx 2 user user 4096 Sep  1 12:00 dir3
```

## Sample Output

The output of the command should be:
```bash
dir1
dir3
```

## Constraints

Directory names will not have spaces in them.
