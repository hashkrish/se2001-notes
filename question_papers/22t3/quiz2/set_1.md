# Quiz-2 Set-1

## Max Marks: 100

## Duration: 1hr

---

## Question 1 [NAT] [6]

What will be output of the given command?

```bash
awk '/^[a-zA-Z]/ { c++ } END{ print c }' myfile.txt
```

The contents of **_myfile.txt_** are

```text
Lorem ipsum dolor sit amet,
consectetur adipisci elit,
sed eiusmod tempor incidunt
ut labore et dolore magna aliqua.

Ut enim ad minim veniam,
quis nostrum exercitationem ullam
corporis suscipit laboriosam,
nisi ut aliquid ex ea commodi consequatur.

Quis aute iure reprehenderit
in voluptate velit esse cillum
dolore eu fugiat nulla pariatur.

Excepteur sint obcaecat cupiditat non proident,
sunt in culpa qui officia deserunt
mollit anim id est laborum.
```

### Answer (Number)

14

### Explanation

- The Regex `/^[a-zA-Z]/` will match the lines starting with an alphabet.
- The awk script will count the number of lines starting with an alphabet and print the count.
- In the given input there are 14 lines starting with an alphabet, and 3 empty lines. So the output is 14.

<div style="page-break-after: always;"></div>

## Question 2 [6]

What will be the output of the below script?
Note that a single negative argument to `seq` will not give any output.

```bash
for i in $(seq 9); do
    for j in $(seq $((5-i))); do
        echo -n '* '
    done
    for j in $(seq $((i-5))); do
        echo -n '* '
    done
    echo
done
```

(a)

```text
* * * *
* * *
* *
*

*
* *
* * *
* * * *
```

(b)

```text
* * * * *
* * * *
* * *
* *
*
* *
* * *
* * * *
* * * * *
```

(c)

```text
*
* *
* * *
* * * *
* * * * *
* * * * * *
* * * * * * *
* * * * * * * *
* * * * * * * * *
```

(d)

```text
* * * * * * * * *
* * * * * * * *
* * * * * * *
* * * * * *
* * * * *
* * * *
* * *
* *
*
```

### Answer

(a)

### Explanation

- The code has an outer loop that runs 9 times.
- In the inner loop we have `echo -n` and only in the outer loop we have `echo`,
- so the outer loop iterations are for each line, whereas the inner loop iterations are for each column of that line.
- There are two inner loops, one till `5-i` and the other till `i-5`.
- In `seq` command, if the argument is negative, it will not give any output.
- For the first 4 lines, the first inner loop runs and prints the stars, whereas the second inner loop is not run.
- In the last 4 lines, the second inner loop runs and prints the stars, whereas the first inner loop is not run.
- For the fifth line, both the inner loops do not print anything, thus the fifth line is empty.
- `5-i` is a decreasing function, and `i-5` is an increasing function, so first half out output will be decreasing stars and the second half will be increasing stars.

<div style="page-break-after: always;"></div>

## Question 3 [MSQ] [6]

Select the command(s) that prints only the lines containing the string `TODO` in any part of the line in the file `todo.txt`

(a) `awk '{print TODO}' todo.txt`

(b) `awk '/TODO/ {print}' todo.txt`

(c) `awk '{ if ($1 ~ /TODO/) {print;} }' todo.txt`

(d) `awk '{ if ($0 ~ /TODO/) {print;} }' todo.txt`

### Answer

(b) and (d)

### Explanation

- (a) will simply print the text 'TODO' for each line in the file.
- (b) checks if the line matches the regex `/TODO/` and prints the line if it matches.
- (c) checks if the first field matches the regex `/TODO/` and prints the line if it matches. This will not work if TODO is present in any other field.
- (d) checks if the whole line matches the regex `/TODO/` and prints the line if it matches.
- Both (b) and (d) will print the lines containing the string `TODO` in any part of the line.

<div style="page-break-after: always;"></div>

## Question 4 [8]

Which command will print only the multi-line strings from the python file named **_myscript.py_**?
_Example_:

```text
my_multiline = """
a
b
c
d
"""
```

_Note_:

1. The multi-line string will start with `"""` and ends with `"""`
2. There will be a single equal sign (`=`) before starting `"""` and there can be spaces in-between them.
3. There is no text after starting `"""`
4. There is no text before and after at ending `"""` in the same line.
5. `-v` option in grep will print only the non-matched lines.

(a)

```bash
sed -n '/= *"""/,/"""/ p' myscript.py | grep -v '"""'
```

(b)

```bash
sed '/= *"""/,/"""/ d' myscript.py
```

(c)

```bash
sed -n '/= *"""/,/"""/ p' myscript.py | grep '"""'
```

(d)

```bash
sed -n '/=*"""/,/"""/ p' myscript.py | grep """"
```

### Answer

(a)

### Explanation

- The `sed` command will print the lines between the lines containing `= """` and `"""`.
- The `grep -v '"""'` will print only the non-matched lines, so the starting and ending `"""` are omitted.

<div style="page-break-after: always;"></div>

## Question 5 [6]

How many lines will be printed if the following command is executed? Assume that **_myfile.txt_** contains more than 3 lines.

```bash
sed '
1 i ---START---
3 c ---THREE---
$ a ---END---
' myfile.txt
```

(a) Same as the number of lines in _myfile.txt_

(b) Number of lines in _myfile.txt_ + 1

(c) Number of lines in _myfile.txt_ + 2

(d) Number of lines in _myfile.txt_ + 3

### Answer

(c)

### Explanation

- The `1 i ---START---` will insert the text `---START---` before the first line. This increases the total count of lines by one.
- The `3 c ---THREE---` will replace the third line with `---THREE---`. This does not change the total count of lines.
- The `$ a ---END---` will append the text `---END---` after the last line. This increases the total count of lines by one.
- So the total number of lines printed will be the number of lines in _myfile.txt_ + 2.

<div style="page-break-after: always;"></div>

## Question 6 [6]

Choose the command that converts comma separated file named _data.csv_ to a tab separated file named _data.tsv_. Assume there is no comma in the field values.

(a) `mv data.csv data.tsv`

(b) `sed 's/\t/,/' data.tsv > data.csv`

(c) `sed 's/,/\t/g' data.csv > data.tsv`

(d) `sed '/,/ c \t' data.csv > data.tsv`

### Answer

(c)

### Explanation

- The `sed 's/,/\t/g'` command will replace all the commas with tabs in the file.
- Renaming a file does not automatically change the file type.

<div style="page-break-after: always;"></div>

## Question 7 [MSQ] [8]

Select the command(s) that list all regular users in the system. UID of regular users is greater than $999$ and their default shell is bash `/usr/bin/bash`.
Note: The option `-E` enables the Extended Regular Expression (ERE) in sed.

The file `/etc/passwd` contains the user information. The format of the file is specified below

```
username:x:UID:GID:Description:Home Directory:Full Path to Shell
```

(a) `sed -nE '/.+:.:[[:digit:]]{4,}:.*bash/ p' /etc/passwd`

(b) `sed -nE '/.+:.:[[:digit:]]{3}:.*bash/ p' /etc/passwd`

(c) `awk '$3 > 999 && $7 ~ /.*bash/ {print $1}' /etc/passwd`

(d) `awk 'BEGIN{FS=":"} $3 > 999 && $7 ~ /.*bash/ {print $1}' /etc/passwd`

### Answer

(a), (d)

### Explanation

- (a) will print the lines that have UID greater than $999$ and the shell is bash. Any number bigger than $999$ will have $4$ or more digits.
- (b) will print the lines that have UID which is exactly $3$ digits. So it will not print the users with UID greater than $999$.
- (c) does not mention the field separator, so it will not work as expected.
- (d) will print the lines that have UID greater than $999$ and the shell is bash. The field separator is set to `:`.

<div style="page-break-after: always;"></div>

## Question 8 [MSQ] [8]

The contents of the current working directory are given below.

```shell
$ ls -R
.:
a  b

./a:
file0  file1  file2  file3  file4

./b:
file10  file3  file4  file5  file6
```

Select all the file(s) that will be present in the current working directory after executing the below script.

```bash
cd a
for i in *; do
    ls ../b | grep $i || mv $i ../b
done
```

(a) file0

(b) file1

(c) file2

(d) file3

(e) file4

### Answer

(b), (d), (e)

### Explanation

