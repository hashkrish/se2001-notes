# System Commands Jan-2023 Quiz-2 Set-1

## Question 1 (for) [6]

```bash
for i in *; do
    # -d is an unary operator returns exit status 0
    # if the operand is a directory
    if [ -d "$i" ]; then
        mv "$i" "$i.d"
    fi
done
```

Choose the correct statement with respect to the above script.

(a) The files in the current directory will not be renamed

(b) The directories in the subdirectories of the current directory will be renamed

(c) Only the empty directories will be renamed

(d) The files are moved from the current directory to another directory with its name suffixed by ".d"

### Answer

(a)

### Explanation

- The script is renaming all directories (empty or non-empty) of current directory (not subdirectories) to add a `.d` at the end.

---

<div style="page-break-after: always;"></div>

## Question 2 (for,grep) [7]

```bash
for i in *; do

    ** MISSING COMMAND **

    # -d is an unary operator returns exit status 0
    # if the operand is a directory
    if [ -d "$i" ]; then
        mv "$i" "$i.d"
    fi
done
```

Select the missing command to make the above script to produce the same result on every execution. The file/directory names will be the same after the first and every other execution will be the same.

Hint: The option `-q` in grep will not print output only returns the exit status

(a) No change required. The above script produces the same result on every execution.

(b) `ls | grep -q ".d$" && continue`

(c) `ls | grep -q "\.d$" && continue`

(d) `echo "$i" | grep -q "\.d$" && continue`

### Answer

(d)

### Explanation

- If the folder we are currently iterating over already has a `.d` in its name, then we should skip it.
- In Regex `.` is a special character, so it should be escaped.
- We should see if the current iteration file has `.d` in its name, not any file in directory.

---

<div style="page-break-after: always;"></div>

## Question 3 (grep) [8]

```
$ xargs --help | head -2
Usage: xargs [OPTION]... COMMAND [INITIAL-ARGS]...
Run COMMAND with arguments INITIAL-ARGS and more arguments read from input.

$ ls -l
total 20
drwxrwxr-x  3 amit amit  4096 Feb 28 13:29 .
drwxr-xr-x 27 amit amit 12288 Feb 28 13:28 ..
-rw-rw-r--  1 amit amit     0 Feb 28 13:29 a
-rw-rw-r--  1 amit amit     0 Feb 28 13:29 b
-rw-rw-r--  1 amit amit     0 Feb 28 13:29 c
drwxrwxr-x  2 amit amit  4096 Feb 28 13:29 d

$ ls | xargs echo
a b c d
```

Select the command(s) to move the files a, b and c to the directory d in the current working directory.

(a) `mv a b c d`

(b) `ls | xargs mv -t d`

(c) `ls | sort | xargs mv`

(d) `mv *`

### Answer

(a), (b), (c), (d)

### Explanation

- (a) `mv a b c d` will move the files a, b, c to the directory d. If we give multiple arguments (more than two) to `mv` then all except the last are files to copy and the last argument is the directory to copy into.
- (b) `-t` option in `mv` is used to specify the target directory. So we can have the target directory as the first argument as well. This is required because `xargs` will append the arguments to the end of the command. In this case even without `-t d` it should work as the natural sorted order has the directory at the end. This command with `-t` will give error for the folder `d` as it will try to move `d` inside `d` as well, but rest of the files will be moved successfully.
- (c) `sort` is redundant as output of `ls` is already sorted. This command will move all files in the current directory to the directory `d`.
- (d) `*` is a glob pattern that matches all files in the current directory. The expansion also follows sorted order. It will expand to `a b c d`. This command will move all files in the current directory to the directory `d`.

---

<div style="page-break-after: always;"></div>

**Common data for question 4, 5 ,6 and 7**

Assume the filenames will not have a colon (`:`) in it.

Use the console output to answer the questions.

