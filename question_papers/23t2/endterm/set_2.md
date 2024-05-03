# System Commands End Term Set-2

## Question 1 [MSQ] [6]

A command `myproject-auth` takes the password as an argument. Select the most appropriate way(s) which will ensure its secrecy while entering it into the Linux command line. [MSQ]

Note: The command line usage is `myproject-auth -u <username> -p <password>`

(a)

```bash
$ myproject-auth -u pankaj -p mysecretpassword
```

(b)

```bash
$ PASSWORD=mysecretpassword
$ myproject-auth -u pankaj -p $PASSWORD
```

(c)

```bash
$ read -r PASSWORD
$ myproject-auth -u pankaj -p $PASSWORD
```

(d)

```bash
$ myproject-auth -u pankaj -p $(cat)
```

### Answer

(c), (d)

<div style="page-break-after: always;"></div>

## Question 2 [MCQ] [6]

From `man bash`,

```
Process Substitution
    Process  substitution allows a process's input or output to be
    referred to using a filename.  It takes the form of <(list) or
    >(list).   The process list is run asynchronously, and its in‐
    put or output appears as a filename.  This filename is  passed
    as an argument to the current command as the result of the ex‐
    pansion.  If the >(list) form is used,  writing  to  the  file
    will provide input for list.  If the <(list) form is used, the
    file passed as an argument should be read to obtain the output
    of  list.   Process  substitution is supported on systems that
    support named pipes (FIFOs) or the /dev/fd  method  of  naming
    open files.

    When  available,  process substitution is performed simultane‐
    ously with parameter and variable expansion, command substitu‐
    tion, and arithmetic expansion.
```

Example:

```bash
$ seq 2 5
2
3
4
5
$ diff <(seq 1 3) <(seq 2 5)
1d0
< 1
3a3,4
> 4
> 5
```

What does the command `echo <(seq 10)` output represent? [MCQ]

(a) The standard output from the command `seq 10`
(b) A file
(c) A directory
(d) Nothing will be printed

### Answer

(b)

<div style="page-break-after: always;"></div>

## Question 3 [NAT] [7]

```bash
#!/bin/bash

directory="$1"
tarball_name="$2"
tar -cvf "$tarball_name.tar" "$directory"
```

```
$ tar --help
Usage: tar [OPTION...] [FILE]...
GNU 'tar' saves many files together into a single tape or disk archive, and can
restore individual files from the archive.

Examples:
  tar -cf archive.tar foo bar  # Create archive.tar from files foo and bar.
  tar -tvf archive.tar         # List all files in archive.tar verbosely.
  tar -xf archive.tar          # Extract all files from archive.tar.

 Main operation mode:
  -A, --catenate, --concatenate   append tar files to an archive
  -c, --create               create a new archive
...
  -x, --extract, --get       extract files from an archive

...
 Device selection and switching:

      --force-local          archive file is local even if it has a colon
  -f, --file=ARCHIVE         use archive file or device ARCHIVE
...
 Informative output:
...
  -v, --verbose              verbosely list files processed
...
```

How many new files will be created from the above command for the valid directory and tarball_name?

### Answer

1

<div style="page-break-after: always;"></div>

## Question 4 [MCQ] [8]

A file contains data collected starting from 4th April 2004. The data is collected on the 4th, 14th and 24th of April, May and June since then. The text file, however, does not contain the date information. Now it is necessary to add a column to this text file with the date format 4 April 2004. Identify which of the following command (using brace expansion) will create a column to an empty file with the desired format from 4 April, 2004 to 24 December, 2010 in sorted as per the years. [MCQ]

Hint:
Use the following information.

```bash
$ echo {1..4}{b..d}
1b 1c 1d 2b 2c 2d 3b 3c 3d 4b 4c 4d
$ echo {1..4}";"{b..d}
1;b 1;c 1;d 2;b 2;c 2;d 3;b 3;c 3;d 4;b 4;c 4;d
$ echo 10 20
10 20
$ echo 10 20| tr ' ' '\n'
10
20
```

(a)

```
echo {April,May,June}";"{4..30..10}","{2004..2010}|
		tr ' ' '\n'|
		tr ',' ' '|
		sort -s -k2|
		tr ' ' ','|
		tr ';' ' ' >date.txt
```

(b)

