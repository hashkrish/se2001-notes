# System Commands Sep 2023 End Term Set-1

## Question 1 (bash) [6]

```
CUT(1)                       User Commands                       CUT(1)

NAME
       cut - remove sections from each line of files

SYNOPSIS
       cut OPTION... [FILE]...

DESCRIPTION
       Print selected parts of lines from each FILE to standard output.

       With no FILE, or when FILE is -, read standard input.

       Mandatory  arguments to long options are mandatory for short op‐
       tions too.

       -b, --bytes=LIST
              select only these bytes

       -c, --characters=LIST
              select only these characters

       -d, --delimiter=DELIM
              use DELIM instead of TAB for field delimiter

       -f, --fields=LIST
              select only these fields;  also print any line that  con‐
              tains  no  delimiter  character,  unless the -s option is
              specified

       -n     (ignored)

       --complement
              complement the  set  of  selected  bytes,  characters  or
              fields

       -s, --only-delimited
              do not print lines not containing delimiters

       --output-delimiter=STRING
              use  STRING as the output delimiter the default is to use
              the input delimiter

       -z, --zero-terminated
              line delimiter is NUL, not newline

       --help display this help and exit

       --version
              output version information and exit

       Use one, and only one of -b, -c or -f.  Each LIST is made up  of
       one  range,  or many ranges separated by commas.  Selected input
       is written in the same order that it is read, and is written ex‐
       actly once.  Each range is one of:

       N      N'th byte, character or field, counted from 1

       N-     from N'th byte, character or field, to end of line

       N-M    from N'th to M'th (included) byte, character or field

       -M     from first to M'th (included) byte, character or field

AUTHOR
       Written by David M. Ihnat, David MacKenzie, and Jim Meyering.

...
```

From the context provided choose the **wrong** statement.

(a) The command `cut -d: -f1 /etc/passwd` prints the first field of each line in the file `/etc/passwd` using `:` as the delimiter.

(b) The command `echo abcd | cut -c2-3` prints `bc`.

(c) The command `echo abcd | cut -d "ab" -f2` prints `cd`.

(d) The command `echo abcd | cut --complement -c1` prints `bcd`.

### Answer

(c)

### Explanation

The `cut` command only takes a single character as the delimiter. The command `cut -d "ab" -f2` is incorrect as it uses a string as the delimiter. The correct command should be `cut -d "b" -f2`.

---

## Question 2 (bash) [NAT] [8]

The following command is executed on the Sample Input provided. Please provide the correct output of the command.

```bash
cat tongue_twisters.txt |tr ' ' '\n'|sort|uniq|head -1
```

**Sample Input**

```
If you must cross a coarse, cross cow across a crowded cow crossing, cross the cross, coarse cow across the crowded cow crossing carefully.
```

### Answer

If / a

### Explanation

The file is first piped to `tr` which converts all spaces to newlines, making
each word a separate line. The output is then sorted, and `uniq` is used to
remove duplicate lines. Finally, `head -1` is used to print the first line.

Sort will sort the lines in lexicographical order. The first line in the sorted output is 'If' as it is the only word starting with a capital letter, and capital letters have lower ASCII values (65-90) than lowercase letters (97-122).

Whether capital letters, accented characters, or other special characters come first in the sort order depends on the collation value.

For some collation values, `sort` will put 'a' at top instead. To get 'If' as the output, the command should be modified to `cat tongue_twisters.txt | tr ' ' '\n' | LC_COLLATE=C sort | uniq | head -1`.

---

## Question 3 (regex) [7]

Select the **regular expression** (ERE) that matches the date where it is on or after 2021-01-01 and the amount is greater than 10000.00.
The date is in YYYY-MM-DD format and the amount is in decimal format with two digits after the decimal point.

**Note:** The year is in the range of 2000 to 2023 (both inclusive).

**Sample Input**