```bash
$ grep --help
Usage: grep [OPTION]... PATTERNS [FILE]...
Search for PATTERNS in each FILE.
Example: grep -i 'hello world' menu.h main.c
PATTERNS can contain multiple patterns separated by newlines.
    .......
  -i, --ignore-case         ignore case distinctions in patterns and data
      --no-ignore-case      do not ignore case distinctions (default)
    .......
Output control:
    .......
  -o, --only-matching       show only nonempty parts of lines that match
  -q, --quiet, --silent     suppress all normal output
    .......
  -r, --recursive           like --directories=recurse
    .......
  -c, --count               print only a count of selected lines per FILE
    .......

$ sort --help
Usage: sort [OPTION]... [FILE]...
  or:  sort [OPTION]... --files0-from=F
Write sorted concatenation of all FILE(s) to standard output.

With no FILE, or when FILE is -, read standard input.

Mandatory arguments to long options are mandatory for short options too.
Ordering options:

    .......
  -n, --numeric-sort          compare according to string numerical value
    .......
  -r, --reverse               reverse the result of comparisons
    .......
  -C, --check=quiet, --check=silent  like -c, but do not report first bad line
      --compress-program=PROG  compress temporaries with PROG;
                              decompress them with PROG -d
      --debug               annotate the part of the line used to sort,
                              and warn about questionable usage to stderr
      --files0-from=F       read input from the files specified by
                            NUL-terminated names in file F;
                            If F is - then read names from standard input
  -k, --key=KEYDEF          sort via a key; KEYDEF gives location and type
    .......
  -t, --field-separator=SEP  use SEP instead of non-blank to blank transition
    .......

$ grep -ric "print"
tools/example.sh:0
tools/upgrade.sh:12
tools/uninstall.sh:12
tools/install.sh:44
tools/autossh.sh:3

$ cat data
13118,21233,24423
29515,22595,27723
20753,2195,4761
29399,23451,23061
725,11432,26480

$ cat data | sort -t , -k 3 -n
20753,2195,4761
29399,23451,23061
13118,21233,24423
725,11432,26480
29515,22595,27723
```

## Question 4 (bash) [6]

```bash
$ grep -ric "print" |
    sort -nr -t : -k 2 |
    cut -d: -f1 |
    head -n 10
```

What will be the output from the above command represent?

(a) Total number of _lines_ that have the string "print" in all files in the current and subdirectories

(b) Total number of _occurrences_ of "print" in all files in the current and subdirectories

(c) Top 10 files that contains most number of lines that contains the string "print" among all files in the current and subdirectories

(d) Top 10 files that contains the least number of lines that contains the string "print" among all files in the current and subdirectories

### Answer

(c)

### Explanation

- The output of the `grep` command as shown contains the count of lines of occurrences of "print" in each file separately, not a total count. (a) is wrong.
- The output of `grep -c` is the count of _lines_ of occurrences, not the count of occurrences. (b) is wrong.
- The `-r` in sort ensures a descending sorted output, the `head` takes the first 10 of those, so the output is the top 10 files with most number of lines that contain the string "print". (c) is correct and (d) is wrong.
- The `-t : -k 2` in sort is used to sort based on the second field of the output of `grep -c`, which is the count of lines.
- The `-f1` in `cut` is used to get the filename from the output of `grep -c`.

---

<div style="page-break-after: always;"></div>

## Question 5 (bash) [7]

```bash
$ grep -ric "print" |
    cut -d: -f2 |
    while read n; do
        count=${count:-0}
        count=$((count + n))
        echo $count
    done | tail -n 1
```

What will be the output from the above command represent?

(a) Total number of _lines_ have the string "print" in all files in the current and subdirectories

(b) Total number of _files_ have the string "print" in the current and subdirectories

(c) Total number of _occurrences_ of "print" in all files in the current and subdirectories

(d) Total number of _occurrences_ of "print" in all files in the current directory

### Answer

(a)

### Explanation

