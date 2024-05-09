# System Commands Quiz-2 Set-2

## Question 1 [7]

```bash
$ pwd
/home/pinky
$ cd /var
$ pwd
/var
$ for i in {1..11}; do cd -; done
```

What is the output to the command `pwd` at the end of the execution of the given script? [NAT]

Hint: `cd -` will change the current working directory to the previous current working directory.

### Answer (ignore white space)

/home/pinky

### Explanation

- `cd -` changes the current working directory to the previous working directory.
- When `cd -` is run, the current working directory becomes the new previous working directory.
- If `cd -` is run twice, the current working directory remains same as initial state.
- For any even number of runs of `cd -`, the current working directory remains same as initial state.
- For any odd number of runs of `cd -`, the current working directory becomes the previous working directory.
- In the given script, `cd -` is run 11 times. So, the current working directory will be the previous working directory (`/home/pinky`)

---

**Common data for question 2 to 6**

```bash
echo 1 > file1
mkdir dir1 dir2

ln file1 file1_h1
ln -s file1 file1_s1
ln -s file1 dir1/file1_s2

cd dir1
cp ../file1 .
echo 2 > file1
ln -s ../file1 file1_s3
ln -s file1 file1_s4
cd ..

cp file1 dir2/file1
cp file1_s1 dir2/file1_s5
```

## Question 2 [3]

What will be the output of `cat ./dir1/file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

2

---

## Question 3 [3]

What will be the output of `echo 3 > file1_h1; cat ./file1` after the execution of the given script? [NAT]

### Answer

3

---

## Question 4 [3]

What will be the output of `echo 4 > ./dir1/file1_s1; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

1

---

## Question 5 [3]

What will be the output of `echo 5 > ./dir1/file1_s3; cat ./dir1/file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

2

---

## Question 6 [3]

What will be the output of `echo 6 > ./dir1/file1_s3; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

6

### Explanation

- Symbolic links depend solely on the path, and if the path is changed, the symbolic link will be broken.
- If a new file is kept in the original source file's path, that becomes the new parent file for the symbolic link.
- Relative path if stored in a symbolic link, it will be resolved based on the path of the symbolic link, and not the current working directory.
- Changing parent of a symbolic link will change the content of the symbolic link, and vice-versa.
- Hard links, once created, do not care about the path of the source file.

---

## Question 7 [6]

```bash
$ cat data
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
$ awk '
{
    arr1[NR % 2] += $1
    arr2[$1 % 2] += $1
}
END {
    for (i in arr1) {
        print i, arr1[i] - arr2[i]
    }
}
' data
```

What will be output of last command in the given console command?

(a)

```
0 1
0 0
```

(b)

```
0 1
1 0
```

(c)

```
0 0
1 1
```

(d)

```
0 1
1 1
```

(e)

```
0 0
1 0
```

### Answer (ignore white space, number)

(e)

### Explanation

- `NR` is the number of records processed by `awk`.
- `NR % 2` will be 1 for odd lines and 0 for even lines.
- `$1 % 2` will be 1 for odd numbers and 0 for even numbers.
- `arr1[NR % 2] += $1` will add the number to the array `arr1` based on the line number.
- `arr2[$1 % 2] += $1` will add the number to the array `arr2` based on the number.
- Output of `seq` has same line number as the line content.
- `arr1[i] - arr2[i]` will be 0 always.
- The keys will be 0 and 1, and the values will be 0 for both keys.

---

## Question 8 [8]

What will be the output of the given command? [NAT]

```bash
seq 100 | sed 's/\([[:digit:]]\)\1/\1/g' | sort -n | uniq | wc -l
```

Hint:

1. `seq 100` will generate 1 to 100 in each line
2. `-n` option in `sort` command sort numerically
3. `uniq` command will remove the adjacent duplicate lines

### Answer

90

### Explanation

- `seq 100` will generate numbers from 1 to 100.
- `sed 's/\([[:digit:]]\)\1/\1/g'` will find numbers that have the same digit repeated and replace it with the digit present only once. Example 11 → 1, 22 → 2, ... 100 → 10
- There are 10 such numbers (11, 22, 33, 44, 55, 66, 77, 88, 99, 100) which have the same digit repeated.
- These numbers are changed to 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, which are already present in the sequence.
- Sorting and removing duplicates will remove those numbers altogether.
- `wc -l` will count the number of lines
- 100 - 10 = 90 unique numbers

---

## Question 9 [8]

```bash
awk '
/^[^0-9].*[0-9]*$/ {
    arr[FILENAME]++
}
END {
    for (i in arr) {
        print i, arr[i]
    }
}
' *
```

What does the given AWK command print? [MSQ]
Hint: FILENAME is a default variable have the value of filename

(a) The filename and count that includes the lines in the file that starts with numbers

