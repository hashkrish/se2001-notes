# System Commands May-2024 End Term Set 1

## Question 1 (bash) [MCQ] [8]

A function called `file_check` which takes a file name as an argument and tests if the file has two fields separated by a colon (`:`). The first column should have alphabets while the second column should have a hexadecimal code. If the file is correctly formatted, print the file name followed by `PASSED`; otherwise print the file name followed by `FAILED`. From the following options choose the one which will achieve that.

Note: The passed file path is valid and the minimum hexadecimal characters on second field is 8.

(a)

```bash
#!/bin/bash

file_check() {
    filename="$1"
    var=True
    while IFS=: read -r field1 field2; do
        if [[ $field1 =~ [a-zA-Z]+ ]] && [[ $field2 =~ [0-9a-fA-F]{8} ]]; then
            continue
        else
            var=False
            break
        fi
    done < "$filename"

    if [[ $var == "True" ]]; then
        echo "$filename PASSED"
    else
        echo "$filename FAILED"
    fi
}
```

(b)

```bash
#!/bin/bash

file_check() {
    filename="$1"
    var=True
    while IFS=: read -r field1 field2; do
        if [[ $field1 =~ [a-zA-Z]+ ]] && [[ $field2 =~ [0-9a-fA-F]{8} ]]; then
            break
        else
            var=False
            continue
        fi
    done < "$filename"

    if [[ $var == "True" ]]; then
        echo "$filename PASSED"
    else
        echo "$filename FAILED"
    fi
}
```

(c)

```bash
#!/bin/bash

file_check() {
    filename="$1"
    var=False
    while IFS=: read -r field1 field2; do
        if ! [[ $field1 =~ [a-zA-Z]+ ]] && [[ $field2 =~ [0-9a-fA-F]{8} ]]; then
            var=True
            break
        fi
    done < "$filename"

    if [[ $var == "True" ]]; then
        echo "$filename FAILED"
    else
        echo "$filename PASSED"
    fi
}
```

(d)

```bash
#!/bin/bash

file_check() {
    filename="$1"
    var=False
    while IFS=: read -r field1 field2; do
        if ! [[ $field1 =~ [a-zA-Z]+ ]] && [[ $field2 =~ [0-9a-fA-F]{8} ]]; then
            var=True
            continue
        fi
    done < "$filename"

    if [[ $var == "True" ]]; then
        echo "$filename FAILED"
    else
        echo "$filename PASSED"
    fi
}
```

### Answer

(a)

### Explanation

- (a) - The function reads the input file line-by-line, splitting it using `:` as a delimiter and checks -
  - The first field has only alphabetic characters using `+` with the regex `[a-zA-Z]+`
  - The second field has exactly 8 hexadecimal characters using `[0-9a-fA-F]{8}`
  - If a line fails these checks, the for loop breaks and the status flag `var` is set to `False`. After the loop, the script checks the value of `var` to check if the file `PASSED` or `FAILED`.
- (b) - It breaks after checking the first line and doesn't check all the lines of the file
- (c) - It breaks and sets var=True if the first field is not an alphabet, even though the second field is correctly checked as hexadecimal. So errors in the second field go undetected
- (d) - Same issue as option (c)

---

## Question 2 (awk) [MCQ] [8]

Which of the following `awk` commands will display the contents of `data.txt` with each line's length prepended at the start of the line?

**Hint:**

```text
length([s])
    Return the length of the string s, or the length of $0 if s is not supplied. As a non-standard extension, with an array argument, length() returns the number of elements in the array.
```

(a)

```bash
awk '{print $0, length}' data.txt
```

(b)

```bash
awk '{print $1, length($0)}' data.txt
```

(c)

```bash
awk '{print length($0), $0}' data.txt
```

(d)

```bash
awk '{print $0, length($0)}' data.txt
```
<!-- markdownlint-disable MD024 -->
### Answer

(c)

### Explanation

- Option (a) prints the line and there is no parameter given for length
- Option (b) prints the first word ($1) followed by the line length (length($0)), not the full line
- Option (c) awk `{print length($0), $0}' data.txt` prints the length of the line using `length()` command followed by the full line. So, this is the correct option
- Option (d) prints line then length, not what was asked

## Question 3 (bash) [MCQ] [8]

Consider the following script:

```bash
#!/bin/bash
numbers=(2 4 6 8 10)
numbers+=("12")
unset 'numbers[1]'
echo "${numbers[@]}"
```

What will be the output of the script?

(a)

```text
2 4 6 8 10 12
```

