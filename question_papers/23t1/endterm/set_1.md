# System Commands Jan 2023 End Term Set-1

### Total Questions: 15 Max Marks: 100

#### Marks for each question are given in square brackets

## Question 1 (echo) [MCQ] [6]

```shell
$ help echo
echo: echo [-neE] [arg ...]
    Write arguments to the standard output.

    Display the ARGs, separated by a single space character and followed
    by a newline, on the standard output.

    Options:
      -n    do not append a newline
      -e    enable interpretation of the following backslash escapes
      -E    explicitly suppress interpretation of backslash escapes

    `echo` interprets the following backslash-escaped characters:
      ......
      \n    new line
      ......
      \t    horizontal tab
      ......
```

What will be the output of the following script?

```bash
echo -ne "a\tb"
echo -ne " \tc"
echo -ne " \td"
echo -ne " \te\tf"
```

(a)

```
a	b
	c
 	d
 	e	f
```

(b)

```
a	b 	c 	d 	e	f
```

(c)

```
a	b
c
d
e	f
```

(d)

```
a\tb
 \tc
 \td
 \te\tf
```

### Answer

(b)

### Explanation

- There is no `\n` being printed, and all `echo` have `-n`, so all are in same line.

---

<div style="page-break-after: always;"></div>

## Question 2 (cron) [MCQ] [6]

Following entry is made to a crontab. When is the script `/home/garima/premodel.sh` scheduled to get executed. [MCQ]

```bash
5 0 * * 1 /home/garima/premodel.sh
```

**Hint**: Below is the description of the sequence in the cron job command. It tells at what date/time periodically the job needs to be executed.

```
*   *   *   *   *   <Command(s) with argument>
|   |   |   |   |              |
|   |   |   |   |      Command or Script to Execute
|   |   |   |   |
|   |   |   |   |
|   |   |   |   |
|   |   |   | Day of the Week(0-6)
|   |   |   |
|   |   | Month of the Year(1-12)
|   |   |
|   | Day of the Month(1-31)
|   |
| Hour(0-23)
|
Min(0-59)
```

(a) Every Monday at 00:05

(b) Every Monday at 05:00

(c) Everyday at 08:00

(d) Everyday at 08:05 in May

### Answer

(a)

---

<div style="page-break-after: always;"></div>

## Question 3 (shell variable) (Comprehension) [MCQ] [7]

