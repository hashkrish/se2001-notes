# System Commands Sep 2023 Quiz 1

## Question 1 [process control] [6] [MCQ]

By using the information provided below, select a command/script from the options which prints a line with the process ID (PID) for the command `daily-backup`. The command is **only** (exclusively) started by the current user.

A sample output from `ps` command.

```shell
$ ps x
    PID TTY      STAT   TIME COMMAND
   1168 ?        Ss     0:00 /bin/sh -c cd /home/vidya/quicklinks; python3 -m http.server 7777
   2331 ?        S      0:00 /usr/bin/bash /home/vidya/server/deployment_script.sh
   2381 ?        S      0:00 /usr/bin/bash /home/vidya/server/deployment_script.sh
   5293 ?        S      0:00 (sd-pam)
   8293 ?        S      0:00 /usr/bin/bash
   1381 ?        S      0:00 /home/vidya/.local/bin/daily-backup
   1361 ?        S      0:00 /home/vidya/.local/bin/daily-backuper.sh

$ ps
    PID TTY           TIME COMMAND
   8293 pts/32        0:00 /usr/bin/bash
   8973 pts/32        0:00 ps

$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root       96641  0.0  0.0      0     0 ?        I<   16:04   0:00 [kworker/u17:1-i915_flip]
root       96656  0.0  0.0      0     0 ?        I    16:04   0:00 [kworker/3:1-events]
root       96827  0.0  0.0      0     0 ?        I    16:04   0:00 [kworker/1:1-events]
vidya   96844  0.3  1.1 1188997100 90548 ?    Sl   16:05   0:00 /opt/google/chrome/chrome
vidya   96919  0.0  0.1  21608  8216 pts/21   S    16:05   0:00 /usr/bin/zsh
vidya   96920  0.0  0.1  21640  8224 pts/21   S    16:05   0:00 /usr/bin/zsh
vidya   96921  0.0  0.0  13716  3328 pts/21   R+   16:05   0:00 ps aux
```

(a) `ps x | grep '\b/home/vidya/.local/bin/daily-backup\b'`

(b) `ps | grep daily-backup`

(c) `ps aux | grep daily-backup`

(d) `ps x | grep daily-backup`

### Answer

(a)

### Explanation

- We get the daily-backup script in the output of `ps x`, so answer should also have `ps x` in the command.
- If we simply grep for `daily-backup` then it will also match the `daily-backuper.sh` script which is not required.
- Using `\b` or `-w` option in grep will match the exact word `daily-backup` and not `daily-backuper.sh`.

<div style="page-break-after: always;"></div>

## Question 2 [grep, pipe] [9] [MSQ]

Select command(s)/script(s) from the options which will extract the inner rectangle made of 'x' from the pattern shown below which is stored in file `bounded_rectangle.txt`.

Note: Boundary spaces are not considered but the proportionality, scale, and number of characters of inner rectangle should be the same.

**Hint:**

```
$ echo -e '123\n12'
123
12

$ echo -e '123\n12' | rev
321
21

```

**Sample Input: bounded_rectangle.txt**

```
***************************
*                         *
*                         *
* xxxxxxxxxxxxxxxxxxxxxxx *
* x                     x *
* x                     x *
* x                     x *
* x                     x *
* xxxxxxxxxxxxxxxxxxxxxxx *
*                         *
*                         *
***************************
```

**Sample Output**

```
xxxxxxxxxxxxxxxxxxxxxxx
x                     x
x                     x
x                     x
x                     x
xxxxxxxxxxxxxxxxxxxxxxx
```

(a) `cat bounded_rectangle.txt | grep x | cut -d'*' -f2`

(b) `cat bounded_rectangle.txt  | cut -d' ' -f2- | rev | cut -d' ' -f2- | grep x`

(c) `cat bounded_rectangle.txt | grep x`

(d) `cat bounded_rectangle.txt | grep -v x`

(e) `cat bounded_rectangle.txt | egrep '[^*]+' -o`

### Answer

(a), (b), (e)

### Explanation

- (a) `cat bounded_rectangle.txt | grep x | cut -d'*' -f2`
  - This command will extract the lines containing 'x' and then cut the second field separated by '\*' which will give the inner rectangle.
