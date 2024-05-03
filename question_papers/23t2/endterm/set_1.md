# System Commands End Term Set-1

## Question 1 [MCQ] [6]

Select the correct statement from the options for the following command.

```bash
cat $(cat)
```

(a) The command opens the file named "cat" in the current working directory.

(b) The command takes standard input and prints the received standard input.

(c) The command prints the contents of the file names obtained from the standard input

(d) The command throws an error since no argument is given to the command ˋcatˋ in ˋ$(cat)ˋ

### Answer

(c)

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

What does the command `echo <(seq 10) output represent?

(a) The standard output from the command `seq 10`
(b) A file
(c) A directory
(d) Nothing will be printed

### Answer

(b)

<div style="page-break-after: always;"></div>

## Question 3 [MSQ] [7]

Select the command(s) that retrieves the first ten lines of all the files that only end with `.md` in the current working directory and its subfolders.

Note: All the directories and files do not have space in their names

Hint:

- `-type f` option searches only for the files.
- `-name x*` option searches for the filename with the pattern with wild card characters (not regex)

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

<div style="page-break-after: always;"></div>

## Question 4 [MCQ] [6]

Which of the option is the correct output of the following command? [MCQ]

```bash
echo 'alphabet
alpha
beta
gamma
omega
iota
nu' |
    awk ' /^alpha/, /^omega/ { print } ' |
    sed '1d; $d'
```

(a)

```
alphabet
alpha
beta
gamma
omega
iota
nu
```

(b)

```
alphabet
alpha
beta
gamma
```

(c)

```
omega
iota
nu
```

(d)

```
alpha
beta
gamma
```

### Answer

(d)

<div style="page-break-after: always;"></div>

## Question 5 [NAT] [7]

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

What will be the output tar file name if no input (null string) is given as the second argument?
Assume the first argument of input is valid.

Note: Ensure no space before and after your answer

### Answer

.tar

<div style="page-break-after: always;"></div>

## Question 6 [MSQ] [8]

Choose the corner case(s) from stdin that makes this SED command fail to replace all the three-character month names with the corresponding numbers.

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
	echo "$line" | sed "s/$m/${month_to_number[$m]}/"
done
```

(a) `12/Jan/2017`
(b) `22-Aug-1999 Morning`
(c) `17/Feb/1888, 7/May/1999`
(d) `18/jul/2047`
(e) `19 Sep 2023 18:00`

### Answer

(c), (d)

<div style="page-break-after: always;"></div>

## Question 7 [MCQ] [6]

In a text file named "numbers.txt", multiple lines contain numbers. You want to delete all lines that have a number greater than 100. Which sed command would you use?

Hint: By default, SED uses the Basic Regular Expression Engine (BRE)

(a) `sed '/[0-9]\{3,\}/d' numbers.txt`
(b) `sed '/[0-9]{3,}/d' numbers.txt`
(c) `sed '/[0-9]{2,}/d' numbers.txt`
(d) `sed '/[0-9]\{2,\}/d' numbers.txt`

### Answer

(a)

<div style="page-break-after: always;"></div>

## Question 8 [MSQ] [8]

Complete the script to print the name in the order of the given name and family name from the file `name_country.csv`. In some countries, people keep their family name as their first name and their given name as their last name.

Note: `name_country.csv` is a comma-separated file with first name, last name and country as field values. The file `family_name_first_countries.txt` has the country name where the family name is used as the first name.

```bash
#!/bin/bash

awk '
BEGIN  {
    FS=","
}
FILENAME == "family_name_first_countries.txt" {
    family_name_first_countries[$0]++
}
# Fill here
' family_name_first_countries.txt name_country.csv
```

(a)

```
FILENAME == "name_country.csv" && $3 in family_name_first_countries {
    if ($3 in family_name_first_countries) {
        print $2, $1
    } else {
        print $1, $2
    }
}
```

(b)

```
FILENAME == "name_country.csv" {
    if ($3 in family_name_first_countries) {
        print $2, $1
    } else {
        print $1, $2
    }
}
```

(c)

```
FILENAME == "name_country.csv" && $3 in family_name_first_countries {
    print $2, $1
}
FILENAME == "name_country.csv" && !($3 in family_name_first_countries) {
    print $1, $2
}
```

(d)

```
FILENAME == "name_country.csv" && !($3 in family_name_first_countries) {
    print $2, $1
}
FILENAME == "name_country.csv" && $3 in family_name_first_countries {
    print $1, $2
}
```

## Answer

(b), (c)

<div style="page-break-after: always;"></div>

## Question 9 [MSQ] [6]

Choose the incorrect answer to the question. If all the statements are correct, select "None of the above".

1. What is a process in Linux?
   - Answer: In Linux, a process is an instance of a running program. It represents the execution of a program and consists of the program code, data, and resources.
2. How can you view the list of running processes in Linux?
   - Answer: You can use the "ps" command to view the list of running processes in Linux. The "ps" command provides information about active processes, including their process IDs (PIDs), resource usage, and status.