```
$ xargs --help
Usage: xargs [OPTION]... COMMAND [INITIAL-ARGS]...
Run COMMAND with arguments INITIAL-ARGS and more arguments read from input.
...

$ seq 5
1
2
3
4
5

$ seq 5 | xargs echo
1 2 3 4 5

$ ls --help
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.
  -a, --all                  do not ignore entries starting with .
  -A, --almost-all           do not list implied . and ..
      --author               with -l, print the author of each file
  -b, --escape               print C-style escapes for nongraphic characters
      --block-size=SIZE      with -l, scale sizes by SIZE when printing them;
                               e.g., '--block-size=M'; see SIZE format below
  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                               modification of file status information);
                               with -l: show ctime and sort by name;
                               otherwise: sort by ctime, newest first
  -C                         list entries by columns
      --color[=WHEN]         colorize the output; WHEN can be 'always' (default
                               if omitted), 'auto', or 'never'; more info below
  -d, --directory            list directories themselves, not their contents
  -D, --dired                generate output designed for Emacs' dired mode
  -f                         do not sort, enable -aU, disable -ls --color
  -F, --classify             append indicator (one of */=>@|) to entries
      --file-type            likewise, except do not append '*'
      --format=WORD          across -x, commas -m, horizontal -x, long -l,
                               single-column -1, verbose -l, vertical -C
      --full-time            like -l --time-style=full-iso
  -g                         like -l, but do not list owner
      --group-directories-first
                             group directories before files;
                               can be augmented with a --sort option, but any
                               use of --sort=none (-U) disables grouping
  -G, --no-group             in a long listing, don't print group names
  -h, --human-readable       with -l and -s, print sizes like 1K 234M 2G etc.
      --si                   likewise, but use powers of 1000 not 1024
  -H, --dereference-command-line
                             follow symbolic links listed on the command line
      --dereference-command-line-symlink-to-dir
                             follow each command line symbolic link
                               that points to a directory
      --hide=PATTERN         do not list implied entries matching shell PATTERN
                               (overridden by -a or -A)
      --hyperlink[=WHEN]     hyperlink file names; WHEN can be 'always'
                               (default if omitted), 'auto', or 'never'
      --indicator-style=WORD  append indicator with style WORD to entry names:
                               none (default), slash (-p),
                               file-type (--file-type), classify (-F)
  -i, --inode                print the index number of each file
  -I, --ignore=PATTERN       do not list implied entries matching shell PATTERN
  -k, --kibibytes            default to 1024-byte blocks for disk usage;
                               used only with -s and per directory totals
  -l                         use a long listing format
  -L, --dereference          when showing file information for a symbolic
                               link, show information for the file the link
                               references rather than for the link itself
  -m                         fill width with a comma separated list of entries
  -n, --numeric-uid-gid      like -l, but list numeric user and group IDs
  -N, --literal              print entry names without quoting
  -o                         like -l, but do not list group information
  -p, --indicator-style=slash
                             append / indicator to directories
  -q, --hide-control-chars   print ? instead of nongraphic characters
      --show-control-chars   show nongraphic characters as-is (the default,
                               unless program is 'ls' and output is a terminal)
  -Q, --quote-name           enclose entry names in double quotes
      --quoting-style=WORD   use quoting style WORD for entry names:
                               literal, locale, shell, shell-always,
                               shell-escape, shell-escape-always, c, escape
                               (overrides QUOTING_STYLE environment variable)
  -r, --reverse              reverse order while sorting
  -R, --recursive            list subdirectories recursively
  -s, --size                 print the allocated size of each file, in blocks
  -S                         sort by file size, largest first
      --sort=WORD            sort by WORD instead of name: none (-U), size (-S),
                               time (-t), version (-v), extension (-X)
      --time=WORD            change the default of using modification times;
                               access time (-u): atime, access, use;
                               change time (-c): ctime, status;
                               birth time: birth, creation;
                             with -l, WORD determines which time to show;
                             with --sort=time, sort by WORD (newest first)
      --time-style=TIME_STYLE  time/date format with -l; see TIME_STYLE below
  -t                         sort by time, newest first; see --time
  -T, --tabsize=COLS         assume tab stops at each COLS instead of 8
  -u                         with -lt: sort by, and show, access time;
                               with -l: show access time and sort by name;
                               otherwise: sort by access time, newest first
  -U                         do not sort; list entries in directory order
  -v                         natural sort of (version) numbers within text
  -w, --width=COLS           set output width to COLS.  0 means no limit
  -x                         list entries by lines instead of by columns
  -X                         sort alphabetically by entry extension
  -Z, --context              print any security context of each file
  -1                         list one file per line.  Avoid '\n' with -q or -b
      --help     display this help and exit
      --version  output version information and exit
...
```

Based on the information provided above, select the bash function `cdlmd` that changes the current working directory to the recently modified directory in the current directory.

(a)

```bash
cdlmd() {
    ls | head -1 | cd
}
```

(b)

```bash
cdlmd() {
    ls -t -d */ | xargs cd
}
```

(c)

```bash
cdlmd() {
    ls -t -d */ | head -1 | xargs cd
}
```

(d)

```bash
cdlmd() {
    ls -g | head -1 | xargs cd
}
```

### Answer

(c)

### Explanation

- `ls -t -d */` lists directories in the current directory sorted by modification time
- `head -1` selects the first directory
- `xargs cd` changes the current working directory to the selected directory

---

<div style="page-break-after: always;"></div>

## Question 4 (shell variables) [MCQ] [6]

Which of the following command prints all the keys present in an bash associative array.

(a) `$arr`

(b) `$arr[@]`

(c) `${!arr[@]}`

(d) `${arr[@]}`

### Answer

(c)

---

<div style="page-break-after: always;"></div>

## Question 5 (for) [MSQ] [8]