(b) The filename and count that includes the lines in the file that ends with numbers

(c) The filename and count that includes the lines in the file that starts and ends with numbers

(d) The filename and count that includes the lines that has a number in it but not at start

### Answer

(b), (d)

### Explanation

- `FILENAME` is a built-in variable in `awk` which contains the name of the file being processed.
- `/^/` is the start of the line.
- `[^0-9]` is a negated character class that matches any character except a digit.
- `.*` matches any character (except for line terminators) zero or more times.
- `[0-9]*` matches any digit zero or more times.
- `/$/` is the end of the line.
- `/^[^0-9].*[0-9]*$/` will match lines that are non-empty and may have numbers in it but not as the first character.

---

## Question 10 [6]

```bash
[ a = a ] && [ 1 -ne 2 ]
v1=$?
[[ a = a && 1 -ne 2 ]]
v2=$?
echo $((v1 + v2))
```

What will be the output from the given script?

(a) 0

(b) 1

(c) 2

(d) 3

### Answer

(a)

### Explanation

- `[ a = a ]` will evaluate to true and return exit code 0.
- `[ 1 -ne 2 ]` will evaluate to true and return exit code 0.
- `[[ a = a && 1 -ne 2 ]]` will evaluate to true and return exit code 0.
- `==` and `=` are equivalent in bash.
- `$?` will contain the exit code of the last command.
- `v1` will be 0 and `v2` will be 0.
- `echo $((v1 + v2))` will print 0.

---

## Question 11 [8]

Assume a large file with more than million lines of numbers having size more than 4 gigabytes is processed using AWK. But the system we have only 1 gigabyte of RAM. Here we have two AWK scripts written, choose the most appropriate statement.

**Script 1**

```awk
prev == $1 {
    count++
}
{
    prev=$1
}
END {
    print count
}
```

**Script 2**

```awk
{
    seq[NR]=$1
}
END {
    prev=""
    for (i in seq) {
        if (seq[i] == seq[i-1]) {
            count++
        }
    }
    print count
}
```

(a) The Script 1 is more optimal than Script 2 in terms of memory

(b) The Script 2 is more optimal than Script 1 in terms of memory

(c) The Script 1 and Script 2 do not have difference in terms of memory

(d) The Script 2 is more efficient than Script 1, because it has only two blocks

### Answer

(a)

### Explanation

- In Script 2, the entire file is read into an array, which will consume a lot of memory.
- In Script 1, only the previous line is stored, which will consume less memory.
- Script 2 is more optimal in terms of memory.
- Using three blocks in a script does not affect the efficiency of the script.

---

## Question 12 [9]

A MAC address is typically represented in the format "XX:XX:XX:XX:XX:XX", where X can be a hexadecimal digit (0-9, A-F, or a-f).
Identify the correct extended or basic regular expression from the following which will match a MAC address.
Note: All the regular expressions are either BRE or ERE

(a) `\([0-9A-Fa-f]\{2\}:\)\{5\}[0-9A-Fa-f]\{2\}`

(b) `\([0-9A-Fa-f]\{2\}:\)\{6\}`

(c) `..\(\:..\){5}`

(d) `([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}`

### Answer

(a), (c), (d)

### Explanation

- A hexadecimal digit can be represented by `[0-9A-Fa-f]` or `[[:xdigit:]]`. Both are equivalent.
- `{2}` will match exactly 2 occurrences of the preceding character.
- `\{2\}` is used in BRE, and `{2}` is used in ERE.
- `[0-9a-fA-F]{2}` will match exactly 2 hexadecimal digits, which is one group of the address. A MAC Address has 6 such groups separated by colons `:`.
- `\([0-9A-Fa-f]\{2\}:\)\{6\}` will not match as it also requires a colon after the last group.
- `([[::xdigit::]]{2}:){5}[[:xdigit:]]{2}` will match a MAC address in ERE. Here we match two hexadecimal digits followed by a colon, and repeat this 5 times. The last group does not have a colon.
- `.` matches any character, not just hexadecimal characters, but it will also work if the input data does not contain any malformed MAC address.

---

## Question 13 [6]

Which of the following sed commands will show only line 6th and 8th line of a index.txt file.

(a) `sed -e '6p' -e '8p' index.txt`

(b) `sed -n '8p;6p' index.txt`

(c) `sed -n -e '6p' -e '8p' index.txt`

(d) `sed -n '6,8p' index.txt`

### Answer

(b), (c)

### Explanation

- `-n` option in `sed` will suppress the default output. It is required, without it, all lines will be printed.
- `6p` will print the 6th line.
- `8p` will print the 8th line.
- `8p;6p` will print the 6th line first and then the 8th line, this is because each line is compared against the commands one by one, in order of the lines, thus first the line 6 will match and print, then line 8 will match and print.
- `-e` is used to specify multiple commands in `sed`.
- `6,8p` will print lines from 6 to 8, not just 6th and 8th line.