```
Company,Date,Amount
CompanyA,2020-04-29,31211.18
CompanyA,2021-09-20,2366.91
CompanyA,2021-10-23,3491.17
CompanyB,2021-04-04,14304.44
CompanyA,2021-11-01,21679.58
CompanyA,2022-09-06,16277.49
CompanyA,2021-12-14,29527.37
CompanyA,2023-03-01,1447.83
CompanyA,2020-08-22,30383.23
```

**Sample Output**

```
CompanyB,2021-04-04,14304.44
CompanyA,2021-11-01,21679.58
CompanyA,2022-09-06,16277.49
CompanyA,2021-12-14,29527.37
```

(a)

```
.*,202[1-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]),[0-9]{5,}\.[0-9]{2}
```

(b)

```
.*,202[1-9]-[1-12]-[1-31],[1-9][0-9]{4,}\.[0-9]{2}
```

(c)

```
.*,202[1-9]-[1-12]-[1-31],[0-9]{5,}\.[0-9]{2}
```

(d)

```
.*,202[1-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]),[1-9][0-9]{4,}\.[0-9]{2}
```

### Answer

(d)

### Explanation

- `.*,` matches any character (except for line terminators) zero or more times.
- `202[1-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])` matches the date in the format `YYYY-MM-DD` where the year is in the range 2021-2023, the month is in the range 01-12, and the day is in the range 01-31.
- `[1-12]` is incorrect as it matches any digit in the range 1-1 or 2. `[1-31]` is incorrect as it matches any digit in the range 1-3 or 1.
- `,[1-9][0-9]{4,}\.[0-9]{2}` matches the amount in decimal format where the amount is greater than 10000.00. The first digit is forced to be non-zero to avoid matching lower numbers with leading zeroes.

---

## Question 4 (regex) [7]

Which of the following command can be used to select the package name and its version from the following log file. Please refer to the **desired output**.

**Sample log file**

```bash
2023-12-09 11:43:46 status installed nginx-common:all 1.18.0-6ubuntu14.4
2023-12-09 11:43:46 configure libnginx-mod-http-xslt-filter:amd64 1.18.0-6ubuntu14.4 <none>
2023-12-09 11:43:46 status unpacked libnginx-mod-http-xslt-filter:amd64 1.18.0-6ubuntu14.4
2023-12-09 11:43:46 status half-configured libnginx-mod-http-xslt-filter:amd64 1.18.0-6ubuntu14.4
```

**Desired output**

```
nginx-common:all 1.18.0
libnginx-mod-http-xslt-filter:amd64 1.18.0
libnginx-mod-http-xslt-filter:amd64 1.18.0
libnginx-mod-http-xslt-filter:amd64 1.18.0
```

**Note:** Your solution should satisfy the sample output given the sample input.

**Hint**

```bash
#Relevent section from man grep

 -E, --extended-regexp
              Interpret PATTERNS as extended regular expressions (EREs, see below).
 -o, --only-matching
              Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line.
 The Backslash Character and Special Expressions
       The symbols \< and \> respectively match the empty string at the beginning and end of a word.  The symbol \b matches the empty string
       at the edge of a word, and \B matches the empty string provided it's not at the edge of a word.  The  symbol  \w  is  a  synonym  for
       [_[:alnum:]] and \W is a synonym for [^_[:alnum:]].

   Repetition
       A regular expression may be followed by one of several repetition operators:
       ?      The preceding item is optional and matched at most once.
       *      The preceding item will be matched zero or more times.
       +      The preceding item will be matched one or more times.
       {n}    The preceding item is matched exactly n times.
       {n,}   The preceding item is matched n or more times.
       {,m}   The preceding item is matched at most m times.  This is a GNU extension.
       {n,m}  The preceding item is matched at least n times, but not more than m times.
```

(a) `grep -oE '\b[a-z][a-zA-Z0-9-]+:[a-zA-Z0-9.-]+' dpkg.log`

(b) `grep -oE '\b[a-z][a-zA-Z0-9-]+:[a-zA-Z0-9.-]+[0-9]{7}' dpkg.log`