- The output of the `grep` command is multiple lines, each containing name of a file and the count of number of lines containing "print" in it.
- The `cut -d: -f2` is used to get the count of lines from the output of `grep -c`, the file names are removed.
- The `while` loop iterates over the stdin using `read n`.
- The loop initializes the `count` variable to 0 if it is not already set. This is redundant as the next line using `$((count + n))` will set it to 0 if it is not already set.
- The `count=$((count + n))` is used to add the count of lines from each file to the `count` variable.
- The `echo $count` prints the `count` variable after adding the count of lines from each file. This prints the cumulative count of lines containing "print" in all files in the current and subdirectories.
- The last line thus prints the total number of lines containing "print" in all files in the current and subdirectories.
- The `tail -n1` is used to print the last line of the output, which is the total count of lines containing "print" in all files in the current and subdirectories.
- The count is of lines of occurrences, not files or occurrences. (a) is correct and (b), (c), (d) are wrong.

---

<div style="page-break-after: always;"></div>

## Question 6 (awk) [6]

```bash
$ grep -ric "print" |
    cut -d: -f2 |
    while read n; do
        count=${count:-0}
        count=$((count + n))
        echo $count
    done | tail -n 1
```

What will be the equivalent command(s) using AWK with respect to the provided data? [MSQ]

(a)

```bash
grep -ric "print" |
    cut -d: -f2 |
    awk '{c+=$1} END{print c}'
```

(b)

```bash
grep -ric "print" |
    awk 'BEGIN{FS=":"} {c+=$2} END{print c}'
```

(c)

```bash
grep -ric "print" |
    awk '{c+=$1} END{print c}'
```

(d)

```bash
grep -ric "print" |
    awk 'BEGIN{FS=":"} {c=$2} END{print c}'
```

### Answer

(a), (b)

### Explanation

- (a) uses `cut` to filter out the left column (name of files) and only provide lines containing the counts to the `awk` command, which can directly add the `$0` or `$1` to the variable `c` and print it at the end.
- (b) uses `awk` to split the input on `:` and add the second field to the variable `c` and print it at the end.
- (c) uses `awk` to add the first field to the variable `c` and print it at the end. This is wrong as the input is not just the count of lines, but also the name of the files.
- (d) there is no addition done here.

---

<div style="page-break-after: always;"></div>

## Question 7 (sed) [6]

```bash
$ grep -ric "print" |
    cut -d: -f2
```

What will be the equivalent command(s) using SED with respect to the provided data? [MSQ]

(a)

```bash
grep -ric "print" |
    sed 's/.*://'
    # Assumption: no colon in the filename
    # refer sample output
```

(b)

```bash
grep -ric "print" |
    sed 's/[^:]*://'
```

(c)

```bash
grep -ric "print" |
    sed 's/[^:]*:[^:]*//g'
```

(d)

```bash
grep -ric "print" |
    sed 's/:.*//'
```

### Answer

(a), (b)

### Explanation

- (a) and (b) are correct as they remove everything before the first colon in the output of `grep -c`. This is equivalent to the `cut -d: -f2` command.
- (c) removes everything, the output will be empty.
- (d) removes everything after the first colon, which is not equivalent to the `cut -d: -f2` command.

---

<div style="page-break-after: always;"></div>

## Question 8 (sed) [6]

Choose the command to find _all_ occurrences of `{{DATE}}` in the file `template` and replace with the value of shell variable `DATE` in the file. Note that there may be spaces between `{{` and `DATE` and `DATE` and `}}`. [MSQ]
Hint: The option `-i` in SED does the in-place replacement.

(a) `sed "s/{{DATE}}/$DATE/g" template`

(b) `sed -i 's/{{[ ]*DATE[ ]*}}/$DATE/g' template`

(c) `sed -i "s/{{[ ]*DATE[ ]*}}/$DATE/g" template`

(d) `sed -i "s/{{[ ]*DATE[ ]*}}/$DATE/" template`

### Answer

(c)

### Explanation

- (a) does not account for spaces between `{{` and `DATE` and `DATE` and `}}`.
- (b) does not use double quotes for the sed command, so the shell variable `$DATE` will not be expanded.
- (c) uses double quotes for the sed command, so the shell variable `$DATE` will be expanded. It also accounts for spaces between `{{` and `DATE` and `DATE` and `}}`.
- (d) does not have the `g` flag at the end of the `s` command, so only the first occurrence of `{{DATE}}` will be replaced.