Contents of the current working directory are given below.

```shell
$ ls -R
.:
a  b

./a:
file0  file1  file2  file3  file4

./b:
file10  file3  file4  file5  file6
```

Select all the file(s) that will be present in the current working directory after the execution of the following script. [MSQ]

```bash
cd a
for i in *; do
    ls ../b | grep $i && mv $i ../b
done
```

(a) file0

(b) file1

(c) file2

(d) file3

(e) file4

(f) file5

(g) file6

(h) file10

### Answer

(a), (c)

### Explanation

- `file1` regex is matched by file `file10` in directory `b`

---

<div style="page-break-after: always;"></div>

## Question 6 (while) [MCQ] [7]

```bash
while read -r line; do
    if [[ $line =~ ^[[:digit:]].*[[:digit:]]$ ]]; then
        echo $line
    fi
done < file1 > file2
diff file1 file2
```

Select a scenario before the execution of the script from the following options such that upon execution of the above script, no lines will be printed to the terminal.

(a) file1 and file2 have the same number of lines

(b) file2 being the copy of file1

(c) file2 contains all the lines that start and end with a number

(d) file1 contains all the lines that start and end with a number

### Answer

(d)

### Explanation

- The script reads from `file1` and writes to `file2`
- Lines that match the regex `^[[:digit:]].*[[:digit:]]$` are written to `file2`
- The regex matches any line that starts and ends with a digit.
- `diff file1 file2` will show no output if the files are identical.
- `file2` is created after the script is run, so its contents earlier is irrelevant.
- `file1` and `file2` will be identical if all lines in `file1` match the regex.

---

<div style="page-break-after: always;"></div>

## Question 7 (grep) [MSQ] [6]

Which of the following command would print lines with Alice or Rabbit with total count of lines of their occurrences at the end of the output from `alice.txt` file.
Hint:

- The pipe character do not have special meaning in Basic Regular Expression Engine(BRE) unless escaped with backslash
- -E option in grep enables Extended Regular Expression Engine(ERE)
- -c option gives the count of the line that have matches

(a) `grep 'Alice|Rabbit' alice.txt | grep -c 'Alice|Rabbit'`

(b) `grep -E 'Alice|Rabbit' alice.txt| grep -E -c 'Alice|Rabbit'`

(c) `grep 'Alice\|Rabbit' alice.txt; grep -c 'Alice\|Rabbit' alice.txt`

(d) `grep -E 'Alice|Rabbit' alice.txt; grep -E -c 'Alice|Rabbit' alice.txt`

### Answer

(c), (d)

### Explanation

- `|` needs to be escaped in BRE. Only ERE supports unescaped `|`.
- If we pipe output of one grep into next grep, the output of first grep will be lost.

Alternate solution:

```bash
grep -E 'Alice|Rabbit' alice.txt | tee >(wc -l)
```

Here `tee` command writes to the standard output and to the file specified in the argument. In this case, it writes to a temporary FIFO file which is read as standard input for the `wc -l` command.

or

```bash
grep -E 'Alice|Rabbit' alice.txt | tee /dev/tty | wc -l
```

Here `tee` writes to `/dev/tty` which is the terminal as well as to standard output. The standard output is then piped to `wc -l` which counts number of lines.

---

<div style="page-break-after: always;"></div>

## Question 8 (regex) [MSQ] [8]

For the given regular expression (regex) identify the correct statement(s) from the following options. Note that the Extended Regular Expression (ERE) is used.

Hint:
The group number starts from the outer to inner and left to right respectively.
Note: a word, phrase, or sequence that reads the same backwords as forwards e.g. Noon, Anna

```
^((.)\2|(.).\3|(.)(.)\5\4)$
```

(a) This regex will match with 1 character palindrome

(b) This regex will match with 2 character palindrome

(c) This regex will match with 3 character palindrome

(d) This regex will match with 4 character palindrome

### Answer

(b), (c), (d)

### Explanation

- `(.)\2` matches 2 characters palindrome
- `(.).\3` matches 3 characters palindrome
- `(.)(.)\5\4` matches 4 characters palindrome