(c) `grep -oE '\b[a-z][a-zA-Z0-9-]+:[a-zA-Z0-9.-]+.{7}' dpkg.log`

(d) `grep -oE '\b[a-z][a-zA-Z0-9-]+:[a-zA-Z0-9.-]+[0-9.]+' dpkg.log`

### Answer

(c)

### Explanation

- `\b` matches the empty string at the edge of a word.
- `[a-z]` matches a lowercase letter.
- `[a-zA-Z0-9-]+` matches one or more lowercase letters, uppercase letters, digits, or hyphens.
- `:` matches the colon character.
- `[a-zA-Z0-9.-]+` matches one or more lowercase letters, uppercase letters, digits, or periods.
- `.{7}` matches any character (except for line terminators) exactly seven times. This is used to match the version number.

This can also be achieved by mentioning the characters for the version number to accommodate version numbers of different length as well, as follows

```bash
grep -oE '\b[a-z][a-zA-Z0-9-]+:[a-zA-Z0-9.-]+[0-9. ]+' dpkg.log
```

---

## Question 5 (sed) [6]

Which of the following commands will change the word Alice with Rabbit for the range of lines starting from 5 to 25.

(a) `sed '5~25 s/Alice/Rabbit/' file.txt`

(b) `sed '5-25 s/Alice/Rabbit/' file.txt`

(c) `sed '5,25 s/Alice/Rabbit/' file.txt`

(b) `sed '5 s/Alice/Rabbit/; 25 s/Alice/Rabbit/' file.txt`

### Answer

(c)

### Explanation

- `5,25` specifies the range of lines from 5 to 25.
- `s/Alice/Rabbit/` substitutes the first occurrence of `Alice` with `Rabbit` in the specified range of lines.
- `5~25` is incorrect as it will substitute `Alice` with `Rabbit` in every 25th line starting from the 5th line.
- `5-25` is incorrect as it is not a valid syntax for specifying a range of lines.
- `5 s/Alice/Rabbit/; 25 s/Alice/Rabbit/` is incorrect as it will substitute `Alice` with `Rabbit` only in the 5th and 25th lines.

---

## Question 6 (find) [MSQ] [8]

Select the command(s) that retrieves the first ten lines of all the files that only end with `.md` in the current working directory and its subfolders.

Note: All the directories and files do not have space in their names

Hint:

- `-type f` option searches only for the files.
- `-name x*` option searches for the filename with the pattern with wildcard characters (not regex)

```
$ xargs --help
Usage: xargs [OPTION]... COMMAND [INITIAL-ARGS]...
Run COMMAND with arguments INITIAL-ARGS and more arguments read from input.

Mandatory and optional arguments to long options are also
mandatory or optional for the corresponding short option.
  -0, --null                   items are separated by a null, not whitespace;
                                 disables quote and backslash processing and
                                 logical EOF processing
  -a, --arg-file=FILE          read arguments from FILE, not standard input
  -d, --delimiter=CHARACTER    items in input stream are separated by CHARACTER,
                                 not by whitespace; disables quote and backslash
                                 processing and logical EOF processing
  -E END                       set logical EOF string; if END occurs as a line
                                 of input, the rest of the input is ignored
                                 (ignored if -0 or -d was specified)
  -e, --eof[=END]              equivalent to -E END if END is specified;
                                 otherwise, there is no end-of-file string
  -I R                         same as --replace=R
  -i, --replace[=R]            replace R in INITIAL-ARGS with names read
                                 from standard input, split at newlines;
                                 if R is unspecified, assume {}
  -L, --max-lines=MAX-LINES    use at most MAX-LINES non-blank input lines per
                                 command line
...

$ head --help
Usage: head [OPTION]... [FILE]...
Print the first 10 lines of each FILE to standard output.
With more than one FILE, precede each with a header giving the file name.

With no FILE, or when FILE is -, read standard input.
...

```

(a) `find . -type f -name '*.md' | xargs -L 1 head`

