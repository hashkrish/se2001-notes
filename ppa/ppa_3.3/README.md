# Programming Practice Assignment - Week 3 - Question 3

## Problem Statement

Execute the commands given below in the sequence and collect the output/error into a file `errorlog` as described below.

- Execute the command `test` and redirect the standard error to the file `errorlog`.
- Execute the command `test -e` and append the standard error output to the file `errorlog`.
- Execute the command `test -n` and append the standard error to the file `errorlog`.

## Instructions

Write your code in the file `errorlog.sh`. Your script will not receive any input from the command line or standard input.
Your script should not print anything else other than the output/error as described above.
The `test` command can output to the stdout or stderr. You should redirect only the stderr to the file `errorlog`.