```
echo {April,May,June}","{4..30..10}","{2004..2010}|
		tr ' ' '\n'|
		tr ',' ' '|
		sort -s -k3|
		tr ' ' ',' >date.txt
```

(c)

```
echo {April,May,June}" "{4..30..10}","{2004..2010}|
		tr ' ' '\n'|
		tr ',' ' '|
		sort -s -k2|
		tr ' ' ',' >date.txt
```

(d)

```
echo {April,May,June}{4..30..10}","{2004..2010}|
		tr ' ' '\n'|
		tr ',' ' '|
		sort -s -k2|
		tr ' ' ','|
		tr ';' ' ' >date.txt
```

### Answer

(a)

<div style="page-break-after: always;"></div>

## Question 5 [MCQ] [6]

Which one of the following commands replaces only the second occurrence of pattern "Alice" with "Rabbit" in each line of the entire file? [MCQ]

(a) `sed 's/Alice/Rabbit/2' wonderland.txt`
(b) `sed 's/Alice/Rabbit/2g' wonderland.txt`
(c) `sed '2 s/Alice/Rabbit/' wonderland.txt`
(d) `sed '1,2 s/Alice/Rabbit' wonderland.txt`

### Answer

(a)

<div style="page-break-after: always;"></div>

## Question 6 [MSQ] [6]

Which of the following command(s) from the options will produce the output as shown below? [MSQ]

```bash
line1
     line2
line3
     line4
```

Hint:

```bash
echo: echo [-neE] [arg ...]
    Write arguments to the standard output.

    Display the ARGs, separated by a single space character and followed by a
    newline, on the standard output.

    Options:
      -n        do not append a newline
      -e        enable interpretation of the following backslash escapes
      -E        explicitly suppress interpretation of backslash escapes

    `echo' interprets the following backslash-escaped characters:
      \a        alert (bell)
      \b        backspace
      \c        suppress further output
      \e        escape character
      \E        escape character
      \f        form feed
      \n        new line
      \r        carriage return
      \t        horizontal tab
      \v        vertical tab
      \\        backslash
      \0nnn     the character whose ASCII code is NNN (octal).  NNN can be
                0 to 3 octal digits
      \xHH      the eight-bit character whose value is HH (hexadecimal).  HH
                can be one or two hex digits

    Exit Status:
    Returns success unless a write error occurs.
```

Echo examples:

```
$echo "a\tb" #tab is eight character long
a       b
$echo -e "ii\bjj"
ijj
$echo "a\vb"
a
 b
$echo "a\nb"
a
b
```

(a) `echo -e -n "line1\n\t\b\bline2\nline3\n\t\bline4\n"`
(b) `echo -e -n "line1\n\t\b\bline2\nline3\n\t\b\bline4\n"`
(c) `echo -e line1\vline2\nline3\vline4`
(d) `echo -e -n "line1\vline2\nline3\vline4\n"`

### Answer

(b), (c), (d)

<div style="page-break-after: always;"></div>

## Question 7 [MSQ] [6]

Which of the following regular expressions are the **most appropriate** to capture the GSTIN numbers from a file? [MSQ]

Note:

- A GSTIN (Goods and Services Tax Identification Number) is structured with a consistent pattern (12ABCTY1234D1Z1) comprising 15 characters, encompassing a combination of alphabetic letters (all capital) and numerical digits.

- The first two characters (12) represent the state code of the business entity's registration.

- The following ten characters are typically derived from the taxpayer's PAN (Permanent Account Number)(ABCTY1234).

- The next character is the entity number which is followed by the default character (Z).

- Lastly, the 15th character is a checksum digit.

- A PAN (Permanent Account Number) typically follows the format of ABCTY1234D.

- The first three characters, "ABC", in this case, form an alphabetical series ranging from AAA to ZZZ.

- The fourth character, like 'T', indicates the status of the PAN holder, where 'T' stands for Trust, 'F' for Firm, 'H' for HUF, 'P' for Individual, and 'C' for Company.

- The fifth character, for instance, 'Y', represents the first letter of the PAN holder's last name.

- The subsequent four characters are sequential digits from 0001 to 9999.

- The tenth character, 'D', functions as an alphabetic check digit, ranging from A to Z.

Assume a Basic Regular Expression Engine (BRE)

(a) `[0-9]\{2\}[A-Za-z]\{3\}[TFHPIC][A-Za-z][0-9]\{4\}[A-Za-z][0-9][A-Za-Z][0-9]`
(b) `[0-9]\{2\}[A-Z]\{3\}[TFHPIC][A-Z][0-9]\{4\}[A-Z][0-9][A-Z][0-9]`
(c) `[[:digit:]]\{2\}[[:alpha:]]\{3\}[TFHPIC][[:alpha:]][[:digit:]]\{4\}[[:alpha:]][[:digit:]][[:alpha:]][[:digit:]]`
(d) `[[:digit:]]\{2\}[[:upper:]]\{3\}[TFHPIC][[:upper:]][[:digit:]]\{4\}[[:upper:]][[:digit:]][[:upper:]][[:digit:]]`

### Answer

(a),(d)

<div style="page-break-after: always;"></div>

## Question 8 [MSQ] [7]

Which of the following commands from the options will count the number of words starting with the letter 'c' from the following text? [MSQ]

Hint:
**Relevent `grep` help text**

Usage: grep [OPTION]... PATTERN [FILE]...
Search for PATTERN in each FILE.
Example: grep -i 'hello world' menu.h main.c

```
...
    -w, --word-regexp force PATTERN to match only whole words