(b) `head $(find . -type f -name '*.md')`

(c) `find . -type f -name '*.md*' | xargs -L 1 head`

(d) `find . type f | grep md | head`

### Answer

(a), (b)

### Explanation

- `find . -type f -name '*.md'` lists all the files that end with `.md` in the current working directory and its subfolders.
- `xargs -L 1 head` reads the filenames from the standard input and passes them to the `head` command to print the first 10 lines of each file. `-L 1` will run head for each line of stdin, whereas the default behavior is to run it once and pass all lines as arguments.
- `head $(find . -type f -name '*.md')` is another way to achieve similar result. The output will be similar to previous option if `-L 1` was not mentioned. This will give all the files to `head` as arguments. `head` by default will add a separator between each file if more than one file is given as argument.
- `find . -type f -name '*.md*' | xargs -L 1 head` is incorrect as it will search for files having `.md` in anywhere in its name, not just end. (Here we use glob-like patterns, and not Regex).
- `find . type f | grep md | head` is incorrect as it will list all the files in the current directory and its subfolders, filter the files containing `md` in their names, and print the first 10 lines of the output. This will not filter the files ending with `.md`.

A few other correct options are:

```bash
find . -type f -name '*.md' -exec head {} \;       # this is same as xargs -L 1
find . -type f -name '*.md' | xargs -I {} head {}  # this is same as xargs -L 1
find . -type f -name '*.md' | xargs -n 1 head      # this will only pass one word to head (if a line has multiple words, this can be used to break that line into multiple executions for each n words)
find . -type f -name '*.md' | xargs head            # this will pass multiple files to head
find . -type f -name '*.md' -exec head {} +        # this will pass multiple files to head
find . -type f | grep '\.md$' | xargs head          # this will filter files ending with .md
```

---

## Question 7 (sed) [7]

What will be the output of the last command in the following sequence of commands?

```bash
$ seq 10
1
2
3
4
5
6
7
8
9
10
$ seq 10 | sed 1d | sed 2d
```

(a)

```
3
4
5
6
7
8
9
10
```

(b)

```
1
4
5
6
7
8
9
10
```

(c)

```
2
4
5
6
7
8
9
10
```

(d)

```
2
3
4
5
6
7
8
9
```

### Answer

(c)

### Explanation

- `seq 10` prints numbers from 1 to 10.
- `sed 1d` deletes the first line.
- `sed 2d` deletes the second line.

If you delete the first line, then the second line becomes the first line. So, the second `sed` command deletes the new second line, which is the original output's third line.

So output contains 2, 4, 5, 6, 7, 8, 9, 10.

---

## Question 8 (sed) [9]

Choose the sed script that converts each line of the input file to an element in JSON array. The input file contains one word per line. The output should be a valid JSON array of words.

Note:

- A valid JSON array is enclosed in square brackets.
- Each element of the array is enclosed in double quotes.
- Each element of the array is separated by a comma.
- There is no comma after the last element of the array.

**Sample Input**

```
apple
banana
orange
```

**Sample Output**

```
[
"apple",
"banana",
"orange"
]
```

(a)

```sed
#!/usr/bin/sed -f
1 i [
s/^/"/
s/$/",/
$ s/$/"/
$ i ]
```

(b)

```sed
#!/usr/bin/sed -f
1 a [
s/^/"/
$ s/$/",/
$! s/$/"/
$ i ]
```

(c)

```sed
#!/usr/bin/sed -f
1 i [
s/^/"/
$ s/$/",/
$! s/$/"/
$ a ]
```

(d)

```sed
#!/usr/bin/sed -f
1 i [
s/^/"/
$! s/$/",/
$ s/$/"/
$ a ]
```

### Answer

(d)

### Explanation

- `1 i [` inserts `[` at the beginning of the first line.
- `s/^/"/` adds `"` at the beginning of each line.
- `$! s/$/",/` adds `",` at the end of each line except the last line.
- `$ s/$/"/` adds `"` at the end of the last line.
- `$ a ]` appends `]` at the end of the last line.