- The script iterates over all files of folder `a` and sees if the file name _matches_ any file name in folder `b`.
- If it does match then the file is not moved, otherwise, the file is moved to folder `b`.
- Here file `file1` will match the file `file10` because regex matches any substring of a string.
- Thus, the files `file0`, `file3`, `file4`, will remain in folder `a` and the files `file0`, `file2` will be moved to folder `b`.

<div style="page-break-after: always;"></div>

**Common data for question 9, 10 and 11**
The file `/etc/group` stores the group information of the system in the format given below

```
GroupName:x:GID:Members(separated by comma)
```

An example line from `/etc/group` file is given below

```
student:x:214:ram,ahmed,robert,seema
```

The file `/etc/passwd` contains the user information. The format of the file is given below

```
username:x:UID:GID:Description:Home Directory:Full Path to Shell
```

From `man awk`,

```
split(s, a [, r [, seps] ])
  Split  the string s into the array a and the separators array
  seps on the regular expression r, and return  the  number  of
  fields.   If  r is omitted, FS is used instead.  The arrays a
  and seps are cleared first.  seps[i] is the  field  separator
  matched  by  r  between  a[i]  and  a[i+1].  If r is a single
  space, then leading whitespace in s goes into the extra array
  element  seps[0]  and trailing whitespace goes into the extra
  array element  seps[n],  where  n  is  the  return  value  of
  split(s, a, r, seps).  Splitting behaves identically to field
  splitting, described above.  In particular, if r is a single-
  character  string, that string acts as the separator, even if
  it happens to be a regular expression metacharacter.
```

<div style="page-break-after: always;"></div>

**_script_1_**

```bash
awk '
BEGIN {
    FS=":"
    A=0
    B=""
    C=""
}
{
    n = split($4, arr, ",")
    if (n > A) {
        A = n
        B = $1
        C = $4
    }
}
END {
    print A,B,C # Line 17
}
' /etc/group
```

## Question 9 [6]

What will be the value of `A` when the print statement in line `17` of the given script is executed?

(a) The number of lines in the input file

(b) The number of groups having more than one users

(c) The maximum number of users in any group

(d) The minimum number of users in any group

### Answer

(c)

### Explanation

- The script reads the `/etc/group` file and splits the fourth field using the delimiter `,`.
- The number of fields after splitting is stored in the variable `n`.
- The script compares the number of fields with the variable `A` and updates the variable `A` if the number of fields is greater than `A`.
- The variable `A` will store the maximum number of users in any group.
- The fourth field is the list of users of that group.

<div style="page-break-after: always;"></div>

## Question 10 [6]

What will be the value of `B` when the print statement in line $17$ of the given script is executed?

(a) The first field of last line

(b) The last occurrence of group with the maximum number of users

(c) The last occurrence of group with the minimum number of users

(d) The last occurrence of group with no users

### Answer

(b)

### Explanation

- The `B` holds the first field of the line which has the maximum number of users.
- The first field is the group name.

## Question 11 [8]

What will be the output if the output from the script **_script_1_** is piped to the script below?

```bash
awk '
{
    split($3, arr, ",")
    for (i in arr) {

        # Execute the string and get the first line of
        # the output in the variable u
        "grep ^"arr[i]": /etc/passwd" | getline u

        split(u, arr2, ":")
        print arr2[3]
    }
}
'
```

(a) The other group names in which the users from the largest group are present.

(b) The other group names in which the users from the smallest non-zero member group are present.

(c) The GIDs of the users belonging to the largest group.

(d) The GIDs of the users belonging to the smallest group.

(e) The UIDs of the users belonging to the largest group.

(f) The UIDs of the users belonging to the smallest group.

### Answer

(e)

### Explanation

- `C` holds the list of users in the group with the maximum number of users.
- The script iterates over each of the users in the group with most users.
- For each user, their username is `grep`-ed in the `/etc/passwd` file and the 3rd field is printed.
- The 3rd field is the UID of the user.

<div style="page-break-after: always;"></div>

## Question 12 [MSQ] [8]

Consider the below information to answer the question.

