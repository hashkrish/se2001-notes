# System Commands May-2023

## Question 1 (file management) [6]

```bash
mkdir mydir
touch mydir/file1.txt;touch mydir/file2.txt
mkdir mydir/subdir;touch mydir/subdir/file3.txt
rmdir mydir/subdir
```

Select the output from the above script. [MCQ]

(a) remove directory subdir

(b) remove directory `dir` and `subdir`

(c) remove files from `subdir`

(d) exit with exit code (not 0)

### Answer

(d)

### Explanation

`rmdir` command is used to remove directories. If the directory is not empty, it will not remove the directory and will exit with a non-zero exit code.

---

<div style="page-break-after: always;"></div>

## Question 2 (shell and subshells) [6]

```bash
#!/bin/bash
export MY_VAR="Sunset"
my_var="Sunrise"
echo "Var11 is: $MY_VAR"
echo "Var12 is: $my_var"
(
	my_var="Sun_rise"
	MY_VAR_var="Sun_set"
	echo "Var21 is: $MY_VAR"
	echo "Var22 is: $my_var"
	(
		MY_VAR="Sun@rise"
		my_var="Sun@set"
		echo "Var31 is: $MY_VAR"
		echo "Var32 is:${my_var}"
	) & disown
)
wait
echo "Var41 is: $MY_VAR"
echo "var42 is: $my_var"
```

What will be the value of `Var42` at the end of execution? [NAT]
(a) Sunrise

(b) Sun_rise

(c) Sun@rise

(d) Sun@set

### Answer

(a)

### Explanation

A subshell cannot change the value of parent shell, it can only create a new variable with the same name. The value of the variable in the parent shell remains the same.

---

<div style="page-break-after: always;"></div>

## Question 3 (shell variables) [6]

Identify the correct pair for the output of each command. [MCQ]

```bash
$ date
Mon Jun 12 12:28:02 IST 2023
$ date_disp=($(date)) # creates an array. each space separated fields becomes an element.
$ echo $date_disp
$ echo $date_disp[5]
$ echo ${date_disp[5]}
$ echo ${date_disp:1:8}the
```

| Sr.No | command                    | option | output   |
| ----- | -------------------------- | ------ | -------- |
| 1     | `echo $date_disp`          | a      | `onthe`  |
| 2     | `echo ${date_disp[5]}`     | b      | `Mon[5]` |
| 3     | `echo $date_disp[5]`       | c      | `2023`   |
| 4     | `echo ${date_disp:1:8}the` | d      | `Mon`    |

(a) 1→b, 2→a, 3→c, 4→d

(b) 1→d, 2→b, 3→c, 4→a

(c) 1→d, 2→c, 3→b, 4→a

(d) none of the above

### Answer

(c)

### Explanation

- `echo $date_disp` will print the first element of the array.
  - Array elements are split by space, so the first word `Mon` will be printed.
- `echo ${date_disp[5]}` will print the 6th element of the array.
  - The 6th element is `2023`.
- `echo $date_disp[5]` will print the first element of the array followed by `[5]`, this not a correct syntax to access the array element, so like command 1, it too will print `Mon` but followed by `[5]`
- `echo ${date_disp:1:8}the` will print the substring of the first element of the array starting from the 2nd character and 8 characters long, followed by `the`. But if the string ("Mon") does not have enough (9) characters, it will print as much as possible in that string. So, it will print `onthe`.

---

<div style="page-break-after: always;"></div>

``

## Question 4 (script comprehension) [7]

The following script takes list of file names as input and finds if the file is executable and counts and lists out executable files. Identify the missing code block from the following options. [MCQ]

```bash
#!/bin/bash

files=("$@")
executable_files=()

*******************
 ***Missing Code***
*******************


echo "Number of executable files: ${#executable_files[@]}"
echo "Executable files:"
for file in "${executable_files[@]}"
do
    echo "$file"
done
```

(a)

