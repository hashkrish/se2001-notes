# Programming Practice Assignment - Week 1 - Question 2

## Problem Statement

Write a Bash command to print the file types of all the files stored in the current working directory.

## Instructions

The output should be in the format as described below.
The first column is file/directory name and the second column tells about the file type.
Your script `filetypes.sh` will not be provided any input as arguments or standard input.

## Sample Input

Assume the current working directory contains the following files and directories:

```
file.txt
Notes/
SysComm -> ../SysComm Dropbox
System Commands Sample Questions.md
System Commands Sample Questions.pdf
```

## Sample Output

The output of your script should be as follows:

```
file.txt:                             empty
Notes:                                directory
SysComm:                              symbolic link to ../SysComm Dropbox
System Commands Sample Questions.md:  UTF-8 Unicode text, with very long lines
System Commands Sample Questions.pdf: PDF document, version 1.7
```