...
    -o, --only-matching show only the part of a line matching PATTERN
...
    -c, --count print only a count of selected lines per FILE
```

```bash
$ cat tongue_twisters.txt
If you must cross a coarse, cross cow across a crowded cow crossing, cross the cross, coarse cow across the crowded cow crossing carefully.
$ wc -l tongue_twisters.txt
1
```

(a) `grep -owc '\bc[a-zA-Z]*\b' tongue_twisters.txt`
(b) `grep -ow '\bc[a-zA-Z]*\b' tongue_twisters.txt|wc -l`
(c) `awk 'BEGIN { count=0 } { for(i=1; i<=NF; i++) { if ($i ~ /^c/) count++ } } END { print count }' tongue_twisters.txt`
(d) `sed -n 's/\b[cC][a-zA-Z]*\b/&/gp' tongue_twisters.txt|wc -w`

### Answer

(b), (c)

<div style="page-break-after: always;"></div>

## Question 9 [MCQ] [7]

The tab-separated data file `pdata.txt` provided for cleanup showed every fourth and fifth line is a part of one line (first merge is the first and the second line) (see the following examples in the hint). Choose the correct commands from the following options, which can be used to merge every fourth and fifth (1-2, 5-6, 9-10, 13-14, etc...) line into one line to clean up the data file. [MCQ]

Hint:

Use the following information.

```
$ cat pdata.txt
Line1
Line2
Line3
Line4
Line5
Line6
Line7
Line8
Line9
Line10
Line11
Line12
Line13
Line14
$ sed 'N;s/\n/ /' pdata.txt
Line1   Line2
Line3   Line4
Line5   Line6
Line7   Line8
Line9   Line10
Line11  Line12
Line13  Line14
$ sed 'N;N;s/\n/ /' pdata.txt
Line1   Line2
Line3
Line4   Line5
Line6
Line7   Line8
Line9
Line10  Line11
Line12
Line13  Line14
Line15
```

(a) `sed 'N;N;N;s/\n/ /' pdata.txt`
(b) `sed -i 'N;N;N;N;s/\n/ /' pdata.txt`
(c) `sed -i 'N;N;N;s/\n/\t/' pdata.txt`
(d) `sed -i 'N;N;N;N;s/\n/\t/' pdata.txt`

## Answer

(c)

<div style="page-break-after: always;"></div>

## Question 10 [MSQ] [6]

The following text shows a set of questions and their answers. Identify which question-answer pair among the following needs to be corrected. Use the "None of the above" option if all statements are correct.

1. What is the purpose of the "kill" command in Linux?
   - Answer: The "kill" command in Linux sends signals to processes. It can terminate a process, send specific signals for process control, or even request a process to reload its configuration.
2. What is the significance of the process ID (PID) in Linux?
   - Answer: The process ID (PID) is a unique identifier assigned to each running process in Linux. It tracks and manages processes, allowing the operating system to interact with and control individual processes.
3. How can you check the resource utilization of a specific process in Linux?
   - Answer: You can check the resource utilization of a specific process in Linux using the "top" command. The "top" command provides real-time information about system processes, including CPU usage, memory consumption, and other resource statistics.
4. How can you monitor the system performance and resource usage of all processes in Linux?
   - Answer: You can monitor the system performance and resource usage of all processes in Linux using tools like "top", "htop", or "ps aux". These commands provide detailed information about CPU usage, memory consumption, and other system metrics for all running processes.

(a) 1
(b) 2
(c) 3
(d) 4
(e) None of the above

### Answer

(e)

<div style="page-break-after: always;"></div>

## Question 11 [MSQ] [7]

Following Script is executed on a text file. Choose the correct statement(s) from the options. [MSQ]

```bash
#!/bin/bash
file=$1
declare -a ELE
i = 1
for ele in $(cat "${file}")
do
    ELE[$i]=$ele
    ((i++))
