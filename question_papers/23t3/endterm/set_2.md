# System Commands Sep 2023 End Term Set-2

## Question 1 (bash) [MSQ] [8]

The following command is run in the terminal; which statements are true in the option?

```bash
grep -xF -f <(sort file1.txt) file2.txt | sort | uniq
```

**Hint**
-x matches whole lines.
-F treats the patterns as fixed strings.
-f reads the patterns from the specified file (output of sort file1.txt).

```
$ seq 5
1
2
3
4
5
$ grep '[23]' <(seq 5) # the command output stored in temporary file, and that file path is substituted in place of <seq 5)
2
3
```

(a) The `sort file1.txt` will be executed first and provide sorted input to the grep.

(b) grep will try to find a match to each line from the process substitution output with `file2.txt`.

(c) The command will fail due to the wrong implementation of process substitution.

(d) The command is correct and will produce the common lines in `file1.txt` and `file2.txt`.

### Answer

(a), (b), (d)

### Explanation

- `<(sort file1.txt)` gives path to a FD (file descriptor) which contains the sorted content of `file1.txt`.
- `grep -xF -f <(sort file1.txt) file2.txt` will find the common lines between the sorted content of `file1.txt` and `file2.txt`.
- Sorting the pattern file (`file1.txt`) has no effect on the output of `grep` as it checks in the order of the `file2`
- `sort` will sort the output of `grep` and `uniq` will remove the duplicate lines.
- This command will print the unique lines common in both the files

---

## Question 2 (bash) [6]

The following command is executed in the terminal. What would be the output of the command?

```bash
cat date.txt |sort |tail -1
```

**Sample Input**

```bash
$ cat date.txt
Jun 24,2009
April 4,2010
April 14,2009
April 24,2010
May 4,2010
May 14,2010
May 24,2010
Jun 4,2010
Jun 14,2009
Jun 24,2010
```

**Hint**
By default sort will use string-based sort and not numerical sort.

(a) Jun 24,2009

(b) April 4,2010

(c) April 14,2009

(d) April 24,2010

(e) May 4,2010

(f) May 14,2010

(g) May 24,2010

(h) Jun 4,2010

(i) Jun 14,2009

(j) Jun 24,2010

### Answer

(e)

### Explanation

- The output is the last element when the file is sorted in lexicographical order.
- This does not sort by date, so out of April, May, and June, the last month is May (M > J > A).
- Out of the three dates of May, (4, 14, 24), the last date is 24 numerically, but when sorted lexicographically, 4 comes after 14 and 24 (4 > 2 > 1).

---

## Question 3 (regex) [7]

Select the **regular expression** (ERE) that matches the date before 2022-01-01 and the amount is less than 10000.00. The date is in YYYY-MM-DD format, and the amount is in decimal format with two digits after the decimal point.

**Note:** The year is from 2000 to 2023 (both inclusive).

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
CompanyA,2021-09-20,2366.91
CompanyA,2021-10-23,3491.17
```

(a)

```
.*,20([01][0-9]|2[01])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]),[1-9][0-9]{,3}\.[0-9]{2}
```

(b)

```
.*,20[0-2][0-1]-[01][0-9]-[0-3][0-9],[0-9]{,4}\.[0-9]{2}
```

(c)

```
.*,20[00-21]-[01-12]-[01-31],[1-9999]\.[0-9]{2}
```

(d)

```
.*,20([01][0-9]|2[01])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]),[0-9]{1,4}\.[0-9]{2}
```

### Answer

(a)

### Explanation

- The year can be from 2000 to 2021, so the first two characters are fixed, third character can be 0, 1, or 2. Fourth character's range depends on third character. So (b) is incorrect, (a) and (d) have the correct year Regex. (c) is invalid as `[00-21]` means 0 or 0 to 2 or 1.
- Similarly, the month can be 1 to 12, so if first character is 0 then second character cannot be zero.
- The day can be 1 to 31, so if first character is 0 then second character cannot be zero.
- `[1-9999]` means 1 to 9 or 9 repeated 3 times, which is incorrect. The amount can be from 1 to 9999, so `[1-9][0-9]{,3}` is correct. (d) is incorrect as it also matches for `0000`.
- The amount should have two digits after the decimal point, so `[0-9]{2}` is correct.

---

## Question 4 (regex) [7]

Which commands can be used to select the package name and its version as shown in the desired output from the following log file?

**Note:** Your solution should satisfy the sample output given the sample input.

**Sample log file**

```bash
2023-12-09 status installed nginx-common:all 1.18.0-6ubuntu14.4
2023-12-09 configure libnginx-mod-http-xslt-filter:amd64 1.18.0-6ubuntu14.4 <none>
2023-12-09 status unpacked libnginx-mod-http-xslt-filter:amd64 1.18.0-6ubuntu14.4
2023-12-09 status half-configured libnginx-mod-http-xslt-filter:amd64 1.18.0-6ubuntu14.4
```

**Desired output**

```
nginx-common:all
libnginx-mod-http-xslt-filter:amd64
libnginx-mod-http-xslt-filter:amd64
libnginx-mod-http-xslt-filter:amd64
```

**Note:** Your solution should satisfy the sample output given the sample input.

**Hint**

```bash
# Relevant section from man grep

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
       {n,m}  The preceding item is matched at least n times but not more than m times.
