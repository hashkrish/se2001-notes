# Quiz-1

## Question 1 A

Initially four files `a`, `b`, `c` and `d` are present in the current directory. The below set of commands are executed. Select the file(s) those contents are <u>not</u> modified. [MSQ]

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

---

## Question 1 B

Initially four files `a`, `b`, `c` and `d` are present in the current directory. The below set of commands are executed. Select the file(s) those contents are <u>not</u> modified. [MSQ]

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

---

## Question 2

Below are the commands executed in the given sequence in an empty directory. Enter the maximum number of files present at the end of the execution. [NAT]

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

---

## Question 3i

```bash
! (ls global_config || ls local_config) > /dev/null 2>&1 && touch default_config 
```

Choose the correct statement(s) with respect to the above command. [MSQ]

Note: `&&` and `||` have same precedence.

(a) If the file `global_config` exists in the current directory then the file `default_config` will be created.

(b) If the file `local_config` exists in the current directory then the file `default_config` will be created.

(c) If the file `global_config` not exists in the current directory then the file `default_config` will be created.

(d) If the file `local_config` not exists in the current directory then the file `default_config` will be created.

### Answer

(c), (d)

---

## Question 4

```bash
command1 && command2 || command3 > /dev/null 2>&1
echo $?
```

The output from the above commands are non-zero. Choose the correct statement(s) with respect to the above commands. [MSQ]

Note: `&&` and `||` have same precedence.

(a) command1 exited with status 0 and command2 exited with status 0

(b) command1 exited with status 0 and command2 exited with status 1

(c) command1 exited with status 1 and command3 exited with status 0

(d) command1 exited with status 1 and command3 exited with status 1

### Answer

(b), (d)

---

## Question 5

```bash
ls | grep "[^a-z]"
```

What will be output of the above command?

(a) The filenames in the current directory starts with an uppercase only. 

(b) The filenames in the current directory starts with a lowercase only.

(c) The filenames in the current directory starts with other than uppercase.

(d) The filenames in the current directory starts with other than lowercase.

### Answer

(d)

---

## Question 6 A

Below is the file hirerarchy structure provided to answer the question.

```
.
├── classA
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classB
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classC
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
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

```

### Answer

(a)

---

## Question 6 B

Below is the file hirerarchy structure provided to answer the question.

```
.
├── classA
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classB
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
├── classC
│   └── attendance
│       ├── feb.csv
│       ├── jan.csv
│       └── mar.csv
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

How many files will be present in the current working directory given that file `a` is alone present initially? [NAT]

### Answer

1

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

Select the command(s) that return an error given that file `a` is alone present initially. [MSQ]

(a) `cp a b # Command 1`
(b) `mv b c # Command 2`
(c) `mv c d # Command 3`
(d) `mv a d # Command 4`
(e) `cp a b # Command 5`
(f) `mv b d # Command 6`

### Answer

(e), (f)

---

## Question 12

Select the command(s) that find the file/directory names that starts with `a` and ends with `e` (case-sensistive). [MSQ]

(a) `ls | grep 'a.*e'`

(b) `grep 'a.*e'`

(c) `echo a*e`

(d) `echo *a*e*`

### Answer

(a), (c)

---

### Question 13

What will the text in the file `notes.txt` after executing the below commands?

```bash
$ echo one > notes.txt
$ cat notes.txt >> notes.txt
two
```

(a) 

```
one
```

(b)

```
two
```

(c)

```
one
two
```

(d) The file `notes.txt` is empty.

### Answer

(c)

---

## Question 14

Select the command(s) that append the contents of `file2` into `file1`. 

(a) `cp file2 file1`

(b) `cat file2 > file1`

(c) `cat file2 >> file1`

(d) `cat file1 file2 > file1`

### Answer

(c)

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

---