```bash
for file in "${files[@]}"
do
    if [ -x "$file" ]
    then
        executable_files+=("$file")
    fi
done
```

(b)

```bash
for file in "${files[#]}"
do
    if [ -x "$file" ]
    then
        executable_files+=("$file")
    fi
done

```

(c)

```bash
for file in "${files[@]}"
do
    if [ -x "$file" ]
    then
        executable_files=("$file") + 1
    fi
done

```

(d)

```bash
for file in "${files[@]}"
do
    if [ -f "$file" ]
    then
        executable_files+=("$file")
    fi
done

```

### Answer

(a)

### Explanation

- `${files[@]}` will expand to all the elements in the array `files`.
- `for file in "${files[@]}"` will iterate over all the files.
- `-x` option in `test` command checks if the file is executable.
- `executable_files+=("$file")` will add the file to the array `executable_files`.
- `${#executable_files[@]}` will give the number of elements in the array `executable_files`.
- `executable_files=("$file") + 1` is incorrect syntax. The correct syntax is `executable_files+=("$file")`.
- `-f` option in `test` command checks if the file exists, not executable.

---

<div style="page-break-after: always;"></div>

``

## Question 5 (grep) [7]

Select the regex to extract only the value of "email" from the below JSON file names as test.json. [MSQ]

```json
[
  {
    "name": "Chadwick Cummings",
    "email": "nulla.dignissim.maecenas@hotmail.org",
    "address": "326-2072 Sagittis Road",
    "numberrange": 9,
    "alphanumeric": "ESM17JCJ7NR"
  },
  {
    "name": "Isaac Whitaker",
    "email": "vitae.semper.egestas@icloud.ca",
    "address": "589-9277 Vivamus St.",
    "numberrange": 3,
    "alphanumeric": "CTI05YDP7BX"
  },
  {
    "name": "Bethany Potter",
    "email": "enim.gravida@protonmail.com",
    "address": "P.O. Box 807, 2790 Ut, Ave",
    "numberrange": 7,
    "alphanumeric": "VOE77ZLE0OJ"
  }
]
```

Hint: `-o` option in grep prints only the matched regular expression.

```bash
grep -o "name" test.json
name
name
name
```

(a) `grep "email" test.json | cut -d '"' -f 4`

(b) `grep -o -E '"email": "[^"]+"' test.json | cut -d '"' -f 4`

(c) `grep '"email":' test.json | cut -d ' ' -f 2`

(d) `grep 'email: ' test.json | cut -d '"' -f 4`

### Answer

(a), (b)

### Explanation

- `grep "email" test.json` will print all the lines containing the word "email".
- `cut -d '"' -f 4` will split the line by `"` and print the 4th field.
- `-o` option in `grep` will print only the matched regular expression.
- `-E` option in `grep` will enable extended regular expressions.
- `[^"]+` will match any character except `"` one or more times.

---

<div style="page-break-after: always;"></div>

## Question 6 (regex) [7]