(b)

```text
2 6 8 10 12
```

(c)

```text
2 4 6 8 12
```

(d)

```text
2 6 8 10 
```

### Answer

(b)

### Explanation

The array `numbers` is initialized with `2 4 6 8 10` with `2` positioned at 0th index, `4` positioned 1st index and so on. 12 is appended to the array at the last position. Using `unset` we remove the number at indexed 1 which is `4`. Finally we print the elements of the array using `${numbers[@]}`.

---

## Question 4 (redirection) [MCQ] [8]

Consider the following commands executed sequentially in bash terminal:

```bash
$ ls -l
total 0
-rw-r -- r -- 1 user1 user1 0 Aug 13 05:51 itemA
-rw-r -- r -- 1 user1 user1 0 Aug 13 05:51 itemB
$ echo "Start of the script" > output. log
$ cat itemC >> output. log
cat: itemC: No such file or directory
$ echo "End of the script" >> output.log
```

What will be the contents of the output.log file at the end of execution?

Options:

(a)

```text
Start of the script
End of the script
```

(b)

```text
Start of the script
cat: itemC: No such file or directory
End of the script
```

(c)

```text
Start of the script
```

(d)

```text
The output.log will be empty
```

### Answer

(a)

### Explanation

Using `>` the output of echo `Start of the script` the line is redirected to the file named output.log. The double redirection `>>` appends the output to the file if there is no error, in case of error output is printed on the terminal. As `ls -l` shows no file named itemC, therefore the error appears on the terminal. Finally, the last echo command, appends `End of the script` to output.log.

---

## Question 5 (bash) [MCQ] [8]

Select the command that kills the process not owned by the user root and consumes the maximum CPU time. Assume you have the permission to kill any process.

**Hint:**

- The 10th column of the output of ps aux command (TIME) contains the total CPU time used by the process.
- The ps aux command can list all the processes owned by all the users.

**Sample Output:**

```bash
$ ps aux | head -5   # get the first 5 lines
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1  21416 13004 ?        Ss   11:26   0:00 /sbin/init
root         2  0.0  0.0      0     0 ?        S    11:26   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    11:26   0:00 [pool_workqueue_release]
priya     2336  0.0  0.0  11396  2744 tty1     S+   11:29   0:00 cat


$ ps aux | head -5 | sort -k2,2 -rn   # sorted by second column in reverse order
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
priya     2336  0.0  0.0  11396  2744 tty1     S+   11:29   0:00 cat
root         3  0.0  0.0      0     0 ?        S    11:26   0:00 [pool_workqueue_release]
root         2  0.0  0.0      0     0 ?        S    11:26   0:00 [kthreadd]
root         1  0.0  0.1  21416 13004 ?        Ss   11:26   0:00 /sbin/init
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

(c)

### Explanation

- (a) - head -1 takes only the header line, so the actual process list is lost
- (b) - Same as option (c) but uses `-n` option. With `-n`, sort treats TIME as numeric but TIME contains `:` so using numeric sort will fail and processes will not be sorted correctly by TIME
- (c) - This option is correct because -
  - `sed 1d` deletes the header
  - sorted by TIME (-k10,10 -r, reverse) -k10,10 indicates sort by 10th column
  - `grep -v '^root\b'` removes root-owned processes
  - `head -1` picks the top one
  - `awk '{print $2}'` extracts PID
- (d) - Header line is not removed before sorting, so header also gets sorted into the list. Then sed 1d deletes the first row after sorting, which may accidentally delete a valid process instead of the header

---

## Question 6 (sed) [MCQ] [8]

Which of the following commands will change the word Alice with Rabbit for the range of lines starting from 5 to 25.
Options:

(a)

```bash
sed '5~25 s/Alice/Rabbit/' file.txt

```

(b)

```bash
sed '5-25 s/Alice/Rabbit/' file.txt

```

(c)

```bash
sed '5,25 s/Alice/Rabbit/' file.txt

```

(d)

```bash
sed '5 s/Alice/Rabbit/; 25 s/Alice/Rabbit/' file.txt
```

### Answer

(c)

### Explanation

- Option (a) will change every 25th line starting from 5th line `5~25` ~ indicates jump by 25 lines
- Option (b) is invalid as `5-25` is not a valid address or range.
- Option (c) will change the word from `Alice` to `Rabbit` using `s` flag which means to substitute (change) the preceding word with the next word. 5,25 implies starting from the 5th line change all lines till the 25th line. So, it is the correct option.
- Option (d) will change only the 5th and the 25th line individually

---

## Question 7 (bash) [MSQ] [8]

```bash
The contents of the current working directory are as follows:

$ ls -R
.:

folder1 folder2

. /folder1:
itemA itemB itemC itemD

./folder2:
itemC itemD itemE itemF
```

After running the following script, which files will be moved from folder1 to folder2?

```bash
cd folder1
for item in *; do
if ls ../folder2 | grep -q $item; then
    mv $item ../folder2
fi
done
```

Options:

(a)

```text
itemA
```

(b)

```text
itemB
```

(c)

```text
itemC
```

(d)

```text
itemD
```

(e)

```text
itemE
```

(f)

```text
itemF
```

### Answer

(c), (d)

### Explanation

The script checks each file in folder1 and moves it to folder2 only if a file with the same name already exists in folder2. Since itemC and itemD are common to both folders, they will be moved.

- `for item in *` - Iterates over all files in folder1: itemA, itemB, itemC, itemD.
- `ls ../folder2 | grep -q $item` - Checks if the current file ($item) exists in folder2 using `ls` and piping output to grep -q. The flag q makes grep quiet (no output), just returns success/failure (exit code 0 - success, 1 - failure).
- `mv $item ../folder2` moves it from folder1 to folder2

---

## Question 8 (bash, sed, awk) [MSQ] [8]

You have the following text in a file named input.txt:

**Input.txt:**

```text
apple pie
banana bread
cherry tart
apple turnover
banana muffin
cherry pie
```

Which of the following commands will print only the lines containing the word "apple" from the file input.txt ? (Select all that apply):

(a)

```bash
grep 'apple' input.txt
```

(b)

```bash
sed -n '/apple/p' input.txt
```

(c)

```bash
awk '/apple/ {print $0}' input.txt
```

(d)

```bash
awk '{if ($0 ~ /apple/) print $1}' input.txt
```

(e)

```bash
sed 's/apple/fruit/' input.txt
```

### Answer

(a), (b), (c)

### Explanation

- Option a - Prints only lines containing "apple"
- Option b – Prints only lines containing "apple" by suppressing default output using `-n` and explicitly printing matched lines using sed.
- Option c – Prints full lines that contain "apple" using pattern matching in awk.
- Option d – Prints only the first word of lines that contain "apple", not the entire line.
- Option e – Replaces "apple" with "fruit" in all lines

---

## Question 9 (grep) [MSQ] [8]

Anish wanted to extract phone numbers from the following data. He knows that grep -oE can print
the pattern selectively using Extended regular expression. Please help him choose the correct
regular expression to achieve that.

**Sample Input**

```text
name, phone, email, region
Madan,1-158-662-4996,madan-raja@outlook.ca,GA
Persaud, 1-877-704-5869,persaud@google.edu,Meghalaya
Srivas, 1-516-922-8416,k-srivas@icloud.com,HR
Swami, 761-1395,swami@google.couk,Haryana
Subram, 981-5610,subram3142@yahoo.org,Karnataka
Nirmal, 474-7526,nirmal@icloud.org,Madhya Pradesh
Sahni, 151-8534, sahni@hotmail.ca,KA
Mahajan,1-548-689-8736,mahajan@icloud.couk,Bihar
Rana,1-528-385-7783,rana4716@yahoo.org,AN
```

**Sample Output**

```text
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

Options:

(a)

```bash
[0-9]{1}\-[0-9]{3}\-[0-9]{3}\-[0-9]{4}|[0-9]{3}\-[0-9]{4}
```

(b)

```bash
[0-9]{1}-[0-9]{3}-[0-9]{3}-[0-9]{4}|[0-9]{3}-[0-9]{4}
```

(c)

```bash
\b[0-9]-[0-9]{3}-[0-9]{3}-[0-9]{4}\b
```

(d)

```bash
\b[0-9].*[0-9]{3}-[0-9]{4}\b|[0-9]{3}-[0-9]{4}\b
```

(e)

```text
None of these
```

### Answer

(a), (b), (d)

### Explanation

- Option (a) – Matches both formats using alternation/or `|` between X-XXX-XXX-XXXX and XXX-XXXX patterns.
- Option (b) – Uses [0-9]{1}-[0-9]{3}-[0-9]{3}-[0-9]{4} or [0-9]{3}-[0-9]{4} to match full and short phone numbers.
- Option (c) – Uses \b word boundaries and matches only 1-XXX-XXX-XXXX, so it misses short number pattern XXX-XXXX.
- Option (d) – Uses `.*` to match anything after first number and hyphen and before XXX-XXXX thereby capturing the 10 digit pattern and or part captures 7 digit number. It works for these inputs, but `.*` is greedy and could overmatch in other cases.