- (b) `cat bounded_rectangle.txt  | cut -d' ' -f2- | rev | cut -d' ' -f2- | grep x`
  - This command will remove the first column of spaces, then reverse the lines, then remove the first column of spaces and then extract the lines containing 'x'.
  - As the pattern is symmetric, so we do not reverse the output again, otherwise it would be required.
- (e) `cat bounded_rectangle.txt | egrep '[^*]+' -o`
  - This command prints all those patterns which do not contain '\*' and prints them in separate lines.
- (a) will contains spaces to left and right of the rectangle.
- (b) will not contain any extra spaces.
- (e) will contain spaces before and after the rectangle.

<div style="page-break-after: always;"></div>

## Question 3 [grep] [6] [MCQ]

Select a command from the given options which will find and print **a number** hidden in the text comprising of [a-zA-Z,.]. Note that there is only one numeric character while rest of the characters are either alphabets or punctuation.

```bash
$ cat hidden_number.txt
Loremipsumdolorsitame
t,consecteturadipisci
ngelit,seddoeiusmodte
mporincididuntutlabor
eetdoloremagnaaliqua.
Condimentumlaciniaqui
sveleros.Sitametmauri
scommodoquisimperdiet
massatinciduntnunc.Le
ctusurnaduisconvallis
convallistellusidinte
rdumvelitlaoreet.Ferm
entumetsollici1udinac
orci.Aarcucursusvitae
conguemaurisrhoncusae
neanvel.Acfeugiatsedl
ectusvestibulummattis
ullamcorper.Sedadipis
cingdiamdonecadipisci
ngtristiquerisus.Volu

$ grep --help
Usage: grep [OPTION]... PATTERNS [FILE]...
Search for PATTERNS in each FILE.
Example: grep -i 'hello world' menu.h main.c
PATTERNS can contain multiple patterns separated by newlines.

...
  -o, --only-matching       show only non-empty parts of lines that match
...

```

(a) `grep -v '[a-zA-Z,.]' hidden_number.txt`

(b) `grep '[a-zA-Z,.]' hidden_number.txt`

(c) `grep '[0-9]' hidden_number.txt`

(d) `grep '[0-9]' -o hidden_number.txt`

### Answer

(d)

### Explanation

- (a) will print no lines, as each line contains alphabets or punctuation, so the output will be empty.
- (b) will print entire file as each line contains alphabets or punctuation.
- (c) will print the correct line, but it will print the entire line.
- (d) will print the correct line, but it will print only the number.

<div style="page-break-after: always;"></div>

## Question 4 [Shell variables, positional parameters] [6] [NAT]

At the end of the execution of the following script what will be the last value of `val1`.

```bash

$ cat .myscript.sh
#!/bin/bash

echo "Using \$*:"
for arg in "$*"; do
  val1=$arg
  echo $val1
done

echo "Using \$@:"
for arg in $@; do
  val2=$arg
  echo $val2
done

$ ./myscript.sh 11 22 33

```

### Answer

11 22 33

### Explanation

- `$*` and `$@` are used to access all the positional parameters passed to the script.
- `$*` is a string of the arguments, and `$@` is an array of the arguments.
- If we use double quotes with `$*` then it will treat all the positional parameters as a single string.
- The for loop will run only once, with the entire string.
- If `$@` is used without double quotes then it will treat each positional parameter as a separate argument, and it will be quoted correctly, so that even if an argument is multi-word, it will not be split into separate iterations.

<div style="page-break-after: always;"></div>

## Question 5 [Links] [6] [MSQ]

Which of the following are **TRUE** statements for hardlinks and softlinks?

(a) Hardlink of a file has same inode number

(b) Softlink of a file has same inode number

(c) Softlink of a file occupies the same space (i.e. same size) as the original file

(d) Hardinks cannot be moved to a different File system

(e) Softlink of a file unconditionally requires full path

(f) Changes done in the original file is reflected in its hardlink

### Answer

(a), (d), (f)

<div style="page-break-after: always;"></div>

## Question 6 [Subshells] [6] [NAT]

The following commands are executed in the given order. Enter the duration ( in number of seconds) after which the echo command will be executed.

```bash
$ sleep 1
$ $(sleep 10)
$ sleep 100 &
$ echo "Done"
```