done
for ((j=i; j>0; j--))
do
        echo ${ELE[$j]}
done
```

(a) `ELE` is an associative array.
(b) `ELE` is an indexed array.
(c) At the end of the execution of the bash script on a text file, the last sentence is printed first, followed by the next-to-last sentence till the first sentence becomes last.
(d) At the end of the execution of the bash script on a text file, the last word is printed first, followed by the next-to-last word till the first word becomes the last.

### Answer

(b),(d)

<div style="page-break-after: always;"></div>

## Question 12 [NAT] [7]

**Common data for questions 11 and 12**

```bash
#!/bin/bash
prn_num(){
        for c in 9 8 7; do
                sleep 0.25
                echo -n $c
        done
}

for i in {1..3}; do #first loop
        prn_num
done

for i in {1,2}; do #second loop
        prn_num &
done
```

What is the output of the **first loop** at the end of the execution of the given script? [NAT]

### Answer (ignore white space, newline)

987987987

<div style="page-break-after: always;"></div>

## Question 13 [NAT] [7]

What is the output of the **second loop** after the execution of the given script? [NAT]

### Answer (ignore white space, newline)

998877

<div style="page-break-after: always;"></div>

## Question 14 [MCQ] [8]

Choose the correct sed command from the options which will replace all the three-character month names with the corresponding numbers.

Note: Only the month should be changed

```bash
#!/bin/bash

# Associative array
declare -A month_to_number

month_to_number=(
	["Jan"]=1 ["Feb"]=2 ["Mar"]=3 ["Apr"]=4
	["May"]=5 ["Jun"]=6 ["Jul"]=7 ["Aug"]=8
	["Sep"]=9 ["Oct"]=10 ["Nov"]=11 ["Dec"]=12
) # ([key]=value)

read -r line
for m in "${!month_to_number[@]}"; do
	# get from stdin
	[[ "$line" =~ $m ]] || continue
	echo "$line" | sed "s/$m/${month_to_number[$m]}/" # replacement this line
done
```

(a) `echo "$line" | sed "s/.*/\L&/" | sed "s/$m/${month_to_number[$m]}/"`
(b) `echo "$line" | sed 's/$m/\L&/' | sed "s/$m/${month_to_number[$m]}/"`
(c) `echo "$line" | sed -i "s/$m/${month_to_number[$m]}/g"`
(d) `echo "$line" | sed -n "s/$m/${month_to_number[$m]}/g"`

### Answer

(c)

<div style="page-break-after: always;"></div>

## Question 15 [MCQ] [6]

Following entry is made to a crontab to run a script that will perform the backup. When is the script `/home/Garima/PC_management.sh`  scheduled to get executed? [MCQ]

```bash

5 2 * * 0 /home/Garima/PC_management.sh

```

**Hint**: Below is the description of the sequence in the cron job command. It tells at what date/time periodically the job needs to be executed.

```
*   *   *   *   *   <Command(s) with argument>
|   |   |   |   |              |
|   |   |   |   |      Command or Script to Execute        
|   |   |   |   |
|   |   |   |   |
|   |   |   |   |
|   |   |   | Day of the Week(0-6)
|   |   |   |
|   |   | Month of the Year(1-12)
|   |   |
|   | Day of the Month(1-31)  
|   |
| Hour(0-23)  
|
Min(0-59)
```

(a) Every Sunday at 02:05 am

(b) Every Sunday at 05:02 am

(c) Every Sunday at 05:02 am

(d) Every Sunday at 02:05 am

### Answer

(a)

<div style="page-break-after: always;"></div>
