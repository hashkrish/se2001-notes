# Quiz-1

## Question 1 A

Initially four files `a`, `b`, `c` and `d` are present in the current directory.
The below set of commands are executed.
Select the file(s) whose contents are _not_ modified. [MSQ]

```bash
touch a
> b
>> c
cat d > d
```

(a) a

(b) b

(c) c

(d) d

### Answer

(a), (c)

### Explanation

- `touch` will only change the metadata (last modified timestamp) of the file.
- `> file` will truncate the file to zero bytes.
- `>> file` will append nothing to the file.
- Although `cat d > d` seems like it will overwrite the file `d` with its own content, it will not. Bash will first truncate the file `d` to zero bytes and then start reading the file `d` to write it back to the file `d`. Since the file `d` is empty, the file `d` will remain empty.
- So only the files `a` and `c` are not modified.

---

## Question 1 B

Initially four files `a`, `b`, `c` and `d` are present in the current directory.
The below set of commands are executed.
Select the file(s) whose contents are _not_ modified. [MSQ]

```bash
touch a
cat b > b
> c
>> d
```

(a) a

(b) b

(c) c

(d) d

### Answer

(a), (d)

### Explanation

- `touch` will only change the metadata (last modified timestamp) of the file.
- `cat b > b` will truncate the file `b` to zero bytes.
- `> file` will truncate the file to zero bytes.
- `>> file` will append nothing to the file.

---

## Question 2

Below are the commands executed in the given sequence in an empty directory.
Enter the maximum number of files present at the end of the execution. [NAT]

```bash
# Format Strings
# %H     hour (00..23)
# %M     minute (00..59)

touch "$(date +'%M')"
sleep 3600
touch "$(date +'%M')"
sleep 3600
touch "$(date +'%M')"
```

### Answer

1

### Explanation

- The first `touch` command will create a file with the current minute value.
- The first `sleep` command will sleep for 3600 seconds (1 hour).
- The time after 1 hour will have a the same minute value as the current time.
- So the second `touch` command will not create a new file.
- Same goes for the third `touch` command.

---

## Question 3

```bash
command1 && command2 || command3
```

Choose the correct statement(s) with respect to the above command. [MSQ]

Note: `&&` and `||` have same precedence.

(a) If command1 exits with exit status 0 then command2 will be executed

(b) If command1 exits with exit status 0 then command3 will be executed

(c) If command1 exits with exit status 1 then command2 will be executed

(d) If command1 exits with exit status 1 then command3 will be executed

### Answer

(a), (d)

### Explanation

- `&&` and `||` have same precedence.
- They are evaluated from left to right.
- If the command1 exits with status 0 then command2 will be executed.
- If `command1` or `command2` exits with non-zero status then `command3` will be executed.

---

## Question 3i

```bash
! (ls global_config || ls local_config) > /dev/null 2>&1 && touch default_config
```

Choose the correct statement(s) with respect to the above command. [MSQ]

Note: `&&` and `||` have same precedence.

(a) If the file `global_config` exists in the current directory then the file `default_config` will be created.

(b) If the file `local_config` exists in the current directory then the file `default_config` will be created.

(c) If the file `global_config` does not exist in the current directory but the file `local_config` exists then the file `default_config` will be created.

(d) If the file `local_config` and the file `global_config` does not exist in the current directory then the file `default_config` will be created.

### Answer

(d)

---

## Question 4

```bash
command1 && command2 || command3 > /dev/null 2>&1
echo $?
```

The output from the above commands are non-zero.
Choose the correct statement(s) with respect to the above commands. [MSQ]

Note: `&&` and `||` have same precedence.

(a) command1 exited with status 0 and command2 exited with status 0

(b) command1 exited with status 0 and command2 exited with status 1 and command 3 exited with status 1

(c) command1 exited with status 1 and command3 exited with status 0

(d) command1 exited with status 1 and command3 exited with status 1

### Answer

(b), (d)

### Explanation

- If the output is non-zero then the last command in the pipeline has exited with non-zero status.
- Thus `command3` has to exit with status 1.
- It is run only if `command1` exits with status 1 or `command2` exits with status 1.
- If `command1` exits with status 1 then `command2` is not run.
- So the only possible combinations are `1-1` and `011` where `1` represents any non-zero exit code and `0` represents exit code 0 and `-` represents the command that is not run.

---

## Question 5

```bash
ls | grep "^[^a-z]"
```

What will be output of the above command?

(a) The filenames in the current directory which start with an uppercase only.

(b) The filenames in the current directory which start with a lowercase only.

(c) The filenames in the current directory which start with any character other than uppercase.

(d) The filenames in the current directory which start with any character other than lowercase.

### Answer

(d)

### Explanation

- `ls` will list the files in the current directory.
- `grep "^[^a-z]"` will match the lines that start with any character other than lowercase alphabets.
- The first carat `^` in the regular expression denotes the start of the line.
- The `[^a-z]` denotes any character other than lowercase alphabets.