### Answer

11

### Explanation

- `sleep 1` will sleep for 1 second and block the terminal for 1 second.
- `$(sleep 10)` will sleep for 10 seconds and block the terminal for 10 seconds, even though it is executed in a subshell.
- `sleep 100 &` will sleep for 100 seconds and will be executed in the background, thus not blocking the terminal.
- Total time before echo is printed is 11 seconds.

<div style="page-break-after: always;"></div>

## Question 7 [Shell arithmetics] [6] [NAT]

What is the output of the following command?

```bash
$ echo $(( 10 * 10 - 5 * 4 ))
```

### Answer

80

### Explanation

Simple PEMDAS rule is followed, so the multiplication and division is done first and then the addition and subtraction.

<div style="page-break-after: always;"></div>

## Question 8 [brace expansion] [8] [MSQ]

Which of the following options contains command(s) which will output calendar for October and November of 2023.

(a) `echo cal\ {10,11}\ 2023\;`

(b) `$(echo cal\ {10,11}\ 2023\;)`

(c) `echo cal\ {10,11}\ 2023\;|bash`

(d) `$($(echo cal\ {10,11}\ 2023\;))`

(e) `eval "$(echo cal\ {10,11}\ 2023\;)"`

### Answer

(c), (e)

### Explanation

- (a) will not work as the command is not executed, simply printed.
- (b) will not work as the semicolons will be treated as part of the string and not as a command separator.
- (c) will work as the output of the echo command will be piped to bash and executed.
- (d) is same as (b) inside another `$()`, inner one itself will throw error, so outer will do nothing.
- (e) will work as the output of the echo command will be evaluated by `eval` and executed.

<div style="page-break-after: always;"></div>

## Question 9 [Links] [7] [NAT]

The following is an output of the 'ls -li' command. Based on the information present in the output; how many hardlinks are present for the parent directory (`testdir`).

Hint: Each directory has two hardlinks, one for `.` and another for `..` and in addition to it, each subdirectory increments the count of hardlinks to the parent directory by one.

```bash
$ cd testdir
$ ls -li
total 68
122703 drwxr-xr-x 2 systemcommands systemcommands  4096 Sep 25 11:28 2021Aug
116829 drwxr-xr-x 2 systemcommands systemcommands  4096 Sep 25 06:49 folder1
116830 drwxr-xr-x 2 systemcommands systemcommands  4096 Sep 25 06:49 folder2
116831 drwxr-xr-x 2 systemcommands systemcommands  4096 Sep 25 07:10 folder3
122704 -rw-r--r-- 1 systemcommands systemcommands  8228 Sep 25 09:37 html.txt
122705 -rw-r--r-- 1 systemcommands systemcommands   605 Sep 25 09:53 onecolor.txt
122706 -rw-r--r-- 1 systemcommands systemcommands   440 Sep 25 10:38 onecolor1.txt
 82472 drwxr-xr-x 2 systemcommands systemcommands 12288 Sep 25 08:49 test_directory
116840 -rwxr-xr-x 1 systemcommands systemcommands   225 Sep 25 08:42 testdata.sh
116857 -rwxr-xr-x 1 systemcommands systemcommands   351 Sep 25 08:48 testdata2.sh
```

### Answer

7

### Explanation

- The `testdir` directory has 5 subdirectories (`2021Aug`, `folder1`, `folder2`, `folder3`, `test_directory`).
- Thus it has 5 + 2 = 7 hardlinks.

<div style="page-break-after: always;"></div>

## Question 10 [Pipes] [8] [NAT]

What will be the output of the following command?

`cat /etc/passwd |tr ':' ','|head -30|tail -10|sort -k4,4|cut -d, -f3|head -1`

Following is the relevant part of `/etc/passwd` file on which the command is run (i.e. output of the `cat /etc/passwd |head -30|tail -10` command).

```bash
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
systemcommands:x:1000:1000:,,,:/home/systemcommands:/bin/bash

```

### Answer

104

### Explanation

