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
If

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
.*,202[12]-[01][0-9]-[0-9]{2},1[0-9]{4}\.[0-9]{2}
```

(b)
```
.*,202[1-3]-[01][0-9]-[0-9]{2},1[0-9]{4}\.[0-9]{2}
```

(c)
```
.*,202[1-9]-[01][0-9]-[0-9]{2},[0-9]{4}\.[0-9]{2}
```

(d)
```
.*,202[1-9]-[01][0-9]-[0-9]{2},[0-9]{5}\.[0-9]{2}
```

### Answer
(d)

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

---

## Question 5 (sed) [6] 
Which of the following commands will change the word Alice with Rabbit for the range of lines starting from 5 to 25.

(a) `sed '5~25 s/Alice/Rabbit/' file.txt`

(b) `sed '5-25 s/Alice/Rabbit/' file.txt`

(c) `sed '5,25 s/Alice/Rabbit/' file.txt`

(b) `sed '5 s/Alice/Rabbit/; 25 s/Alice/Rabbit/' file.txt`

### Answer
(c)

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
$! s/$/",/
$ s/$/"/
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

---

## Question 9 (sed/awk) [MSQ] [7]

From the following option select the correct command which will remove all the html tags. A sample html file is provided for your reference.

**Sample Input**
```html
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

---

## Question 10 (awk) [MSQ] [8]
In a large bank they keep track of a file for customer interaction every day. The files `day1.csv` and `day2.csv` hold the data of customer  id, token number and counter for two days. 
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
a[$1] {print a[$1]}
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
FNR != NR {a[$1]++; next}
a[$1] {print a[$1]}
```

### Answer
(a), (d)

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

---