---

## Question 9 (sed/awk) [MSQ] [7]

From the following option select the correct command which will remove all the html tags. A sample html file is provided for your reference.

**Sample Input**

```
A <b>table</b> is an arrangement of <a href="/wiki/Information" title="Information">information</a> or <a href="/wiki/Data" title="Data">data</a>,
```

**Sample Output**

```
A table is an arrangement of information or data,
```

(a) `sed 's/<[^>]*>//g' file.html`

(b) `sed 's/<[^>].*//g' file.html`

(c) `awk '{gsub(/<[^>]*>/, ""); print}' file.html`

(d) `awk '{gsub(/<[^>].*>/, ""); print}' file.html`

### Answer

(a), (c)

### Explanation

- `[^>]` matches any character except `>`.
- `*` matches the preceding element zero or more times.
- `<[^>]*>` matches any HTML tag. (any character except `>`, zero or more times, followed by `>` after a `<` character)
- `sed 's/<[^>]*>//g' file.html` removes all the HTML tags from the file.
- `awk '{gsub(/<[^>]*>/, ""); print}' file.html` removes all the HTML tags from the file.
- `gsub()` function in awk acts same as `sed` command to replace all the occurrences of the pattern with the replacement string.

---

## Question 10 (awk) [MSQ] [8]

In a large bank they keep track of a file for customer interaction every day. The files `day1.csv` and `day2.csv` hold the data of customer id, token number and counter for two days.
Select the **AWK script** to find all the customers who visited the bank on both the days and print customer id. Refer to the provided sample below. The files `day1.csv` and `day2.csv` will be passed as arguments respectively.

**day1.csv**

```
customer_id,token_number,counter
1,3473,1a
2,3480,1b
3,5034,1c
4,4368,1d
5,4755,2a
6,5150,2b
```

**day2.csv**

```
customer_id,token_number,counter
1,1254218,10z
3,1245114,11x
5,1260578,11y
7,1251738,11z
```

**Expected output**

```
customer_id
1
3
5
```

(a)

```awk
BEGIN {FS=","}
FNR == NR {a[$1]=$2; next}
a[$1] {print $1}
```

(b)

```awk
BEGIN {FS=","}
FNR != NR {a[$1]=$2; next}
a[$1] {print a[$1]}
```

(c)

```awk
BEGIN {FS=","}
FNR != NR {a[$1]=$2; next}
a[$1] {print}
```

(d)

```awk
BEGIN {FS=","}
FNR == NR {a[$1]++; next}
a[$1] {print $1}
```

### Answer

(a), (d)

### Explanation

- `BEGIN {FS=","}` sets the field separator to a comma.
- `FNR == NR {a[$1]=$2; next}` reads the first file and stores the token number in the array `a` with the customer id as the key.
- `next` skips the remaining commands and reads the next line, so second block is only executed for the second file.
- `a[$1] {print $1}` prints the customer id if the the customer id present in current line in file2 is present in the dictionary `a`, meaning it was present in file1 as well.
- It is imperative to store in array for first file, and check for presence in the array for the second file. The first file is read completely before the second file is read. This is because `FNR == NR` is true only for the first file. `FNR` is the record number in the current file, and `NR` is the record number across all files. Reverse order is not possible.
- `a[$1] {print a[$1]}` is incorrect as it will print the token number instead of the customer id.
- The dictionary value can be set to any non-zero value, as the presence of the key itself is enough to indicate that the customer visited on both days. So, `a[$1]++` is always correct, whereas `a[$1]=$2` will only work if `$2` is not zero (which is not the case in these examples).

---

## Question 11 (process) [7]

Select the command that kills the process that is not owned by the user `root` and consumes the maximum CPU usage now. Assume you have the permission to kill any process.

**Hint:**

- The third column of the output of `ps aux` command (%CPU) contains the percentage of CPU usage by the process.
- The `ps aux` command can be used to list all the processes owned by all the users.