---

## Question 6 A

Below is the file hirerarchy structure provided to answer the question.

```
.
├── classA
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classB
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classC
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
└── script.sh

6 directories, 10 files
```

What will be the output of `for i in */*/*; do echo $i; done`

(a)

```
classA/attendance/feb.csv
classA/attendance/jan.csv
classA/attendance/mar.csv
classB/attendance/feb.csv
classB/attendance/jan.csv
classB/attendance/mar.csv
classC/attendance/feb.csv
classC/attendance/jan.csv
classC/attendance/mar.csv
```

(b)

```
classA
classB
classC
script.sh
```

(c)

```
classA/attendance
classB/attendance
classC/attendance
```

(d)

```
attendance
attendance
attendance
attendance
attendance
attendance
attendance
attendance
attendance
```

### Answer

(a)

### Explanation

- `*/` will match all the directories in the current directory.
- `*/*/` will match all the directories inside the directories matched by the first `*/`.
- `*/*/*` will match all the files inside the directories matched by the second `*/`.

---

## Question 6 B

Below is the file hirerarchy structure provided to answer the question.

```
.
├── classA
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classB
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classC
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
└── script.sh

6 directories, 10 files
```

What will be the output of `for i in */*; do echo $i; done`

(a)

```
classA/attendance/feb.csv
classA/attendance/jan.csv
classA/attendance/mar.csv
classB/attendance/feb.csv
classB/attendance/jan.csv
classB/attendance/mar.csv
classC/attendance/feb.csv
classC/attendance/jan.csv
classC/attendance/mar.csv
```

(b)

```
classA
classB
classC
script.sh
```

(c)

```
classA/attendance
classB/attendance
classC/attendance
```

(d)

```
attendance
attendance
attendance
attendance
attendance
attendance
attendance
attendance
attendance
```

### Answer

(c)

### Explanation

- `*/` will match all the directories in the current directory.
- `*/*` will match all the files inside the directories matched by the first `*/`.

---

## Question 7

Here are the date-time format according to ISO 8601 in UTC

2022-05-06T13:00:56+00:00
2022-05-06T13:00:56Z
20220506T130056Z

Select the extended regular expression that only matches with all of the above date-time format.

(A) `^[0-9]{4}-*[0-9]{2}-*[0-9]{2}T[0-9]{2}:*[0-9]{2}:*[0-9]{2}(Z|\+00:00)$`

(b) `^[0-9]{4}-+[0-9]{2}-+[0-9]{2}T[0-9]{2}:+[0-9]{2}:+[0-9]{2}(Z|\+00:00)$`

(c) `^[0-9]{4}-?[0-9]{2}-?[0-9]{2}T[0-9]{2}:?[0-9]{2}:?[0-9]{2}(Z|\+00:00)$`

(d) `^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(Z|\+00:00)$`

### Answer

(c)

### Explanation

- The hyphen `-` is optional in the date format.
- It can either be present once or not present at all.
- `*` will match zero or more occurences of the previous character.
- `+` will match one or more occurences of the previous character.
- `?` will match zero or one occurence of the previous character.

---

## Question 8

```
$ ps
    PID TTY          TIME CMD
  64754 pts/3    00:00:00 bash
  65657 pts/3    00:00:00 sleep
  65671 pts/3    00:00:00 sleep
  65718 pts/3    00:00:00 python3
  65774 pts/3    00:00:00 ps

$ ps | grep "$$"
```

What will be the output of the last command?

(a) `PID TTY TIME CMD`

(b) `64754 pts/3 00:00:00 bash`

(c) `65718 pts/3 00:00:00 python3`

(d) `65774 pts/3 00:00:00 ps`

### Answer

(b)

### Explanation

- `$$` expands to the `PID` of the current shell, which is bash as per `ps` output.
- So the PID `64754` will be used by grep to match that line and print it.

---

## Question 9

```bash
echo 'Hello, World' > out 1>&2
```

Select the correct statement(s) based on the above command. [MSQ]

(a) The file `out` contains the text `Hello, World`

(b) The text `Hello, World` will be printed as terminal output

(c) The file `out` contains the no text (empty file)

(d) No text will be printed as terminal output

### Answer

(b), (c)

### Explanation

- The output will be redirected to the stderr as the `1>&2` is present.
- Thus the file `out` will be empty.

---

## Question 10

```bash
cp a b # Command 1
mv b c # Command 2
mv c d # Command 3
mv a d # Command 4
cp a b # Command 5
mv b d # Command 6
```

How many files will be present in the current working directory given that file `a` is the only file present initially? [NAT]

### Answer

1

### Explanation

- `cp a b` makes a copy of file `a` to `b`, now there are 2 files.
- `mv b c` simply renames `b` to `c`, still 2 files.
- `mv c d` simply renames `c` to `d`, still 2 files.
- `mv a d` renames `a` to `d` and overwrites the initial `d`, now only 1 file is present.
- `cp a b` fails as there is no `a` anymore, still 1 file.
- `mv b d` fails as there is no `b` anymore, still 1 file.

