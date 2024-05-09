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

---
<div style="page-break-after: always;"></div>

**Common data for question 4, 5 ,6 and 7**

Assume the filenames will not have a colon  (`:`) in it.

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

(a) Total number of *lines* have the string "print" in all files in the current and subdirectories
(b) Total number of *occurrences* of "print" in all files in the current and subdirectories
(c) Top 10 files that contains most number of lines have "print" among all files in the current and subdirectories
(d) Top 10 files that contains the least number of lines have "print" among all files in the current and subdirectories

### Answer
(c)

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
(a) Total number of *lines* have the string "print" in all files in the current and subdirectories
(b) Total number of *files* have the string "print" in the current and subdirectories
(c) Total number of *occurrences* of "print" in all files in the current and subdirectories
(d) Total number of *occurrences* of "print" in all files in the current directory

### Answer
(a)


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

---
<div style="page-break-after: always;"></div>

## Question 8 (sed) [6]

Choose the command to find <u>all</u> occurrences of `{{DATE}}` in the file `template` and replace with the value of shell variable `DATE` in the file. Note that there may be spaces between `{{` and `DATE` and `DATE` and `}}`. [MSQ]
Hint: The option `-i` in SED does the in-place replacement.

(a) `sed "s/{{DATE}}/$DATE/g" template`
(b) `sed -i 's/{{[ ]*DATE[ ]*}}/$DATE/g' template`
(c) `sed -i "s/{{[ ]*DATE[ ]*}}/$DATE/g" template`
(d) `sed -i "s/{{[ ]*DATE[ ]*}}/$DATE/" template`

### Answer
(c)

---
<div style="page-break-after: always;"></div>

## Question 9 (sed) [6]

The file 'dates.txt' has a list of dates in MM/DD/YYYY format. Which of the following commands can be used to convert it to YYYY-MM-DD format?
Hint: SED uses Basic Regular Expression Engine (BRE) by default.

(1) ``` sed 's/\([0-9]{2}\)\/\([0-9]{2}\)\/\([0-9]{4}\)/\3-\1-\2/' dates.txt ```

(2) ``` sed 's/([0-9]{2})/([0-9]{2})/([0-9]{4})/\3-\1-\2/' dates.txt ```

(3) ``` sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\4-\2-\2/' dates.txt ```

(4) ``` sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' dates.txt ```

### Answer

(4) ``` sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' dates.txt ```

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

---