3. What is the difference between a foreground process and a background process?
   - Answer: A foreground process is a process that runs in the foreground and interacts directly with the user through the terminal. It receives input from the user and displays output on the terminal. On the other hand, a background process runs in the background without user interaction and does not occupy the terminal.
4. How can you terminate a running process in Linux?
   - Answer: You can terminate a running process in Linux using the "kill" command. The "kill" command sends a signal to a process, requesting it to terminate. The most commonly used signal is SIGTERM (signal number 15), which gracefully terminates the process.

(a) 1
(b) 2
(c) 3
(d) 4
(e) None of the above

### Answer

(e)

<div style="page-break-after: always;"></div>

## Question 10 [NAT] [7]

**Common data for questions 11 and 12**

```bash
#!/bin/bash
prn_num(){
        for c in 1 2 3 4 3 2 1; do
                sleep 0.5
                echo -n $c
        done
}

for i in {1..3}; do #first loop
        prn_num
done

for _ in {1..3}; do #second loop
        prn_num &
done
```

What is the output of the **first loop** at the end of the execution of the given script? [NAT]

### Answer (ignore white space, newline)

123432112343211234321

<div style="page-break-after: always;"></div>

## Question 11 [NAT] [7]

What will be the output of the **second loop** after the execution of the given script? [NAT]

### Answer (ignore white space, newline)

111222333444333222111

<div style="page-break-after: always;"></div>

## Question 12 [MCQ] [6]

Select the correct statement from the options for the following **SED** command.

```bash
sed '5~5{s/\b\([a-z]\)/\u\1/g}' sample.txt
```

(a) All characters in every fifth line of the text are capitalized
(b) Starting character of every fifth line is capitalized
(c) Starting character of each word is capitalized
(d) Starting character of each word of every fifth line is capitalized

### Answer

(d)

<div style="page-break-after: always;"></div>

## Question 13 [MSQ] [6]

Which of the following regular expression(s) are the **most appropriate** to capture the PAN card numbers in a file? [MSQ]

Note:

- A PAN (Permanent Account Number) typically follows the format of ABCTY1234D (All capital).

- The first three characters, "ABC" in this case, form an alphabetical series ranging from AAA to ZZZ.

- The fourth character, like 'T', indicates the status of the PAN holder, where 'T' stands for Trust, 'F' for Firm, 'H' for HUF, 'P' for Individual, and 'C' for Company.

- The fifth character, for instance, 'Y', represents the first letter of the PAN holder's last name.

- The subsequent four characters are sequential digits from 0001 to 9999.

- The tenth character, 'D', functions as an alphabetic check digit, ranging from A to Z.

Assume a Basic Regular Expression Engine (BRE)

(a) `[A-Za-z]\{3\}[TFHPIC][A-Za-z][0-9]\{4\}[A-Za-z]`
(b) `[A-Z]\{3\}[TFHPIC][A-Z][0-9]\{4\}[A-Z]`
(c) `[[:alpha:]]\{3\}[TFHPIC][[:alpha:]][[:digit:]]\{4\}[[:alpha:]]`
(d) `[[:upper:]]\{3\}[TFHPIC][[:upper:]][[:digit:]]\{4\}[[:upper:]]`

### Answer

(b),(d)

<div style="page-break-after: always;"></div>

## Question 14 [MSQ] [8]

A file contains data collected starting from 4th April 2004. The data is collected on 4th, 14th and 24th of April, May and June since then.
The text file, however, does not contain the date information in it. Now it is needed to add a column to this text file with the date format 4 April, 2004.

Identify which of the following command (using brace expansion and date command) will create a column to an empty file with the desired format starting from **4 April, 2004 to 24 June, 2005**. [MSQ]

Note:

The output of the command need not produce dates in temporal order.

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
$ date -d '04/21/2002' +'%B %d,%Y'
April 21,2002
$ echo 04/21/2002 |xargs -I {} date -d {} +'%B %d,%Y'
April 21,2002
```

(a) `echo {4..6}"/"{4,14,24}"/"{2002,2005}|
		tr ' ' '\n'|
		xargs -I {} date -d {} +'%d %B,%Y'`
(b) `echo {4..6}"/"{4,14,24}"/"{2002,2005}"\n"|
		xargs -I {} date -d {} +'%B %d,%Y'`
(c) `echo -e {4..6}" "{June,July,August}","{2004..2005}"\n"| 
		xargs -I{} date -d {} +'%B %d,%Y'`
(d) `echo -e {4..6}"/"{4..24..10}"/"{2002,2005}"\n"|
		xargs -I {} date -d {} +'%d %B,%Y'`

### Answer

(a), (d)

<div style="page-break-after: always;"></div>

## Question 15 [MCQ] [6]

Following entry is made to a crontab to run a script which generate system and process logs at designated time. When is the script `/home/Tisha/monitor_management.sh`  scheduled to get executed. [MCQ]

```bash

0 4 4 * * /home/Tisha/log_management.sh

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

(a) 4th of each Month at 00:04 am

(b) 4th of each Month at 04:00 am

(c) 4th Month of each year at 04:00 am

(d) 4th Month of each year at 00:04 am

### Answer

(b)

<div style="page-break-after: always;"></div>
