# Linux OPPE Question - Section 1 - Question 4

## Motivation

In `sed`, we can perform powerful text transformations using simple commands.
It is particularly well-suited for processing log files,
where we often need to filter, modify, and reformat text.

### Print and Delete Lines

We can print a particular line addressed by a pattern using the `p` command,
similarly, we can delete lines using the `d` command.

### Substitution

The `s` command in `sed` allows us to substitute text.

```bash
sed 's/pattern/replacement/' input.txt
```

We can use regular expressions to match patterns and replace them with desired
text. We can also use capture groups to backreference matched text.

```bash
sed 's/\(pattern1\)\(pattern2\)/\2\1/' input.txt
```

### Addressing Lines

We can address lines using line numbers or patterns.

```bash
sed '2s/pattern/replacement/' input.txt
sed '/pattern/s/pattern/replacement/' input.txt
```

### Case Conversion

We can convert text to uppercase or lowercase using the
`\U` and `\L` escape sequences. These convert the entire match.

Similarly, we can use `\u` and `\l` to convert the first letter of the match.

```bash
sed 's/.*/\U&/' input.txt
sed 's/.*/\L&/' input.txt
```

## Problem Statement

You are given a log file as input. The log file contains log entries from
your application. Each log entry is formatted as follows:

```text
[LEVEL] (timestamp) message
```

Where `LEVEL` can be one of the following:
`DEBUG`, `INFO`, `WARNING`, `ERROR`, or `CRITICAL`.

Your task is to perform the following transformations on the log entries:

- Delete all logs of level `DEBUG` or `INFO`.
- Make the log level lowercase.
- Swap the timestamp format from `YYYY-MM-DD HH:MM:SS` to `HH:MM:SS DD-MM-YYYY`.

## Instructions

- Write your solution in `script.sed` `sed` script format.
- The input is passed through standard input to the `sed` script.
- The output should be printed to standard output.

Your script is run as follows:

```bash
sed -Ef script.sed < input.log
```

## Sample Input

```text
[DEBUG] (2023-03-15 12:00:00) this is a debug message
[INFO] (2023-03-15 12:01:00) this is an info message
[WARNING] (2023-03-15 12:02:00) this is a warning message
[ERROR] (2023-03-15 12:03:00) this is an error message
[CRITICAL] (2023-03-15 12:04:00) this is a critical message
```

## Sample Output

```text
[warning] (12:02:00 15-03-2023) this is a warning message
[error] (12:03:00 15-03-2023) this is an error message
[critical] (12:04:00 15-03-2023) this is a critical message
```

### Constraints

- The log file may contain multiple lines.
- Each log entry is well-formed as per the specified format.
- The timestamp is always in the format `YYYY-MM-DD HH:MM:SS`.
- The message may contain any characters except newlines.