---

<div style="page-break-after: always;"></div>

## Question 9 (sed) [6]

The file 'dates.txt' has a list of dates in MM/DD/YYYY format. Which of the following commands can be used to convert it to YYYY-MM-DD format?
Hint: SED uses Basic Regular Expression Engine (BRE) by default.

(a) `sed 's/\([0-9]{2}\)\/\([0-9]{2}\)\/\([0-9]{4}\)/\3-\1-\2/' dates.txt`

(b) `sed 's/([0-9]{2})/([0-9]{2})/([0-9]{4})/\3-\1-\2/' dates.txt`

(c) `sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\4-\2-\2/' dates.txt`

(d) `sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' dates.txt`

### Answer

(d) `sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' dates.txt`

### Explanation

- (a) uses the wrong syntax for the repetition operator `{}`. The correct syntax is `\{` and `\}` in BRE.
- (b) uses the wrong syntax for the grouping operator `()`. The correct syntax is `\(` and `\)` in BRE.
- (c) uses the wrong back-references in the replacement part. The correct back-references are `\3`, `\1`, and `\2`.

---

<div style="page-break-after: always;"></div>

## Question 10 (sed) [6]

In a quoted CSV file, the fields are bound by double quotes. Given below is an example for quoted CSV file.

```
"Nasrin","Guindy, Chennai","12389"
"Ram Kumar","Daryaganj, Delhi","09890"
```

Note that `Daryaganj, Delhi` is a single field inside the quotes CSV.

Write a SED script to convert the quoted CSV to Tab Separated Value file(TSV) and remove the quotes.

Assume that the field do not contain tabs or a single comma character. The tab character can be represented by `\t`

(a)

```
s/"/\t/g
```

(b)

```
s/","/\t/g
s/"//g
```

(c)

```
s/"//g
s/","/\t/g
```

(d)

```
s/,/\t/g
s/"//g
```

### Answer

(b)

### Explanation

- (a) replaces all double quotes with a tab character. This will not convert the CSV to TSV.
- (b) replaces all `","` with a tab character and then removes all double quotes. This will convert the CSV to TSV.
- (c) If we replace `"` with nothing at first, second command will not work as there will be no `","` to replace with tab.
- (d) replaces all commas with a tab character and then removes all double quotes. This will not work if the field contains a comma.

---

<div style="page-break-after: always;"></div>

## Question 11 (awk) [7]

```bash
awk '
    NR == FNR {
        arr[$0]++
    }
    NR != FNR && !arr[$0] {
        print $0
    }
' file_1 file_2
```

What does the output from the above command represent? [MCQ]

(a) Line that present in file_1 and file_2

(b) Line that present in file_1 but not in file_2

(c) Line that present in file_2 but not in file_1

(d) Line that present in file_1 or file_2; the first occurrence will be printed

### Answer

(c)

### Explanation

- The `NR == FNR` condition is true only for the first file `file_1`. The `arr` array is populated with the lines from `file_1`.
- The `NR != FNR` condition is true only for the second file `file_2`. The lines from `file_2` are checked against the `arr` array. If the line is not present in `file_1`, it is printed.
- Note: The `NR != FNR` is redundant, as the previous block already makes sure that if `NR == FNR` then the line is added to the array. So the second block can be simplified to `!arr[$0] { print $0 }`.

---

<div style="page-break-after: always;"></div>

## Question 12 (awk) [8]

```bash
awk '
    {
        arr[$0]++
    }
    END {
        for (i in arr) {
            if (arr[i] > 2) {
                print i
            }
        }
    }
' file_1 file_2 file_3
```

The above command prints a line under which condition? [MSQ]

(a) If a line is present once in any two files

(b) If a line is present in all three files

(c) If a line is present in any two files and its total occurrence is at least 3

(d) If a line is present in only one file but its total the occurrence is at most 2

### Answer

(b), (c)

### Explanation

- If the total occurrences of a line across all three files is 3 or more, it will be printed. Both (b) and (c) satisfy this.

---

<div style="page-break-after: always;"></div>

