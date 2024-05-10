# Programming Practice Assignment - Week 1 - Question 1

## Problem Statement

Write a bash command to move all the `.txt` files present in the current directory to the directory named `level1` present inside the current directory.

## Instructions

Do not move any other files other than `.txt` files anywhere from the current directory.

Write only a single line bash command to perform the above task.

Your script should not produce any output. Your script will not receive any input from arguments or standard input.

## Sample Input

Assume the following output of `tree` command in the current directory.

```
./
├── abc.txt
├── level1/
├── test.c
├── test.cpp
├── test.java
├── test.py
└── test.txt
```

## Sample Output

After running your `script.sh`, the output of `tree` should be as follows.

```
./
├── level1/
│   ├── abc.txt
│   └── test.txt
├── test.c
├── test.cpp
├── test.java
└── test.py
```
