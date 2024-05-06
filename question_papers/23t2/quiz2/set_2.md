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
(d) The filename and count that includes the lines that has a number in it

### Answer

(b), (d)

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

---

## Question 13 [6]

Which of the following sed commands will show only line 6th and 8th line of a index.txt file.

(a) `sed -e '6p' -e '8p' index.txt`
(b) `sed -n '8p;6p' index.txt`
(c) `sed -n -e '6p' -e '8p' index.txt`
(d) `sed -n '6,8p' index.txt`

### Answer

(b), (c)

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

---