---

## Question 10 (find) [MSQ] [8]

You need to replicate the following `find` command using a bash script without using the find command:

```bash
find /opt/se2001/ -type f -name "*.md" -mindepth 1 -maxdepth 1
```

Which of the following bash scripts correctly replicates the functionality of the find command? (Select all that apply):

***Note:***

- -f unary operator tests for file
- -x unary operator checks for executable
- -d unary operator checks for directory

(a)

```bash
#!/bin/bash

for file in /opt/se2001/*.md; do
    if [[ -f "$file" ]]; then
        echo "$file"
    fi
done

```

(b)

```bash
#!/bin/bash

for file in $(ls /opt/se2001/*.md); do
    if [[ -f "$file" ]]; then
        echo "$file"
    fi
done

```

(c)

```bash

#!/bin/bash

for dir in /opt/se2001/*; do
    if [[ -d "$dir" && "$dir" == *.md ]]; then
        echo "$dir"
    fi
done
```

(d)

```bash
#!/bin/bash

for file in /opt/se2001/*; do
    if [[ "$file" == *.md ]]; then
        echo "$file"
    fi
done
```

### Answer

(a), (b), (d)

### Explanation

`find` command is searching for a files with extension .md in the /opt/se2001 directory.

mindepth & maxdepth 1 indicates the files should be located in /opt/se2001 directory only and not recursively any sub directories below it.  

- (a) & (b) are correct as they both try to find the files which has an extension .md
- (c) tries to find a directory named *.md but the `find` command is searching for files with an extension of .md
- (d) `[[ "$file" == *.md ]]` is pattern matching `*.md` matches any string ending with `.md` so, it is correct

***Note:***
While option (b) works in this context, using ls in scripts is discouraged because it breaks on filenames with spaces.

---

## Question 11 (sed, awk) [MSQ] [8]

From the following option select the correct command which will remove all the html tags. A
sample html file is provided for your reference.

**Sample Input**
`
A <b>table</b> is an arrangement of
<a href="/wiki/Information" title="Information">information</a> or
<a href="/wiki/Data" title="Data">data</a>,
`

**Sample Output**
`A table is an arrangement of information or data,`

(a)

```bash
sed 's/<[^>]*>//g' file.html

```

(b)

```bash
sed 's/<[^>].*//g' file.html

```

(c)

```bash
awk '{gsub(/<[^>]*>/, ""); print}' file.html
```

(d)

```bash
awk '{gsub(/<[^>].*>/, ""); print}' file.html

```

### Answer

(a), (c)

### Explanation

gsub stands for global substitution - It searches the target string and  for all matches of regex and replaces them with replacement.

- (a) - The regex `<[^>]*>` correctly matches any substring starting with `<`, then any number of non-`>` characters, and ending with `>`. So, it is the correct option.
- (b) - Wrong because `<[^>].*>` greedily removes from the first `<` to the last `>`, wiping out text between tags.
- (c) - Same logic as (a), but implemented in awk. It finds and removes all HTML tags with gsub. So, it is the correct option.
- (d) - Wrong for the same reason — the regex over-matches entire chunks instead of individual HTML tags.

---

## Question 12 (awk) [MSQ] [8]

In a school, two different tests were conducted on two separate days. The files day1.csv and day2.csv contain the data of student IDs and their scores for each day. Select the AWK script that will identify and print the student IDs of those who appeared for the test on both days. The files day1.csv and day2.csv will be passed as arguments respectively. Refer to the provided sample below.

**Input:**

day1.csv:

```text
student_id,score
101,85
102,78
103,92
104,88
105,76
106,90
```

day2.csv:

```text
student_id, score
101,80
103,89
105,91
107,83
108,75
```

**Expected Output**

```text
student_id
101
103
105
```

Which of the following AWK scripts will correctly produce the expected output? (Select all that apply):

(a)

```bash
BEGIN {FS=","}
FNR == NR { students[$1]=$1; next }
students[$1] {print students[$1]}

```

(b)

```bash
BEGIN {FS=","}
FNR != NR { students[$1]=$1; next }
students[$1] {print students[$1]}
```

(c)

```bash
BEGIN {FS=","}
FNR == NR { students[$1]=$1; next }
students[$1] {print}
```

(d)

