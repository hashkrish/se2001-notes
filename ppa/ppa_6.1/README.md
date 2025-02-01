# Programming Practice Assignment - Week 6 - Question 3

## Problem Statement

Write a **bash** command using `find` that copies all the files within the directory `source` to `destination`.
Note that all the files within all hierarchy have distinct names and should be copied to `destination`.
Only files should be copied and not directories.
All hierarchies should be flattened.

## Instructions

Write your solution in the file `backup.sh`.
Your script will not receive any input from the standard input or command line arguments.
Your script should output to the standard output.

## Sample input

Assume the folder structure of `source/` as:

```bash
$ tree source
source
├── 1
│   ├── x
│   ├── y
│   └── z
├── 10
├── 2
│   ├── a
│   ├── b
│   ├── c
│   └── d
├── 3
├── 4
├── 5
├── 6
├── 7
├── 8
└── 9

3 directories, 15 files
```

## Sample Output

The directory structure after running your script should be:

```bash
$ tree destination
destination
├── 10
├── 3
├── 4
├── 5
├── 6
├── 7
├── 8
├── 9
├── a
├── b
├── c
├── d
├── x
├── y
└── z

1 directory, 15 files
```