---

<div style="page-break-after: always;"></div>

## Question 9 (shell command) (Comprehension) [MSQ] [8]

A student named Meena wrote a shell script `exoc.sh` such that every time `main.py` is changed (change in modification time) the shell script is executed on python script file. Apparently, her code had some issues. Identify all the flaws from the following options to facilitate debugging the script and the execution steps.

**Script: exoc.sh**

```
#!/usr/bin/python3

while true; do
	lmt=$(stat -c %Y "$1")
	if [[ "$lmt" == "$plmt" ]]; then
		clear
		echo "[$(date +"%H:%M:%S") STARTED]"
		python3 "$1"
		echo "[$(date +"%H:%M:%S") ENDED]"
	fi
	plmt="$lmt"
	sleep 1
done
```

**Execution**

```bash
$ ls -l
total 16K
drwxrwxr-x  2 meena meena 4.0K Apr  9 10:53 ./
drwxr-xr-x 34 meena meena  12K Apr  9 10:52 ../
-rwxrwxr-x  1 meena meena   52 Apr  9 10:52 exoc.sh
-rw-rw-r--  1 meena meena  462 Apr  9 10:53 main.py
$ echo main.py | ./exoc.sh
```

Hints

```
$ stat --help
Usage: stat [OPTION]... FILE...
Display file or file system status.

Mandatory arguments to long options are mandatory for short options too.
  -L, --dereference     follow links
  -f, --file-system     display file system status instead of file status
      --cached=MODE     specify how to use cached attributes;
                          useful on remote file systems. See MODE below
  -c  --format=FORMAT   use the specified FORMAT instead of the default;
                          output a newline after each use of FORMAT
      --printf=FORMAT   like --format, but interpret backslash escapes,
                          and do not output a mandatory trailing newline;
                          if you want a newline, include \n in FORMAT
  -t, --terse           print the information in terse form
      --help     display this help and exit
      --version  output version information and exit

The --cached MODE argument can be; always, never, or default.
`always` will use cached attributes if available, while
`never` will try to synchronize with the latest attributes, and
`default` will leave it up to the underlying file system.

The valid format sequences for files (without --file-system):

  %a   permission bits in octal (note '#' and '0' printf flags)
  %A   permission bits and file type in human readable form
  %b   number of blocks allocated (see %B)
  %B   the size in bytes of each block reported by %b
  %C   SELinux security context string
  %d   device number in decimal
  %D   device number in hex
  %f   raw mode in hex
  %F   file type
  %g   group ID of owner
  %G   group name of owner
  %h   number of hard links
  %i   inode number
  %m   mount point
  %n   file name
  %N   quoted file name with dereference if symbolic link
  %o   optimal I/O transfer size hint
  %s   total size, in bytes
  %t   major device type in hex, for character/block device special files
  %T   minor device type in hex, for character/block device special files
  %u   user ID of owner
  %U   user name of owner
  %w   time of file birth, human-readable; - if unknown
  %W   time of file birth, seconds since Epoch; 0 if unknown
  %x   time of last access, human-readable
  %X   time of last access, seconds since Epoch
  %y   time of last data modification, human-readable
  %Y   time of last data modification, seconds since Epoch
  %z   time of last status change, human-readable
  %Z   time of last status change, seconds since Epoch

Valid format sequences for file systems:

  %a   free blocks available to non-superuser
  %b   total data blocks in file system
  %c   total file nodes in file system
  %d   free file nodes in file system
  %f   free blocks in file system
  %i   file system ID in hex
  %l   maximum length of filenames
  %n   file name
  %s   block size (for faster transfers)
  %S   fundamental block size (for block counts)
  %t   file system type in hex
  %T   file system type in human readable form

--terse is equivalent to the following FORMAT:
    %n %s %b %f %u %g %D %i %h %t %T %X %Y %Z %W %o %C
--terse --file-system is equivalent to the following FORMAT:
    %n %i %l %t %s %S %b %f %a %c %d

NOTE: your shell may have its own version of stat, which usually supersedes
the version described here.  Please refer to your shell's documentation
for details about the options it supports.
```