```

(a) `grep -oE '([[:alnum:]-]*:[[:alnum:]]*)' dpkg.log`

(b) `grep -oE '[[:alnum:]-]+:[[:alnum:]]+' dpkg.log`

(c) `grep -oE '[[:alnum:]-]*:[[:alnum:]]*' dpkg.log`

(d) `grep -oE '([[:alnum:]-]+:[[:alnum:]]+)' dpkg.log`

### Answer

(b), (d)

### Explanation

- `[[:alnum:]-]+` matches one or more alphanumeric characters or hyphen.
- `:` matches the colon.
- `[[:alnum:]]+` matches one or more alphanumeric characters.
- `grep -o` prints only the matched part of the line.
- Grouping makes no difference since we are not using the backreference.
- `*` can match zero or more times, so it can match empty strings, which is not required.

---

## Question 5 (regex) [7]

Anish wanted to extract phone numbers from the following data. He knows that **grep -oE** can print the pattern selectively using Extended regular expression. Please help him choose the correct regular expression to achieve that.

**Sample Input**

```
name,phone,email,region
Madan,1-158-662-4996,madan-raja@outlook.ca,GA
Persaud,1-877-704-5869,persaud@google.edu,Meghalaya
Srivas,1-516-922-8416,k-srivas@icloud.com,HR
Swami,761-1395,swami@google.couk,Haryana
Subram,981-5610,subram3142@yahoo.org,Karnataka
Nirmal,474-7526,nirmal@icloud.org,Madhya Pradesh
Sahni,151-8534,sahni@hotmail.ca,KA
Mahajan,1-548-689-8736,mahajan@icloud.couk,Bihar
Rana,1-528-385-7783,rana4716@yahoo.org,AN
```

**Sample Output**

```
1-158-662-4996
1-877-704-5869
1-516-922-8416
761-1395
981-5610
474-7526
151-8534
1-548-689-8736
1-528-385-7783
```

(a) `[0-9]{1}\-[0-9]{3}\-[0-9]{3}\-[0-9]{4}|[0-9]{3}\-[0-9]{4}`

(b) `[0-9]{1}-[0-9]{3}-[0-9]{3}-[0-9]{4}|[0-9]{3}-[0-9]{4}`

(c) `\b[0-9]-[0-9]{3}-[0-9]{3}-[0-9]{4}\b|\b[0-9]{3}-[0-9]{4}\b`

(d) `\b[0-9].*[0-9]{3}-[0-9]{4}\b|[0-9]{3}-[0-9]{4}\b`

(e) All of the options from a to d

(f) None of the options from a to d

### Answer

(e)

### Explanation

- (b) and (c) are the correct way to match phone numbers of that pattern.
- (d) is not correct but will work for the given input.
- (a) has unnecessary escaping of the hyphen, which will throw errors, but will still work.

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
$ seq 10 | sed '1d;2d'
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

(a)

### Explanation

- `sed '1d;2d'` deletes the first and second lines.
- The output will be the lines from 3 to 10.

---

## Question 8 (sed) [9]

Choose the sed script that converts each line of the input file to an element in the JSON object. The input file contains two words per line, the first word is the key and the second word is the value. The output should be a valid JSON object of key-value pairs.

Note:

- A valid JSON object is enclosed in curly braces.
- The key and value are separated by a colon.
- The key and value are enclosed in double quotes.
- Each key-value pair is separated by a comma.
- There is no comma after the last key-value pair.

**Sample Input**

```
fruit1,apple
fruit2,banana
fruit3,orange
```

**Sample Output**

```
{
"fruit1":"apple",
"fruit2":"banana",
"fruit3":"orange"
}
```

(a)

```sed
#!/usr/bin/sed -f
1 i {
$ s/^\(.*\),\(.*\)$/"\1":"\2",/
$ a }
```

(b)

```sed
#!/usr/bin/sed -f
1 i {
$! s/^\(.*\),\(.*\)$/"\1:\2",/
$ s/^\(.*\),\(.*\)$/"\1:\2"/
$ a }
```

(c)

```sed
#!/usr/bin/sed -f
1 i {
$! s/^\(.*\),\(.*\)$/"\1":"\2",/
$ s/^\(.*\),\(.*\)$/"\1":"\2"/
$ a }
```

(d)

```sed
#!/usr/bin/sed -f
1 a {
$ s/^\(.*\),\(.*\)$/"\1":"\2",/
$ i }
```

### Answer

(c)

### Explanation

- `1 i {` will insert `{` at the beginning of the file.
- `$! s/^\(.*\),\(.*\)$/"\1":"\2",/` will replace the key-value pair with `"key":"value",` for all lines except the last line.
- `$ s/^\(.*\),\(.*\)$/"\1":"\2"/` will replace the key-value pair with `"key":"value"` for the last line.
- `$ a }` will append `}` at the end of the file.

This can also be done as follows:

```sed
#!/usr/bin/sed -f
1 i {
s/,/":"/
s/$/"/
s/^/"/
$! s/$/,/
$ a }
```

This will replace `,` with `":"`, add `"` at the beginning and end of the line, add `,` at the end of all lines except the last line, and append `}` at the end of the file and `{` at the beginning of the file.

