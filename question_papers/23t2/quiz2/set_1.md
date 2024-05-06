# System Commands Quiz-2 Set-1

## Question 1 [7]

```bash
$ pwd
/home/pinky
$ cd /var
$ pwd
/var
$ for i in {1..10}; do cd -; done
```

What is the output of the command `pwd` at the end of the execution of the given script? [NAT]

**Hint:** `cd -` will change the current working directory to the previous current working directory.

### Answer (ignore white space)

/var

---

**Common data for questions 2 to 6**

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

### Answer (ignore space, number)

2

---

## Question 3 [3]

What will be the output of `echo 3 > file1_h1; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore space, number)

3

---

## Question 4 [3]

What will be the output of `echo 4 > ./dir1/file1_s1; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore space, number)

1

---

## Question 5 [3]

What will be the output of `echo 5 > ./dir1/file1_s3; cat ./dir1/file1` after the execution of the given script? [NAT]

### Answer (ignore space, number)

2

---

## Question 6 [3]

What will be the output of `echo 6 > ./dir1/file1_s3; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore space, number)

6

---

## Question 7 [6]

Which of the following commands will print the environmental variable `HOME`.

(a) `awk 'BEGIN{print $HOME}'`
(b) `awk 'BEGIN{print ENVIRON['HOME']}'`
(c) `awk 'BEGIN{print ENVIRON["HOME"]}'`
(d) `awk 'BEGIN{print ENVIRON[${HOME}]}'`

### Answer

(c)

---

## Question 8 [8]

What will be the output of the given command? [NAT]

```bash
seq 50 | sed 's/\([[:digit:]]\)\1/\1/g' | sort -n | uniq | wc -l
```

Hint:

1. `seq 100` will generate 1 to 100 in each line
2. `-n` option in `sort` command sorts numerically
3. `uniq` command will remove the adjacent duplicate lines

### Answer (ignore space, number)

46

---

## Question 9 [8]

```bash
awk '
/^[0-9].*[0-9]*$/ {
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
Hint: FILENAME is a default variable that has the value of filename

(a) The filename and count that includes the lines in the file that starts with numbers
(b) The filename and count that includes the lines in the file that ends with numbers
(c) The filename and count that includes the lines in the file that starts and ends with numbers
(d) The filename and count that includes the lines that have a number in it

### Answer

(a), (c)

---

## Question 10 [6]

```bash
[ a = a ] && [ 1 -ne 2 ]
v1=$?
[[ a = a && 2 -ne 2 ]]
v2=$?
echo $((v2 - v1))
```

What will be the output from the given script?

(a) 0
(b) 1
(c) 2
(d) 3

### Answer

(b)

---

## Question 11 [8]

Assume a large file with more than a million lines of numbers having a size of more than 4 gigabytes is processed using AWK. But the system we have only 1 gigabyte of RAM. Here we have two AWK scripts written; choose the most appropriate statement.

**Script 1**

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

**Script 2**

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

(a) Script 1 is more optimal than Script 2 in terms of memory
(b) Script 2 is more optimal than Script 1 in terms of memory
(c) Script 1 and Script 2 do not have differences in terms of memory
(d) Script 2 is less efficient than Script 1 because it has three blocks

### Answer

(b)

---

## Question 12 [9]

A MAC address is typically represented in the format "XX:XX:XX:XX:XX:XX", where X can be a hexadecimal digit (0-9, A-F, or a-f).
Identify the correct extended or basic regular expression from the following, which will match a MAC address.
Note: All the regular expressions are either BRE or ERE

(a) `\([0-9A-Fa-f]\{2\}:\)\{5\}[0-9A-Fa-f]\{2\}`
(b) `[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}`
(c) `..\(\:..\){5}`
(d) `([[:digit:]]{2}:){5}[[:digit:]]{2}`

### Answer

(a), (b), (c)

---

## Question 13 [6]

Which of the following sed commands will remove lines starting with # and empty lines from the index.txt file?

(a) `sed '/^#|^$/d' index.txt`
(b) `sed '/^#\|^$/d' index.txt`
(c) `sed '/^#/ d;/^$/d' index.txt`
(d) None of the above

### Answer

(b), (c)

---

## Question 14 [7]

Which of the following commands can delete leading and trailing white spaces from each line of file sample.txt?

(a) `sed -e 's/^[ \t]*//' -e 's/ *$//' sample.txt`
(b) `sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'' sample.txt`
(c) `awk '{gsub(/^ +| +$/,"")} {print $0}' sample.txt`
(d) `cat sample.txt|xargs`

### Answer

(a),(b),(c)

---

## Question 15 [8]

A html file index.html has the following general format. Identify the correct command which will extract content from `<PRE>` tags (that is, the content between `<PRE>` and `</PRE>`) which **includes lines with tags**. [MSQ]

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

(a), (d)

---

## Question 16 [6]

What will be the result of the keystrokes `$jddk0dw` on vi editor or `<C-e><C-k><C-k><C-a><M-d><C-d>` on emacs editor from first line first character on the text given below? `<C-x>` and `<M-x>` refers to Control + x and Meta/Alt + x respectively. [MCQ]

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

How many background processes will still be running after 5 seconds of the execution of the script? [NAT]

```bash
sleep 1 &
echo two &
echo three && echo four || echo five
sleep 6 &
sleep 2 &
sleep 12 &
```

### Answer

2