- `cat /etc/passwd |tr ':' ','|head -30|tail -10|sort -k4,4|cut -d, -f3|head -1`
  - `cat /etc/passwd` will print the contents of the file.
  - `tr ':' ','` will replace all the colons with commas.
  - `head -30` will print the first 30 lines.
  - `tail -10` will print the last 10 lines.
  - The output of this is same as the given output but with commas instead of colons.
  - `sort -k4,4` will sort the lines based on the 4th field.
    - But -t option is not provided, so it will consider the entire line as a field.
    - So it sorts by the entire line.
    - Line starting with `_apt` will come first lexically.
  - `cut -d, -f3` will cut the 3rd field based on the delimiter `,`.
  - `head -1` will print the first line.

<div style="page-break-after: always;"></div>

## Question 11 [Test and Bash] [7] [NAT]

Below is the file hierarchy structure provided to answer the question.

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

Following script is executed on the directory `classA` (`dir` variable). For what value (`num` variable) will the script output `true` upon execution of the script. [NAT]

```bash
#!/bin/bash
dir=$1
num=$2
[[ $num -eq `ls $dir | wc -l` ]] && echo true || echo false
```

### Answer

1

### Explanation

The question asks how many lines are there in output of `ls classA`. As it has only one folder `attendance`, so the output will be 1.

<div style="page-break-after: always;"></div>

## Question 12 [regex] [6] [MCQ]

ISO 8601 date-time formats in UTC are shown below. From the options select the correct extended regular expression that will match with all of the given formats.

```bash
# UTC date-time formats

2022-05-06T13:00:56+00:00
2022-05-06T13:00:56Z
20220506T130056Z

```

(a) `^[0-9]{4}-*[0-9]{2}-*[0-9]{2}T[0-9]{2}:*[0-9]{2}:*[0-9]{2}(Z|\+00:00)$`

(b) `^[0-9]{4}-+[0-9]{2}-+[0-9]{2}T[0-9]{2}:+[0-9]{2}:+[0-9]{2}(Z|\+00:00)$`

(c) `^[0-9]{4}-?[0-9]{2}-?[0-9]{2}T[0-9]{2}:?[0-9]{2}:?[0-9]{2}(Z|\+00:00)$`

(d) `^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(Z|\+00:00)$`

### Answer

(c)

### Explanation

- The hyphen should be present zero or once, not more.

<div style="page-break-after: always;"></div>

## Question 13 [process control] [6] [MCQ]

Following code block shows the commands ran in terminal. What will be the output of the last command?

```bash
$ ps
    PID TTY          TIME CMD
  64754 pts/3    00:00:00 bash
  65657 pts/3    00:00:00 sleep
  65671 pts/3    00:00:00 sleep
  65718 pts/3    00:00:00 python3
  65774 pts/3    00:00:00 ps

$ ps | grep "$$"
```

(a) `PID TTY TIME CMD`

(b) `64754 pts/3 00:00:00 bash`

(c) `65718 pts/3 00:00:00 python3`

(d) `65774 pts/3 00:00:00 ps`

### Answer

(b)

### Explanation

- `$$` is the PID of the current shell.

<div style="page-break-after: always;"></div>

## Question 14 [bash] [7] [MSQ]

For the following `while` loop, select the standard input(s) from the following options that breaks the loop.

```bash
while read line; do
    $pat = '[0-3][a-g][123][xyz]'
    [[ $line =~ $pat ]] && break
done
```

(a) 8iadaz

(b) 3g2z

(c) jkjkjkjk2j2yjkjk

(d) .a.a.a.2.2.1.

(e) 00210132a1z01231

(f) 1a2w01231

### Answer

(b), (e)

### Explanation

- `3g2z` of (b) will break the loop as it matches the pattern.
- `2a1z` of (e) will break the loop as it matches the pattern.

<div style="page-break-after: always;"></div>

## Question 15 [find] [6] [MCQ]

What the following `for` loop will print at the end of the execution?

```bash
for file in `find . -maxdepth 1 -name '*.txt'`; do
  echo $(basename $file)
done

```

(a) Prints the file names of all the '.txt'  files in the current directory non recursively.

(b) Prints the file names of all the '.txt' files in the current directory recursively.

(c) Prints the file names of all the '.txt' files in the current directory and in immediate subdirectories of current working directory non-recursively.

### Answer

(a)

### Explanation

- `-maxdepth 1` will search only in the current directory and not in the subdirectories.