---

## Question 9 (awk) [7]

The sample input data is provided as follows. The actual file is very long. Vinisha wanted to see if she could filter data using two conditions using bash. She wanted to look at all the Sales and HR department entries with salaries higher than 50000. Which of the following options contains code that will achieve the filtering process?

**Sample Input**

```
$ cat salarydata.txt
ID      Name        Department  Salary
101     Alice       HR          55000
102     Bob         Sales       60000
103     Charlie     Marketing   58000
104     David       HR          52000
105     Emily       Sales       63000
106     Frank       Marketing   59000
```

(a) `awk  '($3 == "HR" || $3 == "Sales") && $4 > 50000' salarydata.txt`

(b) `awk  '$3 == "HR" || $3 == "Sales" && $4 > 50000' salarydata.txt`

(c) `awk  '($3 == "HR" && $3 == "Sales") || $4 > 50000' salarydata.txt`

(d) `awk  '$3 == "HR" && $3 == "Sales" || $4 > 50000' salarydata.txt`

### Answer

(a)

### Explanation

- `&&` and `||` associate from left to right.
- Parenthesis is required for the correct logical grouping.

---

## Question 10 (awk) [7]

The following awk command is executed on the terminal. Which of the following is true about the output of the command?

`awk '/./ { count+=1 } END { print count }' file.txt`

(a) The output will be the count of all the lines with only one character present.

(b) The output will be the count of all the empty lines present in the file.

(c) The output will be the count of all the non-empty lines.

(d) The output will be the count of the total number of lines present in the file.

### Answer

(c)

### Explanation

- `/./` matches all the lines with at least one character.
- `count+=1` increments the count for each line.
- `END` block will be executed after all the lines are processed.
- `print count` will print the count of all the non-empty lines.

---

## Question 11 (process) [7]

Select the command that kills the process not owned by the user `root` and consumes the maximum CPU time. Assume you have the permission to kill any process.