```bash
$ ps aux | head -5 # get the first 5 lines
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.1  21416 13004 ?        Ss   11:26   0:00 /sbin/init
root           2  0.0  0.0      0     0 ?        S    11:26   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    11:26   0:00 [pool_workqueue_release]
priya       2336  0.0  0.0  11396  2744 tty1     S+   11:29   0:00 cat
$ ps aux | head -5 | sort -k2,2 -rn # sorted by second column in reverse order
priya       2336  0.0  0.0  11396  2744 tty1     S+   11:29   0:00 cat
root           3  0.0  0.0      0     0 ?        S    11:26   0:00 [pool_workqueue_release]
root           2  0.0  0.0      0     0 ?        S    11:26   0:00 [kthreadd]
root           1  0.0  0.1  21416 13004 ?        Ss   11:26   0:00 /sbin/init
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
```

(a)

```bash
kill $(
    ps aux |
    head -1 |
    sort -k3,3 -rn |
    grep -v '^root\b' |
    sed 1d |
    awk '{print $2}'
)
```

(b)

```bash
kill $(
    ps aux |
    grep -v '^root\b' |
    sed -n 1p |
    sort -k3,3 -n |
    head -1 |
    awk '{print $2}'
)
```

(c)

```bash
kill $(
    ps aux |
    sed 1d |
    sort -k3,3 -rn |
    grep -v '^root\b' |
    head -1 |
    awk '{print $2}'
)
```

(d)

```bash
kill $(
    ps aux |
    grep -v '^root\b' |
    sort -k3,3 -rn |
    awk '{print $2}' |
    sed 1d |
    head -1
)
```

### Answer

(c)

### Explanation

- `ps aux` lists all the processes owned by all the users.
- `sed 1d` removes the header line.
- `sort -k3,3 -rn` sorts the processes based on the CPU usage in reverse order.
- `grep -v '^root\b'` filters out the processes owned by the user `root`.
- `head -1` gets the process with the maximum CPU usage.
- `awk '{print $2}'` prints the PID of the process.
- `kill` command is used to kill the process with the PID.
- Doing head before sort will give us the header, which is not a process
- Doing the `sed 1d` after the sort will remove the process with the highest CPU usage, which is not correct.
- The `awk` and `head` lines can be combined to `awk 'NR==1 {print $2}'` to get the first line's second column.
- `sort -k3,3 -rn` sorts based on only 3rd column, whereas `sort -k3 -rn` will sort based on 3rd column and beyond.
- `grep -v '^root\b'` should ideally be done before the sort to avoid sorting the root processes and wasting computational resource.

---

## Question 12 (diff) [NAT] [6]

The files `file1.txt` and `file2.txt` are present in the current working directory. The file file1.txt is composed of 4 lines. Based on the diff command output, find out how many lines does file2.txt contain?
Note: The lines 2d1 and 4c3 are not relevant to the solution.

```diff
$ diff file1.txt file2.txt
2d1
< efgh
4c3
< mnop
---
> mnpo
```

### Answer

3

### Explanation

- `2d1` indicates that the second line in `file1.txt` is deleted in `file2.txt`.
- `4c3` indicates that the fourth line in `file1.txt` is changed to the third line in `file2.txt`.
- Deleting a line from total of 4 lines will leave 3 lines in `file2.txt`.
- Changing the contents of a line does not affect the total number of lines in the file.

---

## Question 13 (editor) [6]

**Text**

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Donec a diam lectus.
Sed sit amet ipsum mauris.
Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
Donec et mollis dolor.
```

Choose the output after giving the key sequence `ddp` in vi editor. The cursor is at the beginning of the first line.
The equivalent key sequence in emacs is `C-SPACE C-n C-w C-n C-y`, where `C-SPACE` is the control key and the space bar pressed together.

(a)

```
Donec a diam lectus.
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed sit amet ipsum mauris.
Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
Donec et mollis dolor.
```

(b)

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Donec a diam lectus.
Sed sit amet ipsum mauris.
Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
Donec et mollis dolor.
```