```shell
$ whatis kill
kill (1)             - send a signal to a process
kill (2)             - send signal to a process

$ kill --help
kill: kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]
    Send a signal to a job.

    Send the processes identified by PID or JOBSPEC the signal named by
    SIGSPEC or SIGNUM.  If neither SIGSPEC nor SIGNUM is present, then
    SIGTERM is assumed.

    Options:
      -s sig    SIG is a signal name
      -n sig    SIG is a signal number
      -l        list the signal names; if arguments follow `-l` they are
                assumed to be signal numbers for which names should be listed
      -L        synonym for -l

    Kill is a shell builtin for two reasons: it allows job IDs to be used
    instead of process IDs, and allows processes to be killed if the limit
    on processes that you can create is reached.

    Exit Status:
    Returns success unless an invalid option is given or an error occurs.

$ whatis killall
killall (1)          - kill processes by name

$ killall --help
Usage: killall [OPTION]... [--] NAME...
       killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          dont print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
  -n,--ns PID         match processes that belong to the same namespaces
                      as PID
  -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
```

Select the bash script(s) that kills all the processes of _sleep_.
(a)

```bash
killall sleep
```

(b)

```bash
while (ps ax | grep sleep); do
	kill sleep
done
```

(c)

```bash
while (ps ax | grep sleep); do
	kill $(ps ax | grep sleep | head -1 | awk '{print $1}')
done
```

(d)

```bash
while (ps ax | grep sleep); do
	kill $(ps ax | head -1 | awk '{print $1}')
done
```

### Answer

(a), (c)

### Explanation

- (a) `killall sleep` will kill all the processes with the name `sleep`.
- (b) `kill` takes a PID as an argument, but the script is trying to kill the process name `sleep`.
- (c) The script will kill the first process with the name `sleep`, and keep on looping, thus killing all the processes with the name `sleep`.
- (d) The `grep` is missing, so it will try to kill the first process in the list of processes.

<div style="page-break-after: always;"></div>

**Common data for questions 13 to 15**

In a computer science project, the students are asked to provide their remote git repository URLs. The URLs are then stored in the file named `data.csv`. There is a bash script written to validate the programs(which they submitted as git repository) written by the students. The project was structured such that `main.sh` in the project's root directory takes standard input and provides the standard output that is used for validation.

Note:

1. The fields of `data.csv` are roll number and repository URL respectively.
2. The test cases are located in the directory `testcases` which is located in home directory.
3. The structure of `testcases` directory is given below

```
~/testcases/
├── 1/
│   ├── input.txt
│   └── output.txt
├── 2/
│   ├── input.txt
│   └── output.txt
├── 3/
│   ├── input.txt
│   └── output.txt
..
```

4. All the required packages (git, diff, ...) are already installed in the system.

<div style="page-break-after: always;"></div>

```bash
#!/bin/bash

# PART-1 Getting the project files using git
# Input Field Separator (IFS)
IFS=","  # Line 1-a
while read rollno url; do # Line 1-b
    # Clone files to a new directory named with rollno
    git clone $url $rollno # Line 1-c
done  # Line 1-d

# **********************************************

# PART-2 Evaluating the project using test cases
# and generate a log file with evaluation results
TESTCASE_DIR=~/testcases # Line 2-a
LOG_FILE=~/log.csv; echo "" > $LOG_FILE
while read rollno url; do # Line 2-c
    cd $rollno # Line 2-d
    for tc in $TESTCASE_DIR/*; do
        bash main.sh < $tc/input.txt > /tmp/tmp_output # Line 2-f
        diff $tc/output.txt /tmp/tmp_output > /dev/null 2>&1 # Line 2-g
        if [ $? == 0 ]; then # Line 2-h
            echo "$rollno,$tc,PASS" >> $LOG_FILE # Line 2-i
        else
            echo "$rollno,$tc,FAIL" > $LOG_FILE # Line 2-k
        fi
    done
    cd ..
done < data.csv

# **********************************************

# PART-3 Generating results to terminal
TOTAL_TESTCASES=$(ls $TESTCASE_DIR | wc -l) # Line 3-a
echo "SUMMARY"
while read rollno url; do # Line 3-c
    passed_tc=$(grep PASS $LOG_FILE | wc -l) # Line 3-d
    echo "$rollno $passed_tc/$TOTAL_TESTCASES" # Line 3-e
done < data.csv
```

<div style="page-break-after: always;"></div>