(a) Incorrect interpreter in the first line on `exoc.sh`

(b) Incorrect condition in if statement

(c) Incorrect assignment to the variable `lmt`

(d) Incorrect assignment to the variable `plmt`

(e) Incorrect execution; The proper execution should be `./exoc.sh main.py`

(f) Incorrect execution; The proper execution should be `exoc.sh main.py`

### Answer

(a), (b), (e)

### Explanation

- The shebang should be `#!/bin/bash` instead of `#!/usr/bin/python3`
- The script should be executed as `./exoc.sh main.py` instead of `echo main.py | ./exoc.sh` as the `stat` command uses `$1` which is the first argument passed to the script.
- The condition in the if statement should be `!=` instead of `==` to check if the modification time has changed.
- Assignment of `lmt` and `plmt` are correct.
- The script cannot be run by name as it is not present in the PATH.

---

<div style="page-break-after: always;"></div>

## Question 10 (sed) [MCQ] [6]

What will be the outcome of the command `sed -i '/./,$!d' file.txt`?

(a) Delete all empty lines in the file `file.txt`

(b) Delete all lines with '.' character in the file `file.txt`

(c) Delete all empty lines before the first non-empty line in the file `file.txt`

(d) Delete all empty lines after the last non-empty line in the file `file.txt`

### Answer

(c)

### Explanation

- `/./` matches non-empty lines.
- `$` is the last line.
- `/./,$` matches all lines from the first non-empty line to the last line.
- `!d` deletes all lines except the range of lines matched by `/./,$`.
- So, it deletes all empty lines before the first non-empty line.

---

<div style="page-break-after: always;"></div>

## Question 11 (sed) [MSQ] [6]

Given the file `test.csv` with content shown below. Select the sed command(s) that will filter lines with abbreviated regions.

```bash
$ cat test.csv
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

**Expected output**

```bash
Madan,1-158-662-4996,madan-raja@outlook.ca,GA
Srivas,1-516-922-8416,k-srivas@icloud.com,HR
Sahni,151-8534,sahni@hotmail.ca,KA
Rana,1-528-385-7783,rana4716@yahoo.org,AN
```

(a) `sed -n '/[A-Z]\{1\}$/ p' test.csv`

(b) `sed -n '/,[[:upper:]]\{2\}$/ p' test.csv`

(c) `sed -n '/[[:alnum:]]\{2\}$/ p' test.csv`

(d) `sed -n '/[[:upper:]]\{2\}$/ p' test.csv`

### Answer

(a), (b), (d)

### Explanation

- Matching `{1}` will also match if there are two characters in the region, it will match the last character of the region.
- `alnum` will match any alphanumeric character, but region code are only uppercase.

---

<div style="page-break-after: always;"></div>

## Question 12 (sed) [MSQ] [6]

Which of the following SED command(s) would print lines with Alice or Rabbit from `alice.txt` file.
Hint:

- The pipe character do not have special meaning in Basic Regular Expression Engine(BRE) unless escaped with a backslash
- -E option in grep enables Extended Regular Expression Engine(ERE)
- -n option prevent the default printing in sed

(a) `sed -E 's/Alice\|Rabbit//' alice.txt`

(b) `sed -E -n 's/Alice|Rabbit//' alice.txt`

(c) `sed -n '/Alice\|Rabbit/ p' alice.txt`

(d) `sed -En '/Alice|Rabbit/ p' alice.txt`

### Answer

(c), (d)

### Explanation

- `|` needs to be escaped in BRE. Only ERE supports unescaped `|`.
- `s` is for substitution, not for searching.
- We need to use `-n`, so all lines are not printed by default.

---

<div style="page-break-after: always;"></div>

## Question 13 (AWK)[MCQ] [8]

What will be the output of the following command?

```bash
echo {a..c}{1..3} | tr ' ' '\n' | awk '
{
    count+=NF
    count2+=NR
    count3+=length+1
}
END {
    print count, count2, count3
}
'
```

Hint:

```
$ tr --help
Usage: tr [OPTION]... SET1 [SET2]
Translate, squeeze, and/or delete characters from standard input,
writing to standard output.
...