(c)

```
ipsum Lorem dolor sit amet, consectetur adipiscing elit.
Donec a diam lectus.
Sed sit amet ipsum mauris.
Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
Donec et mollis dolor.
```

(d)

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Donec a diam lectus.
Sed sit amet ipsum mauris.
Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
Donec et mollis dolor.
```

### Answer

(a)

### Explanation

- `dd` deletes the current line.
- `p` pastes the deleted line after the current line.
- On deleting the first line, the second line becomes the first line and the cursor is at the beginning of the first line (Donec a diam lectus.)
- Pasting below it causes the first line to be pasted below the second line.

---

## Question 14 (bash) [7]

Following Shell Script is used to print common lines between two files. Please choose the option to which will correct the script.

```bash
#!/bin/bash
FILENAME1="${1}"
FILENAME2="${2}"
IFS=$'\n'
for line1_file1 in $(cat "${FILENAME1}")
do
       for line1_file2 in $(cat "${FILENAME2}")
       do
              if ["${line_file1}" == "${line_file2}"]
              then
                     echo "${line1_file1}"
              fi
       done
done
```

(a) There should not be a `$` before `\n` in the IFS assignment

(b) The call in for loop `$(cat ${FILENAME1})` is incorrect and, the while loop should have been used to read lines.

(c) The if statement is incorrect as the space between the `[` and `$` is missing.

(d) The code is correct and has no issues.

### Answer

(c)

### Explanation

- The `$` before `\n` in the IFS assignment is correct, as it is used to expand the escape sequence `\n` to a newline character, without it the '\n' is taken literally.
- The for loop is correct as the `IFS` is set to a newline character, so the for loop will iterate over each line in the file.
- The if statement is incorrect as there should be a space between the `[` and the variable `$line_file1` and `$line_file2`. The correct syntax is `if [ "${line_file1}" == "${line_file2}" ]`. The space is needed as `[` is a command and commands need to be separated from their arguments with a space.

---

## Question 15 (bash) [6]

The following scripts are using various means to read a file into a script. Please select the incorrect statement from the options.

```bash
#!/bin/bash

# Case 1
while read line
do
       echo $line
done < "data.txt"

# Case 2
cat data.txt|while read line
do
       echo $line
done

# Case 3
for line in $(cat data.txt)
do
       echo $line
done

# Case 4
while IFS=':' read -r name age country; do
    echo "Name: $name, Age: $age, Country: $country"
done < "data.txt"

# Case 5
while IFS= read -r line; do
    echo "Name: $line"
done < "data.txt"
```

(a) Case 1 uses the input redirection method to read the file line-by-line.

(b) Case 2 uses the pipe redirection to feed the cat output to the while loop.

(c) The pipe redirection used in Case 2 is inefficient compared to input redirection.

(d) Case 3 uses command substitution with the for loop to read the file.

(e) Case 4 is input redirection, which reads each entry in the data.txt file (assuming the file has three columns) into individual variables.

(f) Case 5 reads the entire line of the data file and assigns it to the line variable.

(g) None of the above options are correct.

### Answer

(g)

### Explanation

- Case 1 does use input redirection to read the file line-by-line. `<` is called input redirection.
- Case 2 uses a pipe to feed the output of `cat` to the `while` loop. `|` is called a pipe.
- The pipe redirection used in Case 2 is not inefficient compared to input redirection as another command `cat` has to be run, which takes extra resources.
- Case 3 uses command substitution with the `for` loop to read the file. `$(cat data.txt)` is command substitution. As `IFS` is not set, the loop will iterate word by word.
- If multiple variables are given to read it will read first column into first variable, second column into second, and third column into third variable as per the `IFS` set.
- In Case 5 Even if the IFS is unset, the `read` command will still read line by line as that is how the `read` command works. If we used `for` loop instead then it would read entire file as one iteration.

---