## Question 13 (awk) [8]

The structure of AWK blocks are provided below

```bash
pattern { procedure  }
```

Which of the statement(s) are true regarding AWK. [MSQ]

(a) BEGIN block will execute the script before reading the file.

(b) The AWK script that only has a BEGIN block does not require file/stdin.

(c) END block will execute once all the lines/records from the files/stdin are read.

(d) The block without any pattern will execute for all the lines/records from files/stdin.

### Answer

(a), (b), (c), (d)

---

<div style="page-break-after: always;"></div>

## Question 14 (awk) [7]

Here are the top five lines of access log of a server.

```
103.47.219.249 - - [27/Jan/2022:00:01:11 +0530] "GET / HTTP/1.1" 301 429 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7"
54.209.123.136 - - [27/Jan/2022:00:01:18 +0530] "GET /AlloyOnto/AlloyOnto.owl HTTP/1.1" 301 494 "-" "Python-urllib/3.6"
54.209.123.136 - - [27/Jan/2022:00:01:18 +0530] "GET /AlloyOnto/AlloyOnto.owl HTTP/1.1" 301 494 "-" "Python-urllib/3.6"
54.209.123.136 - - [27/Jan/2022:00:01:19 +0530] "GET /AlloyOnto/AlloyOnto.owl HTTP/1.1" 200 1410215 "-" "Python-urllib/3.6"
54.209.123.136 - - [27/Jan/2022:00:01:19 +0530] "GET /AlloyOnto/AlloyOnto.owl HTTP/1.1" 200 1410215 "-" "Python-urllib/3.6"
```

Given the following AWK script is executed on the access log file. What is the expected output from the AWK script?

```bash
#!/usr/bin/awk -f

{
  datetime = $4":"$5
  time=substr(datetime, 14, 8)

  if ( time < "06:00:00" ) {
    if ( $1 in ip ) { ip[$1]++ }
    else { ip[$1]=1 }
  }
}

END {
  mx=0
  for (i in ip) {
    if (ip[i] > mx) {
      mx = ip[i]
      mxip = i
    }
  }
  print mxip
}

```

(a) The IP address of the client that made most requests of all time

(b) The IP address of the client that made the least requests from 6 am to midnight.

(c) The IP address of the client that made most requests from midnight to 6 am.

(d) The IP address of the client that made most requests from 6 am to midnight.

### Answer

(c)

### Explanation

- The script is checking the time of the request and if it is before 6 am, it is counting the number of requests from each IP address.
- The script then finds the IP address that made the most requests before 6 am and prints it.
- The substring takes only the `HH:MM:SS` part of the datetime.
- The comparison is true only for times before 6 am. This is because string comparison is same as time comparison if using zero-padded 24-hour time format as it stores the data in a monotonically increasing fashion and contains MSB at left and LSB at right. String comparison compares letter by letter from left to right and decides on first mismatch.
- The `if ( $1 in ip ) { ip[$1]++ } else { ip[$1]=1 }` is redundant, and can be replaced with `ip[$1]++` as the default value of an uninitialized array element is 0 in AWK.
- The `END` block finds the IP address with the maximum number of requests before 6 am and prints it, not the minimum.

---

<div style="page-break-after: always;"></div>

## Question 15 (awk) [6]

Which of the following commands will print the file while prepending the line number to the start of each line, irrespective of the data in the file? **[MSQ]**

(a)

```bash
awk 'END {print NR,$0}' employee_details.txt
```

(b)

```bash
awk 'BEGIN{FS=","}{print NR,$1}' employee_details.txt
```

(c)

```bash
awk '{print NR,$0}' employee_details.txt
```

(d)

```bash
awk '{print $1,$0}' employee_details.txt
```

### Answer

(c)

### Explanation

- (a) prints the line number at the end of the file, not in any other line.
- (b) prints the line number followed by the first field of each line, not the entire line for lines which have comma. It works for other lines correctly.
- (c) prints the line number followed by the entire line correctly.
- (d) prints the first field followed by the entire line, not the line number followed by the entire line.

---