---

## Question 14 [7]

What will the following command do upon execution.
`find /home/users/Documents/ -name '*.doc' | grep -v '102421' | xargs -I{} mv {} /home/Documents/OfficeFiles`

(a) Move all files with doc extension from `Documents` folder whose content matches with 102421 to `OfficeFiles` folder

(b) Move all files with doc extension from `Documents` folder whose content does not match with 102421 to `OfficeFiles` folder

(c) Move all files with doc extension from `Documents` folder whose name matches with 102421 to `OfficeFiles` folder

(d) Move all files with doc extension from `Documents` folder whose name does not match with 102421 to `OfficeFiles` folder

### Answer

(d)

### Explanation

- `find /home/users/Documents/ -name '*.doc'` will find all files with `.doc` extension in the `Documents` folder.
- `grep -v '102421'` will exclude the lines that contain `102421`.
- `xargs -I{} mv {} /home/Documents/OfficeFiles` will move the files to the `OfficeFiles` folder.
- Here the grep acts on the file names, not the content of the files.

---

## Question 15 [8]

A html file index.html has following general format. Identify the correct command which will extract content from `<PRE>` tags (that is the content between `<PRE>` and `</PRE>` and **not the lines with tags**). [MCQ]

```html
<HTML>
<HEAD>
 <TITLE>Some Title</TITLE>
</HEAD>

<BODY>
<H2>Some Heading</H2>
<SMALL><STRONG>
SomeText<BR>
SomeInfo<BR>
</STRONG></SMALL>
<CENTER>
<HR>
<P>
<FONT SIZE="-1"></CENTER><PRE>
Data interested In
Can be Multiline
The context between PRE tags needs to be Extracted
</PRE></FONT>
</CENTER>
<P>
<HR>
<TABLE>
<TR>
<TD>
<SMALL>SomeCreator</A>
</SMALL>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>
```

(a) `sed -n "/<PRE>/,/<\/PRE>/p" index.html`

(b) `sed -n "/<PRE>/,/<\/PRE>/{/<PRE>/! {/<\/PRE>/! p}}" index.html`

(c) `sed -n "/<PRE>/,/<\/PRE>/{/<PRE>/!,/<\/PRE>/! p}" index.html`

(d) `awk '/<PRE>/,/<\/PRE>/' index.html`

### Answer

(b)

### Explanation

- `sed -n "/<PRE>/,/<\/PRE>/p"` will print the lines between `<PRE>` and `</PRE>`, including the lines with the tags.
- `awk '/<PRE>/,/<\/PRE>/'` will print the lines between `<PRE>` and `</PRE>`, including the lines with the tags.
- `sed -n "/<PRE>/,/<\/PRE>/{/<PRE>/! {/<\/PRE>/! p}}"` will print the lines between `<PRE>` and `</PRE>`, excluding the lines with the tags.
- `sed -n "/<PRE>/,/<\/PRE>/{/<PRE>/!,/<\/PRE>/! p}"` is not logically correct for either including, or excluding the tag.

---

## Question 16 [6]

What will be the result of the keystrokes `$jddk0dw` on vi editor or `<C-e><C-k><C-k><C-a><M-d><C-d>` on emacs editor from first line first character on the text given below. `<C-x>` and `<M-x>` refers to Control + x and Meta/Alt + x respectively. [MCQ]

```text
abcd efgh ijkl
mnop qrst uvw
xyz
```

Hint:
Emacs: - `<C-k>` delete the entire line (from the cursor to the end) - `<M-d>` delete word - `<C-d>` delete character
Vi: - `dd` delete the entire line - `dw` delete word

(a)

```text
abcd efgh
xyz
```

(b)

```text
mnop qrst uvw
xyz
```

(c)

```text
efgh ijkl
xyz
```

(d)

```text
efgh ijkl
mnop
xyz
```

### Answer

(c)

### Explanation

- `$` moves the cursor to the end of the line.
- `j` moves the cursor to the next line.
- `dd` deletes the entire line.
- `k` moves the cursor to the previous line.
- `0` moves the cursor to the start of the line.
- `dw` deletes the word.
- The second line will be totally removed, and the first word of first line is removed.

---

## Question 17 [6]

How many background processes will be running after 5 seconds after execution of the script? [NAT]

```bash
sleep 1 &
echo two &
echo three && echo four || echo five && echo six
sleep 6 &
sleep 2 &
sleep 7 &
sleep 12 &
```

### Answer

3

### Explanation

- All the sleep processes are run in background, thus they dont block each other and are all started in parallel
- After 5 seconds the only sleep commands still running in background are those that have sleep values more than 5 seconds, which are `6`, `7`, and `12`.
- Thus, 3 processes will keep running.

---