## Question 13 [MSQ] [6]

Identify all the mistakes in the PART-1 of the script.

(a) Line 1-a: The value of the IFS variable is wrong

(b) Line 1-b: No standard input is provided, thus replacing Line 1-a with `cat data.txt | while read rollno url; do` will resolve the issue.

(c) Line 1-c: `git clone $url $rollno` is an invalid statement because no command named git is installed in the system.

(d) Line 1-d: No standard input is provided, thus replacing this with `done < data.txt` will resolve the issue.

### Answer

(b), (d)

### Explanation

- (a) The value of IFS is correct, it is set to `,` to read the fields from the CSV file.
- (b) The script is missing the standard input, so the script will not read the data from the file.
- (c) The `git` command is installed in the system, so the command is valid.
- (d) The script is missing the standard input, so the script will not read the data from the file.
- This part of the script clones all the repositories to the local system.
- The second argument of `git clone` is the directory name where the repository will be cloned.
- This is provided to ensure that the repository is cloned to unique directories, and it is easier to manage the repositories.

## Question 14 [6]

Read the description given in the comments and identify all the mistakes in the PART-2 of the script. [MCQ]

(a) Line 2-c: Standard input not provided

(b) Line 2-f: Incorrect IO redirection

(c) Line 2-g: Incorrect IO redirection

(d) Line 2-h: Incorrect condition

(e) Line 2-i: Incorrect IO redirection

(f) Line 2-k: Incorrect IO redirection

### Answer

(f)

### Explanation

- (a) The standard input is provided at the end of the while loop, so the script will read the data from the file.
- (b) The IO redirections are correct, this is taking the input from the `input.txt` file and giving to stdin of the `main.sh` script, and its output is redirected to a temporary file.
- (c) The `diff` command is used to see the _difference_ between the expected output (`output.txt`) and the actual output (`/tmp/tmp_output`). If there is no difference, the exit status will be `0`. The redirection is to suppress the output of `diff` which also prints what the difference is.
- (d) The condition is correct, if the exit status of the `diff` command is `0`, then the test case is passed.
- (e) The IO redirection is correct, the output is appended to the log file.
- (f) The IO redirection is incorrect, the output is overwritten to the log file. It should be `>>` to append the output to the file.
- The script evaluates the project using the test cases and generates a log file with the evaluation results.
- This can be done more succinctly as follows:

```bash

TESTCASE_DIR=~/testcases # Line 2-a
LOG_FILE=~/log.csv; echo "" > $LOG_FILE
while read rollno url; do # Line 2-c
    cd $rollno # Line 2-d
    for tc in $TESTCASE_DIR/*; do
        if diff <(bash main.sh < $tc/input.txt) "$tf"/output.txt > /dev/null 2>&1; then
            echo "$rollno,$tc,PASS" >> $LOG_FILE # Line 2-i
        else
            echo "$rollno,$tc,FAIL" >> $LOG_FILE # Line 2-k
        fi
    done
    cd ..
done < data.csv

```

- Here we do not create a temporary file to store the output of the main.sh script, we directly feed the output to diff.
- We do not need to use `$?` to check the exit status of the diff command, we can directly use the exit status of the command in `if`.

<div style="page-break-after: always;"></div>

## Question 15 [6]

Read the description given in the comments and identify all the mistakes in the PART-3 of the script. [MCQ]

(a) Line 3-a: Incorrect calculation of the total test cases

(b) Line 3-c: Standard input not provided

(c) Line 3-d: Incorrect calculation of the passed test cases, it should be

```bash
passed_tc=$(grep "^$rollno," $LOG_FILE | grep PASS | wc -l)
```

(d) Line 3-e: Some of the referred variables are not defined

### Answer

(c)

### Explanation

- (a) The calculation of the total test cases is correct, it counts the number of directories in the `testcases` directory.
- (b) The standard input is provided at the end of the while loop, so the script will read the data from the file.
- (c) The calculation of the passed test cases is incorrect, it should be `passed_tc=$(grep "^$rollno," $LOG_FILE | grep PASS | wc -l)` so that only the lines with the roll number and PASS are counted, not all the PASS ones.
- (d) The variables are defined in the script, so there is no issue with the variables.

<div style="page-break-after: always;"></div>