$ awk --help
Usage: awk [POSIX or GNU style options] -f progfile [--] file ...
Usage: awk [POSIX or GNU style options] [--] 'program' file ...
POSIX options:		GNU long options: (standard)
	-f progfile		--file=progfile
	-F fs			--field-separator=fs
...

$ man awk | cat
...
length([s]) Return  the length of the string s, or
            the length of $0 if s is not supplied.
            As  a  non-standard extension, with an
            array argument, length()  returns  the
            number of elements in the array.
...
```

(a) 9 45 27

(b) 9 9 18

(c) 9 27 27

(d) 9 27 18

### Answer

(a)

### Explanation

- `{a..c}{1..3}` expands to `a1 a2 a3 b1 b2 b3 c1 c2 c3`
- `tr ' ' '\n'` replaces space with newline
- `NF` is the number of fields in the current record, which is always 1 in this case, as each word is in new line due to `tr`
- $3 \times 3 = 9$ is the number of lines the AWK script runs over, so `count1` is $= 1 \times 9 = 9$
- `NR` is the number of records read so far, which is the line number, so `count2` is $= 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45$
- `length` is the length of the current record, which is the number of characters in the line. Each line has exactly two characters always, so `length + 1` $=3$ so `count3` is $= 3 + 3 + 3 + 3 + 3 + 3 + 3 + 3 + 3 = 27$

---

<div style="page-break-after: always;"></div>

## Question 14 (AWK) [MCQ] [6]

**file.csv**

```bash
Sahni,151-8534,sahni@hotmail.ca,KA
Mahajan,1-548-689-8736,mahajan@icloud.co.uk,Bihar
Rana,1-528-385-7783,rana4716@yahoo.org,AN
```

Given a CSV file `file.csv` with contents as shown above. Select AWK command(s) which can produce the output as shown below.

**Expected Output**

```bash
Sahni
151-8534
Mahajan
1-548-689-8736
Rana
1-528-385-7783
```

Hint:

```
$ man awk | cat
...
FS   The input field separator,  a  space  by  default.
     See Fields, above.
...
OFS  The output field separator, a space by default.

ORS  The output record separator, by default a newline.
...
```

(a) `awk -F, '{print $1"\n"$2}' file.csv`

(b) `awk 'BEGIN{FS=",";OFS="\n"}{print $1 $2}' file.csv`

(c) `awk 'BEGIN{FS=",";ORS="\n"}{print $1,$2}' file.csv`

(d) `awk -F, '{print $1"\n",$2}' file.csv`

### Answer

(a)

### Explanation

- `-F,` sets the field separator to `,`
- `print $1"\n"$2` prints the first field followed by a newline and then the second field
- `OFS` will work if we separate the arguments with `,` in print, not space.
- `ORS` is output record separator, not field separator.

---

<div style="page-break-after: always;"></div>

## Question 15 (AWK) [MCQ] [6]

In a working directory number of text files are present with varying sizes (varying number of lines). For the following AWK script executed in the working directory, what is true for the output from the following options?

```bash
#!/usr/bin/awk -f

n < FNR {
    n = FNR
    nf = FILENAME
}
END {
    print nf
}
```

Hint:

```
$ man awk | cat
...
FILENAME The  name  of the current input file.  If no files
         are specified on the command line,  the  value  of
         FILENAME  is  “-”.  However, FILENAME is undefined
         inside the BEGIN rule (unless set by getline).

FNR      The input record number in the current input file.
...
```

(a) The file name with the maximum number of lines among the files that are passed as arguments is printed

(b) The file name that has the minimum number of lines among the files that are passed as arguments is printed

(c) The file name that is passed as the first file argument is printed

(d) The file name that is passed as the last file argument is printed

### Answer

(a)

### Explanation

- `FNR` is the record number in the current file
- `n < FNR` compares the current record number with the maximum record number seen so far
- `n = FNR` updates the maximum record number seen so far
- `nf = FILENAME` updates the file name with the maximum number of lines seen so far
- `END` block prints the file name with the maximum number of lines seen so far

---