---

## Question 11

```bash
cp a b # Command 1
mv b c # Command 2
mv c d # Command 3
mv a d # Command 4
cp a b # Command 5
mv b d # Command 6
```

Select the command(s) that return an error given that file `a` is the only file present initially. [MSQ]

(a) `cp a b # Command 1`
(b) `mv b c # Command 2`
(c) `mv c d # Command 3`
(d) `mv a d # Command 4`
(e) `cp a b # Command 5`
(f) `mv b d # Command 6`

### Answer

(e), (f)

### Explanation

- `cp a b` makes a copy of file `a` to `b`, now there are 2 files.
- `mv b c` simply renames `b` to `c`, still 2 files.
- `mv c d` simply renames `c` to `d`, still 2 files.
- `mv a d` renames `a` to `d` and overwrites the initial `d`, now only 1 file is present.
- `cp a b` fails as there is no `a` anymore, still 1 file.
- `mv b d` fails as there is no `b` anymore, still 1 file.

---

## Question 12

Select the command(s) that find the file/directory names that starts with `a` and ends with `e` (case-sensistive). [MSQ]

(a) `ls | grep '^a.*e$'`

(b) `grep 'a.*e'`

(c) `echo a*e`

(d) `echo *a*e*`

### Answer

(a), (c)

### Explanation

- `^` stands for start of line.
- `$` stands for end of line.
- `.*` stands for any character present any number of times.
- `^a.*e$` matches all lines which starts with `a` and ends with `e`.
- `ls` lists out all the files and directories in the current directory.
- `ls | grep '^a.*e$'` prints out the names of the files and directories in the current directory that starts with `a` and ends with an `e`.
- `echo a*e` prints out the names of the files and directories in the current directory that starts with `a` and ends with an `e`.
- This is done using shell globbing instead of regex.
- We dont need to use `.*` here, `*` itself means any character any number of times.
- The `^` and `$` is automatically implied in globbing.

---

### Question 13

What will the text in the file `notes.txt` after executing the below commands?

```bash
$ echo one > notes.txt
$ cat >> notes.txt
two
```

(a)

```text
one
```

(b)

```text
two
```

(c)

```text
one
two
```

(d) The file `notes.txt` is empty.

### Answer

(c)

### Explanation

- The command `echo one > notes.txt` will store the text `one\n` to the file `notes.txt`.
- The command `cat >> notes.txt` will read the standard input and append it to the file `notes.txt`.
- The standard input given is `two`.
- So the total contents of the file is `one\ntwo`.

---

## Question 14

Select the command(s) that append the contents of `file2` into `file1`. [MSQ]

(a) `cp file2 file1`

(b) `cat file2 > file1`

(c) `cat file2 >> file1`

(d) `cat file1 file2 > file1`

### Answer

(c)

### Explanation

- `cp file2 file1` will overwrite the contents of `file1` with the contents of `file2`.
- `cat file2 > file1` will overwrite the contents of `file1` with the contents of `file2`.
- `cat file2 >> file1` will append the contents of `file2` to `file1`.
- `cat file1 file2` will print the contents of file1 followed by the contents of `file2`,
  - but since we are redirecting it to `file1`, first the shell will truncate the file,
  - and only then call the `cat` command, thus the output of `cat` will be only the contents of `file2`
- Thus `cat file1 file2 > file1` will overwrite the contents of `file1` with the contents of `file2`.


---

## Question 15

```bash
#!/usr/bin/bash

sleep 10 &
sleep 10 &
sleep 10 &
echo Good Morning
```

When will the text `Good Morning` will be displayed?

(a) After 10 seconds

(b) After 20 seconds

(c) After 30 seconds

(d) Instantly (<1 second)

### Answer

(d)

### Explanation

- The three `sleep` commands are run in background using the `&` symbol.
- This means they are non-blocking and run asynchronously.
- Thus the `echo Good Morning` command will run instantly.

---

## Question 16

```bash
#!/usr/bin/bash

sleep 10 && sleep 10
sleep 10 &
echo Good Morning
```

When will the text `Good Morning` will be displayed?

(a) After 10 seconds

(b) After 20 seconds

(c) After 30 seconds

(d) Instantly (<1 second)

### Answer

(b)

### Explanation

- The `sleep 10 && sleep 10` command is run in foreground, and thus will block the terminal.
- The first `sleep` command will wait for 10 seconds before exiting with exit code 0.
- Since the command exits with exit code 0, thus the next operand of the `&&` is also executed.
- Thus the next `sleep` command is also executed and waits again for 10 seconds.
- After a total of 20 seconds from start, the second `sleep` command finishes with exit code 0.
- The third `sleep` command is run in the background and thus does not pause the terminal, and the execution moves to the next command.
- Thus the `echo Good Morning` command runs after $20$ seconds from start.

---