**Hint:**

- The 10th column of the output of `ps aux` command (TIME) contains the total CPU time used by the process.
- The `ps aux` command can list all the processes owned by all the users.

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
    sort -k10,10 -r |
    grep -v '^root\b' |
    sed 1d |
    awk '{print $2}'
)
```

(b)

```bash
kill $(
    ps aux |
    sed 1d |
    sort -k10,10 -rn |
    grep -v '^root\b' |
    head -1 |
    awk '{print $2}'
)
```

(c)

```bash
kill $(
    ps aux |
    sed 1d |
    sort -k10,10 -r |
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
    sort -k10,10 -rn |
    sed 1d |
    awk '{print $2}' |
    head -1
)
```

### Answer

(b)

### Explanation

- `ps aux` lists all the processes.
- `sed 1d` removes the header line.
- `sort -k10,10 -rn` sorts the processes based on the CPU time in reverse order.
- `grep -v '^root\b'` filters out the processes owned by the user `root`.
- `head -1` selects the process with the maximum CPU time (the first line).
- `awk '{print $2}'` prints the PID of the process (the second column).
- The `kill` command is used to kill the process with the given PID.

- The dropping of first line has to be done before sorting, or the real answer may be dropped.
- The head should only be done after sorting and after removing the root processes, so the correct answer is taken.
- The head and awk can be combined into one awk command `awk 'NR==1 {print $2}'` to get the PID of the process with the maximum CPU time.
- Ideally the removal of root processes should be done before sorting, so that the root processes are not considered for sorting, this saves computation resources.

---

## Question 12 (diff) [NAT] [6]

The files file1.txt and file2.txt are present in the current working directory with the file1.txt composed of four lines. How many lines does file2.txt have?

Note: The line 4c4,5 is not relevant to the solution.

```diff
$ diff file1.txt file2.txt
4c4,5
< mnop
---
> mnpo
> qrst
```

### Answer

5

### Explanation

- The `c` in `4c4,5` indicates that the line in file1.txt is changed to the lines in file2.txt.
- It means that instead of line 4, there are two lines (4 and 5) in file2.
- File 1 has 4 lines, first three lines are same in both files, and the fourth line is changed to two lines in file2.
- So, file2 has 5 lines.

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

Choose the output after giving the key sequence `ddP` in the vi editor. The cursor is at the beginning of the first line.
The equivalent key sequence in emacs is `C-SPACE C-n C-w C-y`, where `C-SPACE` is the control key and the space bar pressed together.

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

(b)

### Explanation

- `dd` deletes the current line and `P` pastes the deleted line above the current line.
- The first line is deleted and pasted above the second line.
- The file remains unchanged.

---

## Question 14 (bash) [7]

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

(c) The pipe redirection used in case 2 is inefficient compared to input redirection.

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

## Question 15 (bash) [6]

Following Shell Script is used to print the common lines between two files. Please choose the option that will correct the script.

```bash
#!/bin/bash
FILENAME1="$1"
FILENAME2="$2"
IFS='\n'
for line1_file1 in $(cat "$FILENAME1")
do
       for line1_file2 in $(cat "$FILENAME2")
       do
              if [ "${line_file1}" == "${line_file2}" ]
              then
                     echo "${line1_file1}"
              fi
       done
done
```

(a) There should be a `$` before `\n` in the IFS assignment

(b) The call in for loop `$(cat ${FILENAME1})` is incorrect, and the while loop should have been used to read lines.

(c) The if statement is incorrect as it has extra space between the `[` and `$` as well as `}` and `]`.

(d) The code is correct and has no issues.

### Answer

(a)

### Explanation

- The `$` before `\n` in the IFS assignment is required, as it is used to expand the escape sequence `\n` to a newline character, without it the '\n' is taken literally.
- The for loop is correct as the `IFS` is set to a newline character, so the for loop will iterate over each line in the file.
- The if statement is correct as there should be a space between the `[` and the variable `$line_file1` and `$line_file2`. The correct syntax is `if [ "${line_file1}" == "${line_file2}" ]`. The space is needed as `[` is a command and commands need to be separated from their arguments with a space.

---