```bash
BEGIN {FS=","}
FNR == NR { students[$1]++; next }
students[$1] {print $1}

```

### Answer

(a), (d)

### Explanation

- (a) – Stores student IDs from the first file into an array. While reading the second file, it checks if the ID exists in the array and prints it. So, it is the correct option.
- (b) – Stores IDs from the second file instead of the first (because of the condition used), so the intersection logic fails.
- (c) – Correctly identifies common IDs, but prints the entire line from the second file (ID + score) rather than just the student ID, so it doesn’t match the required output.
- (d) – Counts each ID from the first file and then, while reading the second file, prints only the ID if it was already seen. This matches the expected output.

---

## Question 13 (grep) [MSQ] [8]

Which of the following commands can be used to extract only the package name and its architecture from the log file, as shown in the desired output? (Select all that apply)

**Sample Log file:**

```text
2023-12-09 status installed nginx-core:amd64 1.18.0-6ubuntu14.4
2023-12-09 configure libnginx-mod-http-lua: amd64 1.18.0-6ubuntu14.4

2023-12-09 status unpacked libnginx-mod-http-lua:amd64 1.18.0-6ubuntu14.4
2023-12-09 status half-configured libnginx-mod-http-lua:amd64 1.18.0-6ubuntu14.4
```

**Desired Output**

```text
nginx-core:amd64
libnginx-mod-http-lua:amd64
libnginx-mod-http-lua:amd64
libnginx-mod-http-lua:amd64
```

(a)

```bash
grep -oE '[[:alnum:]-]+:[[:alnum:]]+' log.txt
```

(b)

```bash
grep -oE '[[:alnum:]]+:[[:alnum:]]+' log.txt
```

(c)

```bash
grep -o '[a-zA-Z0-9]*:[a-zA-Z0-9]*' log.txt
```

(d)

```bash
grep -o '[a-zA-Z0-9-]*:[a-zA-Z0-9]*' log.txt
```

### Answer

(a), (d)

### Explanation

- (a) - `[[:alnum:]-]+` matches alphabets, numbers and hyphen and `:[[:alnum:]]+` correctly matches architecture (like amd64)
- (b) - does not allow hyphen in package names, so it fails for names like libnginx-mod-http-lua
- (c) - flag o prints only the matched part, only matches continuous letters/numbers, but missing hyphen
- (d) - Allows hyphen in the package name, and matches architecture with alphanumeric. So, it is the correct option.

---

## Question 14 (bash) [NAT] [8]

Consider the following bash script:

```bash
#!/usr/bin/bash

(sleep 5; echo "Task 1 done") &
(sleep 10; echo "Task 2 done") &
(sleep 3; echo "Task 3 done") &
wait #the commands waits till all the background process are complete
echo "All tasks completed"
```

How many seconds will it take before the string "All tasks completed" is printed?

### Answer

10

### Explanation

All three tasks will run in parallel (&). The wait command pauses the script until all background jobs finish. So, the task with the maximum time taken decides when wait will finish.

---

## Question 15 (bash) [NAT] [8]

Consider the following command:

```bash
find /home/user/docs -type f -name "*.txt" -mtime -5 | wc -l
```

Given the following output from `ls -l` in the /home/user/docs directory:

```bash
$ date
Fri Aug 16 10:00:00 IST 2024
$ ls -l
-rw-r -- r -- 1 user group 512 Aug 11 08:30 report.txt
-rw-r -- r -- 1 user group 1024 Aug 12 10:00 summary.txt
-rw-r -- r -- 1 user group 2048 Aug 13 11:15 notes.txt
-rw-r -- r -- 1 user group 4096 Aug 14 14:45 plan.txt
-rw-r -- r -- 1 user group 2048 Aug 10 09:50 outline.txt
-rw-r -- r -- 1 user group 1024 Aug 15 12:20 draft.txt
-rw-r -- r -- 1 user group 4096 Aug 16 09:00 final.txt
```

How many `.txt` files will the find command count?

**Hint:**

```bash
-type c
File is of type c

    b block (buffered) special

    c character (unbuffered) special

    d directory

    p named pipe (FIFO)

    f regular file

. -mtime n
    File's data was last modified n*24 hours ago. See the comments for -atime to understand how rounding affects the interpretation of file modification times.
```

### Answer

5

### Explanation

The command searches for regular .txt files in /home/user/docs modified within the last 5 days. From `ls -l` output (current date Aug 16), the files from Aug 12–16 (summary.txt, notes.txt, plan.txt, draft.txt, final.txt) qualify, so the count is 5.