Following file contains the information on the websites visited on certain server. From the options identify the correct regular expression (ERE) which can capture the website domain names (https//www.something.something). [MCQ]

|                                                                                              |                 |      |                 |
| -------------------------------------------------------------------------------------------- | --------------- | ---- | --------------- |
| Website                                                                                      | IP Address      | Hits | Server Location |
| https://www.bechtelar.com/alias-similique-ratione-voluptates-aliquam-delectus-qui-cumque-aut | 204.83.121.207  | 0    | CK              |
| http://www.okeefe.info/quis-repudiandae-nobis-repellendus-omnis-dolor                        | 78.86.32.75     | 6    | SE              |
| http://macejkovic.com/aut-qui-nostrum-numquam.html                                           | 74.58.20.242    | 1    | MU              |
| http://www.cummings.net/magnam-excepturi-eos-rerum-dolores                                   | 82.204.55.211   | 8    | PH              |
| http://www.barton.biz/iure-iusto-explicabo-est-soluta-recusandae                             | 252.194.135.149 | 1    | SO              |
| http://www.haag.com/et-exercitationem-id-sunt-sed-laboriosam                                 | 1.118.48.149    | 4    | PW              |
| http://www.beer.com/voluptatem-quod-nesciunt-aut.html                                        | 71.88.92.193    | 9    | SJ              |
| http://www.mann.org/omnis-ex-in-est-et.html                                                  | 249.210.50.146  | 9    | BZ              |
| http://towne.com/                                                                            | 58.17.4.75      | 9    | WF              |
| http://www.feeney.net/enim-animi-sapiente-porro-aut-velit-dicta                              | 201.58.189.12   | 3    | ML              |
| http://heaney.com/aliquid-et-rerum-porro-nesciunt-voluptate-quo-sint                         | 9.24.3.149      | 7    | KM              |
| http://bode.com/sint-ut-et-possimus-odit-debitis.html                                        | 210.73.162.76   | 6    | BQ              |

(a) `https?://[a-zA-Z]+\.[a-zA-Z]{2,}`

(b) `http?://[a-zA-Z]+\.[a-zA-Z]{1,}`

(c) `https?://[^/]+`

(d) `https?://[a-zA-Z]+\.[a-zA-Z]+\.[a-zA-Z]{2,}`

### Answer

(c)

### Explanation

- `https?` will match `http` or `https`.
- A domain name can contain numbers and symbols as well, not just `[a-zA-Z]`.
- `[^/]+` will match any character except `/` one or more times. This will match till end of domain name.
- The TLD cannot be single character, it can be 2–63 characters long.

---

<div style="page-break-after: always;"></div>

``

## Question 7 (redirections) [8]

Which of the following command will generate output for both `test.out` and `test.err` files. Assume that the `ech` is not a command and will generate a error message. [MCQ]

(a) `(echo "test" && ech) > test.err 2>&1 | tee -a test.out`

(b) `(echo "test" && ech) 2> test.err | tee  >test.out`

(c) `(echo "test" && ech) > test.err 2>&1 | tee  >test.out`

(d) `$(echo "test" && ech) > test.err 2>&1 | tee  >test.out`

### Answer

(b)

### Explanation

- `&&` will execute the next command only if the previous command is successful.
- `ech` is not a command, so it will generate an error message.
- `2>` will redirect the standard error to the file `test.err`.
- `> test.err 2>&1` will redirect the standard output and standard error, both, to the file `test.err`. The tee gets no standard input in this.
- `tee >test.out` will redirect the standard output to the file `test.out`.

---

<div style="page-break-after: always;"></div>

``

## Question 8 (pipes) [6]

`man cut` partial output

```bash
CUT(1)                                              User Commands                                             CUT(1)

NAME
       cut - remove sections from each line of files

SYNOPSIS
       cut OPTION... [FILE]...

DESCRIPTION
       Print selected parts of lines from each FILE to standard output.

       With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -b, --bytes=LIST
              select only these bytes

       -c, --characters=LIST
              select only these characters

       -d, --delimiter=DELIM
              use DELIM instead of TAB for field delimiter

       -f, --fields=LIST
              select  only  these  fields;   also print any line that contains no delimiter character, unless the -s
              option is specified
```

`man sort` command partial output

```bash
SORT(1)                                             User Commands                                            SORT(1)

NAME
       sort - sort lines of text files

SYNOPSIS
       sort [OPTION]... [FILE]...
       sort [OPTION]... --files0-from=F

DESCRIPTION
       Write sorted concatenation of all FILE(s) to standard output.

       With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.  Ordering options:

       -b, --ignore-leading-blanks
              ignore leading blanks

       -d, --dictionary-order
              consider only blanks and alphanumeric characters

       -f, --ignore-case
              fold lower case to upper case characters

       -g, --general-numeric-sort
              compare according to general numerical value
       -i, --ignore-nonprinting
              consider only printable characters

       -M, --month-sort
              compare (unknown) < 'JAN' < ... < 'DEC'

       -h, --human-numeric-sort
              compare human readable numbers (e.g., 2K 1G)

       -n, --numeric-sort
              compare according to string numerical value

       -R, --random-sort
              shuffle, but group identical keys.  See shuf(1)

       --random-source=FILE
              get random bytes from FILE

       -r, --reverse
              reverse the result of comparisons

       --sort=WORD
              sort according to WORD: general-numeric -g, human-numeric -h, month -M, numeric -n, random -R, version
              -V

       -V, --version-sort
              natural sort of (version) numbers within text
```

The following are the contents of a passwd file. What will be the first line of the output of the command `cat /etc/passwd|cut -d: -f3|sort -rn` ? [NAT]

```bash
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
```

### Answer

65534

### Explanation

- `cut -d: -f3` will extract the 3rd field from each line of the input.
- `sort -rn` will sort the input in reverse numerical order.
- The first line of the output will be the highest number in the 3rd field of the passwd file.

---

<div style="page-break-after: always;"></div>

## Question 9 (links) [8]

Given the following input identify which of the statements present in options are TRUE. [MSQ]

```bash
$ ls -li
 9627 -rwxr-xr-x 1 root root 1.1M Apr 18  2022 bash
   14 -rwxr-xr-x 1 root root 700K Mar 13  2018 btrfs
   15 -rwxr-xr-x 1 root root 368K Mar 13  2018 btrfs-debug-tree
   16 -rwxr-xr-x 1 root root 364K Mar 13  2018 btrfs-find-root
   17 -rwxr-xr-x 1 root root 388K Mar 13  2018 btrfs-image
   18 -rwxr-xr-x 1 root root 368K Mar 13  2018 btrfs-map-logical
   19 -rwxr-xr-x 1 root root 364K Mar 13  2018 btrfs-select-super
   20 -rwxr-xr-x 1 root root 364K Mar 13  2018 btrfs-zero-log
   21 lrwxrwxrwx 1 root root    5 Mar 13  2018 btrfsck -> btrfs
   22 -rwxr-xr-x 1 root root 368K Mar 13  2018 btrfstune
   23 -rwxr-xr-x 3 root root  35K Jul  4  2019 bunzip2
31611 -rwxr-xr-x 1 root root 2.0M Nov 25  2021 busybox
   23 -rwxr-xr-x 3 root root  35K Jul  4  2019 bzcat
   25 lrwxrwxrwx 1 root root    6 Jul  4  2019 bzcmp -> bzdiff
   26 -rwxr-xr-x 1 root root 2.1K Jul  4  2019 bzdiff
   27 lrwxrwxrwx 1 root root    6 Jul  4  2019 bzegrep -> bzgrep
   28 -rwxr-xr-x 1 root root 4.8K Jul  4  2019 bzexe
   29 lrwxrwxrwx 1 root root    6 Jul  4  2019 bzfgrep -> bzgrep
   30 -rwxr-xr-x 1 root root 3.6K Jul  4  2019 bzgrep
   23 -rwxr-xr-x 3 root root  35K Jul  4  2019 bzip2
   31 -rwxr-xr-x 1 root root  14K Jul  4  2019 bzip2recover
   32 lrwxrwxrwx 1 root root    6 Jul  4  2019 bzless -> bzmore
   33 -rwxr-xr-x 1 root root 1.3K Jul  4  2019 bzmore
   34 -rwxr-xr-x 1 root root  35K Jan 18  2018 cat
   35 -rwxr-xr-x 1 root root  14K Apr 22  2017 chacl
   36 -rwxr-xr-x 1 root root  63K Jan 18  2018 chgrp
   37 -rwxr-xr-x 1 root root  59K Jan 18  2018 chmod
   38 -rwxr-xr-x 1 root root  67K Jan 18  2018 chown
   39 -rwxr-xr-x 1 root root  11K Jan 22  2018 chvt
```

(a) files `bzegrep` and `bzfgrep` are hard links

(b) files `bzegrep` and `bzfgrep` are soft links

(c) files `bzless` and `bzmore` are hard links

(d) files `bzcat` and `bzip2` are hard links

### Answer

(b), (d)

### Explanation

- (a) is incorrect because `bzegrep` and `bzfgrep` do not have same inode number (27, 29).
- (b) is correct because `bzegrep` and `bzfgrep` are soft links to `bzgrep`.
- (c) is incorrect because `bzless` and `bzmore` do not have same inode number, `bzless` is a soft link to `bzmore`.
- (d) is correct because `bzcat` and `bzip2` have the same inode number (23).

---

<div style="page-break-after: always;"></div>

## Question 10 (shell variable) [6]

Following lines are the part of a shell script for job submission to a server. Assume that the PBS_JOBID stores `123456.pbs` value and $HOME stores `/user` value. What would be the value of `tempdir` variable.

```bash
tpdir=`echo $PBS_JOBID | cut -f 1 -d .`
tempdir=$HOME/scratch/job$tpdir
mkdir -p $tempdir
cd $tempdir
```

(a) `/user/scratch/jobpbs`

(b) `job123456`

(c) `/user/scratch/job123456`

(d) `/scratch/jobpbs`

### Answer

(c)

---

<div style="page-break-after: always;"></div>

## Question 11 (process) [NAT]

How many background processes are running after the end of execution of the following script?

```bash
for i in {1..11}; do
	sleep 10 &
done

for i in {1..11..2}; do
	kill % # kill the last background process created
done
```

### Answer

5

### Explanation

- The first loop will create 11 background processes.
- The second loop will kill the last background process created 6 times.
- So, after the end of the script, 11 - 6 = 5 background processes will be running.

---

<div style="page-break-after: always;"></div>

## Question 12 (regex)

Choose the **most appropriate** regex to match an email address. The regex is provided in Extended Regular Expression Engine (ERE).

(a) `[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}`

(b) `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`

(c) `[A-Za-z0-9._%+-]+@*[A-Za-z0-9.-]+\.[A-Za-z]{2,}`

(d) `\b[A-Za-z0-9._%+-]*@[A-Za-z0-9.-]*\.[A-Za-z]{2,}\b`

### Answer

(b)

### Explanation

- `\b` will match the word boundary, ensuring there are no other characters before or after the pattern.
- `@` can be present exactly once, but `@*` will match 0 or more `@` characters, which is incorrect.

---

<div style="page-break-after: always;"></div>

## Question 13 (bash)

```
$ tr --help
Usage: tr [OPTION]... SET1 [SET2]
Translate, squeeze, and/or delete characters from standard input,
writing to standard output.

  -c, -C, --complement    use the complement of SET1
  -d, --delete            delete characters in SET1, do not translate
  -s, --squeeze-repeats   replace each sequence of a repeated character
                            that is listed in the last specified SET,
                            with a single occurrence of that character
  -t, --truncate-set1     first truncate SET1 to length of SET2
      --help     display this help and exit
      --version  output version information and exit

SETs are specified as strings of characters.  Most represent themselves.
Interpreted sequences are:

  \NNN            character with octal value NNN (1 to 3 octal digits)
  \\              backslash
  \a              audible BEL
  \b              backspace
  \f              form feed
  \n              new line
  \r              return
  \t              horizontal tab
  \v              vertical tab
  CHAR1-CHAR2     all characters from CHAR1 to CHAR2 in ascending order
  [CHAR*]         in SET2, copies of CHAR until length of SET1
  [CHAR*REPEAT]   REPEAT copies of CHAR, REPEAT octal if starting with 0
  [:alnum:]       all letters and digits
  [:alpha:]       all letters
  [:blank:]       all horizontal whitespace
  [:cntrl:]       all control characters
  [:digit:]       all digits
  [:graph:]       all printable characters, not including space
  [:lower:]       all lower case letters
  [:print:]       all printable characters, including space
  [:punct:]       all punctuation characters
  [:space:]       all horizontal or vertical whitespace
  [:upper:]       all upper case letters
  [:xdigit:]      all hexadecimal digits
  [=CHAR=]        all characters which are equivalent to CHAR

Translation occurs if -d is not given and both SET1 and SET2 appear.
-t may be used only when translating.  SET2 is extended to length of
SET1 by repeating its last character as necessary.  Excess characters
of SET2 are ignored.  Only [:lower:] and [:upper:] are guaranteed to
expand in ascending order; used in SET2 while translating, they may
only be used in pairs to specify case conversion.  -s uses the last
specified SET, and occurs after translation or deletion.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/tr>
or available locally via: info '(coreutils) tr invocation'
```

Using the above context, choose the command that deletes all occurrences of `a`.

(a) `cat myfile.txt | tr 'a' ' ' # there is space between single quotes`

(b) `cat myfile.txt | tr ' ' 'a' # there is space between single quotes`

(c) `cat myfile.txt | tr -d 'a'`

(d) `cat myfile.txt | tr -d '\a'`

### Answer

(c)

### Explanation

- `tr 'a' ' '` will replace all occurrences of `a` with space, this is not same as deleting something.
- `tr ' ' 'a'` will replace all occurrences of space with `a`, this is totally wrong.
- `tr -d 'a'` will delete all occurrences of `a`.
- `tr -d '\a'` will delete all occurrences of `\a`, that is the bell character, not the 'a' symbol.

---

<div style="page-break-after: always;"></div>

## Question 14 (bash) NAT

What will be the output of the following script?

```bash
read -n 4 line < <(echo abcdef)
echo $line$line
```

Hint:

```
$ cat < <(echo 123456) # send the stdout from echo command to cat as stdin
123456

$ help read
read: read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]
    Read a line from the standard input and split it into fields.

    Reads a single line from the standard input, or from file descriptor FD
    if the -u option is supplied.  The line is split into fields as with word
    splitting, and the first word is assigned to the first NAME, the second
    word to the second NAME, and so on, with any leftover words assigned to
    the last NAME.  Only the characters found in $IFS are recognized as word
    delimiters.

    If no NAMEs are supplied, the line read is stored in the REPLY variable.

    Options:
      -a array	assign the words read to sequential indices of the array
    		variable ARRAY, starting at zero
      -d delim	continue until the first character of DELIM is read, rather
    		than newline
      -e	use Readline to obtain the line
      -i text	use TEXT as the initial text for Readline
      -n nchars	return after reading NCHARS characters rather than waiting
    		for a newline, but honor a delimiter if fewer than
    		NCHARS characters are read before the delimiter
      -N nchars	return only after reading exactly NCHARS characters, unless
    		EOF is encountered or read times out, ignoring any
    		delimiter
      -p prompt	output the string PROMPT without a trailing newline before
    		attempting to read
      -r	do not allow backslashes to escape any characters
      -s	do not echo input coming from a terminal
      -t timeout	time out and return failure if a complete line of
    		input is not read within TIMEOUT seconds.  The value of the
    		TMOUT variable is the default timeout.  TIMEOUT may be a
    		fractional number.  If TIMEOUT is 0, read returns
    		immediately, without trying to read any data, returning
    		success only if input is available on the specified
    		file descriptor.  The exit status is greater than 128
    		if the timeout is exceeded
      -u fd	read from file descriptor FD instead of the standard input

    Exit Status:
    The return code is zero, unless end-of-file is encountered, read times out
    (in which case it's greater than 128), a variable assignment error occurs,
    or an invalid file descriptor is supplied as the argument to -u.
```

### Answer (Exact, ignore whitespace)

abcdabcd

### Explanation

- `read -n 4 line < <(echo abcdef)` will read the first 4 characters from the output of `echo abcdef` and store it in the variable `line`.
- `echo $line$line` will print the value of `line` twice.
- So, the output will be `abcdabcd`.

---

<div style="page-break-after: always;"></div>

## Question 15

```
#!/bin/bash

directory="mydirectory"
zip_dest="myarchive.zip"
read password
zip -r -P $password $zip_dest $directory
```

Hint:

```
$ man zip
ZIP(1)                      General Commands Manual                     ZIP(1)

NAME
       zip - package and compress (archive) files

SYNOPSIS
       zip  [-aABcdDeEfFghjklLmoqrRSTuvVwXyz!@$] [--longoption ...]  [-b path]
       [-n suffixes] [-t date] [-tt date] [zipfile [file ...]]  [-xi list]

...

DESCRIPTION
       zip  is  a compression and file packaging utility for Unix, VMS, MSDOS,
       OS/2, Windows 9x/NT/XP, Minix, Atari, Macintosh, Amiga, and Acorn  RISC
       OS.   It  is analogous to a combination of the Unix commands tar(1) and
       compress(1) and is compatible with PKZIP (Phil  Katz's  ZIP  for  MSDOS
       systems).

...
       -P password
       --password password
              Use password to encrypt zipfile entries (if any).  THIS IS INSE‐
              CURE!  Many multi-user operating systems provide  ways  for  any
              user  to see the current command line of any other user; even on
              stand-alone systems there is  always  the  threat  of  over-the-
              shoulder  peeking.   Storing the plaintext password as part of a
              command line in an automated script  is  even  worse.   Whenever
              possible, use the non-echoing, interactive prompt to enter pass‐
              words.  (And where security is truly important, use  strong  en‐
              cryption  such  as Pretty Good Privacy instead of the relatively
              weak standard encryption provided by zipfile utilities.)

...

       -r
       --recurse-paths
              Travel the directory structure recursively; for example:

                     zip -r foo.zip foo

              or more concisely

                     zip -r foo foo

              In  this case, all the files and directories in foo are saved in
              a zip archive named foo.zip, including files with names starting
              with ".", since the recursion does not use the shell's file-name
              substitution mechanism.  If you wish to include only a  specific
              subset of the files in directory foo and its subdirectories, use
              the -i option to specify the pattern of files  to  be  included.
              You  should  not  use  -r with the name ".*", since that matches
              ".."  which will attempt to zip up the parent directory  (proba‐
              bly not what was intended).

              Multiple source directories are allowed as in

                     zip -r foo foo1 foo2

              which  first  zips up foo1 and then foo2, going down each direc‐
              tory.

              Note that while wildcards to -r are typically resolved while re‐
              cursing  down directories in the file system, any -R, -x, and -i
              wildcards are applied to internal archive pathnames once the di‐
              rectories are scanned.  To have wildcards apply to files in sub‐
              directories when recursing on Unix and similar systems where the
              shell does wildcard substitution, either escape all wildcards or
              put all arguments with wildcards in quotes.  This lets  zip  see
              the wildcards and match files in subdirectories using them as it
              recurses.

...
```

For the script run.sh, identity the true statement(s) from the following options.

(a) The Bash interpreter used to run the run.sh file

(b) A new directory is created at the end of the execution

(c) The zip file is password protected

(d) The password for the zip is "password"

(e) The password for the zip cannot be obtained from the above script because it is read from the standard input

(f) A new file, `myarchive.zip` is created at the end of the execution

(g) If `zip_dest="myarchive.zip"` is replaced by `read zip_dest` then output file name is obtained from the second line of standard input

### Answer

(a), (c), (e), (f)

### Explanation

- `#!/bin/bash` is the shebang line, which tells the system to use the Bash interpreter to run the script.
- `zip -r -P $password $zip_dest $directory` will create a zip file with password protection.
- The password is read from the standard input, so it cannot be obtained from the script.
- A new file `myarchive.zip` is created at the end of the execution.
- If `zip_dest="myarchive.zip"` is replaced by `read zip_dest` then the output file name is obtained from the first line of standard input, not second line, as the `read password` is after this line.
