# System Commands Jan 2023 End Term Set-2

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
echo -ne "a\tb\n"
echo -ne " \tc\n"
echo -ne " \td\n"
echo -ne " \te\tf\n"
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

(a)

### Explanation

- The `\n` at the end of each `echo` will print a newline as `-e` flag is given.

---

<div style="page-break-after: always;"></div>

## Question 2 (cron) [MCQ] [6]

Following entry is made to a crontab. When is the script `/home/garima/premodel.sh` scheduled to get executed. [MCQ]

```bash
0 4 * * 1 /home/garima/premodel.sh
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

(a) Every Monday at 00:04

(b) Every Monday at 04:00

(c) Every Sunday at 04:00

(d) Every Sunday at 00:04

### Answer

(b)

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

Based on the information provided above, select the bash function `cdlmf` that opens the recently modified file in the current directory in vi editor.

(a)

```bash
cdlmf() {
    ls | head -1 | vi
}
```

(b)

```bash
cdlmf() {
    ls -t | xargs vi
}
```

(c)

```bash
cdlmf() {
    ls -tF | head -1 | grep -v "/$" | xargs vi
}
```

(d)

```bash
cdlmf() {
    ls -tF | grep -v "/$" | head -1 | xargs vi
}
```

### Answer

(d)

### Explanation

- `ls -tF` will list the files in the current directory sorted by modification time, it will also append `/` to directories, `*` to executables, etc.
- `grep -v "/$"` will exclude directories from the list.
- `head -1` will select the first file from the list.
- `xargs vi` will open the selected file in the vi editor.
- If the `head` is done before `grep` then it will select the first file from the list which may be directory.

---

<div style="page-break-after: always;"></div>

## Question 4 (shell variable) [MCQ] [6]

Which of the following command prints all the values present in a bash associative array.

(a) `$arr`

(b) `$arr[@]`

(c) `${!arr[@]}`

(d) `${arr[@]}`

### Answer

(d)

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
cd b
for i in *; do
    ls ../a | grep $i && mv $i ../a
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

(f), (g), (h)

### Explanation

- Files in `b` that match with a substring of the files in `a` are moved to `a`. So, `file3` and `file4` are moved to `a`.
- `file5`, `file6`, and `file10` are not moved as they do not match with any substring of the files in `a`.

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

Select a scenario from the following options such that upon execution of the above script, no lines will be printed to the terminal.

(a) file1 and file2 have the same number of lines

(b) file2 being the copy of file1

(c) file1 is empty

(d) file2 containing all the lines that start and end with a number

### Answer

(c)

### Explanation

- The script reads from `file1` and writes to `file2`
- Lines that match the regex `^[[:digit:]].*[[:digit:]]$` are written to `file2`
- The regex matches any line that starts and ends with a digit.
- `diff file1 file2` will show no output if the files are identical.
- `file2` is created after the script is run, so its contents earlier is irrelevant.
- `file1` and `file2` will be identical if all lines in `file1` match the regex.
- If `file1` is empty, no lines will be printed to the terminal.

---

<div style="page-break-after: always;"></div>

## Question 7 (grep) [MSQ] [6]

Which all grep commands from the following option produces count of the paragraphs (i.e. total number of paragraphs) present in a text file `book.txt`.
Assume that a paragraph always ends with a full stop (.)

(a) `grep '^.' book.txt | wc -l`

(b) `grep '.' book.txt | wc -l`

(c) `grep '.*\.$' book.txt | wc -l `

(d) `grep '\.$' book.txt | wc -l`

### Answer

(c) and (d)

### Explanation

- `.` is a special character in Regex, so it has to be escaped to match a literal period.
- `.*\.$` will match any line that ends with a period. The entire line is matched.
- `\.$` will match any line that ends with a period. Only the period is matched.

---

<div style="page-break-after: always;"></div>

## Question 8 (regex) [MSQ] [8]

For the given regular expression (regex) identify the correct statement(s) from the following options. Note that the Extended Regular Expression (ERE) is used.

**Hint:**
The group number starts from the outer to inner and left to right respectively.
**Note:** a word, phrase, or sequence that reads the same backwords as forwards e.g. Noon, Anna

```
^((.)|(.)\3|(.).\4)$
```

(a) This regex will match with 1 character palindrome

(b) This regex will match with 2 character palindrome

(c) This regex will match with 3 character palindrome

(d) This regex will match with 4 character palindrome

### Answer

(a), (b), (c)

### Explanation

- `^` and `$` are anchors that match the start and end of the line respectively.
- `.` matches any character.
- `\3` and `\4` are backreferences that match the same character as the 3rd and 4th group respectively.
- `(.)` matches any character and is the 2nd group. This matches single character palindromes.
- `(.)\3` matches any character followed by the same character. This matches two character palindromes.
- `(.).\4` matches any character, followed by any character, followed by the same character as the first character. This matches three character palindromes.

---

<div style="page-break-after: always;"></div>

## Question 9 (shell command) (Comprehension) [MSQ] [8]

A student named Meena wrote a shell script `exoc.sh` such that everytime `main.py` is changed (change in modification time) the shell script is executed on python script file. Apparently, her code had some issues. Identify all the flaws from the following options to facilitate debugging the script and the execution steps.

**Script: exoc.sh**

```
#!/usr/bin/bash

while true; do
	lmt=$(stat -c %W "$1")
	if [[ "$lmt" -lt "$plmt" ]]; then
		clear
		echo "[$(date +"%H:%M:%S") STARTED]"
		python3 "$2"
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
$ ./exoc.sh main.py
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

(e) Incorrect execution; The proper python file execution should be `python3 "$1"`

(f) Incorrect execution; The proper python file execution should be `"$1"`

### Answer

(b), (c), (e)

### Explanation

- The shebang is `#!/usr/bin/bash` which is correct.
- The condition in the if statement is incorrect. It should be `[[ "$lmt" -gt "$plmt" ]]` to check if the modification time has increased, it can never be less than the previous modification time.
- The assignment to the variable `lmt` is incorrect. It should be `lmt=$(stat -c %Y "$1")` to get the modification time of the file. `%W` gives the time of creation of the file.
- Assignment of `plmt` is correct.
- The python file execution should be `python3 "$1"` to execute the python file passed as an argument, not `python3 "$2"`.

---

<div style="page-break-after: always;"></div>

## Question 10 (sed) [MSQ] [6]

Which of the following command(s) will print only the lines 4 to 6 (ends-inclusive) and 10 to 15 (ends-inclusive) lines of a text file `test.txt`?

Hint:

```
$ sed --help
Usage: sed [OPTION]... {script-only-if-no-other-script} [input-file]...

  -n, --quiet, --silent
                 suppress automatic printing of pattern space
      --debug
                 annotate program execution
  -e script, --expression=script
                 add the script to the commands to be executed
...
```

(a) `sed '1,3d; 7,9d; 16,$d;' test.txt`

(b) `sed '4,6p; 10,15p' test.txt`

(c) `sed -n '4,6p; 10,15p' test.txt`

(d) `sed -e '4,6p' -e '10,15p' test.txt`

### Answer

(a), (c)

### Explanation

- `sed '1,3d; 7,9d; 16,$d;' test.txt` will delete lines 1 to 3, 7 to 9, and from line 16 to the end of the file, this is same as printing lines 4 to 6 and 10 to 15. We do not use `-n` here as we want the default printing.
- `sed -n '4,6p; 10,15p' test.txt` will print lines 4 to 6 and 10 to 15. `-n` suppresses the automatic printing of the pattern space, so we have to explicitly print the lines we want.

---

<div style="page-break-after: always;"></div>

## Question 11 (sed) [MCQ] [6]

How many lines will the file `b.txt` have after the end of execution of the below command?

```bash
sed 's/.*/&\n&/' a.txt > b.txt
```

(a) Total number of lines in b.txt is equal to the total number of lines in a.txt

(b) Total number of lines in b.txt is equal to the total number of lines in a.txt + 1

(c) Total number of lines in b.txt is equal to the total number of lines in a.txt + 2

(d) Total number of lines in b.txt is equal to the twice the number of lines in a.txt

### Answer

(d)

### Explanation

- `\n` is a newline character in `sed`.
- `&` is the matched pattern in `sed`.
- `s/.*/&\n&/` will duplicate each line in the file `a.txt`.
- So, the number of lines in `b.txt` will be twice the number of lines in `a.txt`.

---

## Question 12 (sed) [MSQ] [6]

Given a file `test.csv` with content shown below, select the sed script(s) that will remove the hyphens (_-_) present in the phone number.

```shell
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
name,phone,email,region
Madan,11586624996,madan-raja@outlook.ca,GA
Persaud,18777045869,persaud@google.edu,Meghalaya
Srivas,15169228416,k-srivas@icloud.com,HR
Swami,7611395,swami@google.couk,Haryana
Subram,9815610,subram3142@yahoo.org,Karnataka
Nirmal,4747526,nirmal@icloud.org,Madhya Pradesh
Sahni,1518534,sahni@hotmail.ca,KA
Mahajan,15486898736,mahajan@icloud.couk,Bihar
Rana,15283857783,rana4716@yahoo.org,AN
```

(a)

```
s/\([0-9]\)-\([0-9]\{3\}\)-\([0-9]\{3\}\)-\([0-9]\{4\}\)/\1\2\3\4/
s/\([0-9]\{3\}\)-\([0-9]\{4\}\)/\2\1/
```

(b)

```
s/-//g
```

(c)

```
s/\([[:digit:]]\)-\([[:digit:]]\{3\}\)-\([[:digit:]]\{3\}\)-\([[:digit:]]\{4\}\)/\1\2\3\4/
s/\([[:digit:]]\{3\}\)-\([[:digit:]]\{4\}\)/\1/2/
```

(d)

```
s/\([[:digit:]]\)-\([[:digit:]]\)/\1\2/g
```

### Answer

(c), (d)

### Explanation

- (a) Statement two has incorrect order of backreferences.
- (b) Will remove all hyphens from the file, including the ones in email id.
- (c) Will remove hyphens from the phone numbers only. This is specific pattern matching only those two formats of phone numbers.
- (d) Will remove hyphens from the phone numbers only. This is a generic pattern matching any two digits separated by a hyphen. This can also remove hyphen from email ids if the email id has two digits separated by a hyphen, however that is not present in the given input.

---

<div style="page-break-after: always;"></div>

## Question 13 (AWK) [MCQ] [8]

What will be the output of the following command?

```bash
echo {a,b,c,c}{c,c,e,f} | tr ' ' '\n' | sort | uniq | awk '
{
    n += NR
}
END {
    print n
}
'
```

(a) 45

(b) 78

(c) 136

(d) 55

### Answer

(a)

### Explanation

- `echo {a,b,c,c}{c,c,e,f}` will expand to `ac ac ae af bc bc be bf cc cc ce cf cc cc ce cf`.
- `tr ' ' '\n'` will replace spaces with newlines. Putting each word in a separate line.
- `sort` will sort the lines.
- `uniq` will remove duplicate lines.
- The `awk` script adds the line number to the variable `n` for each line, then prints the value.
- There will be $9$ lines after `uniq` and the sum of the first $9$ natural numbers is $45$.
- To find the number of unique elements, simply remove the intra-brace duplicates and multiply their cardinality.
- To find the sum of first $n$ natural numbers, use the formula $\frac{n(n+1)}{2}$.

---

<div style="page-break-after: always;"></div>

## Question 14 (AWK) [MSQ] [6]

**Content file.csv**

```bash
Sahni,151-8534,sahni@hotmail.ca,KA
Mahajan,1-548-689-8736,mahajan@icloud.co.uk,Bihar
Rana,1-528-385-7783,rana4716@yahoo.org,AN
```

Given a CSV file `file.csv` with contents as shown above. Select AWK command(s) which can produce the output as shown below.

**Expected Output**

```bash
Sahni:151-8534:sahni@hotmail.ca

Mahajan:1-548-689-8736:mahajan@icloud.co.uk

Rana:1-528-385-7783:rana4716@yahoo.org

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

(a) `awk -F, '{print $1":"$2":"$3"\n"}' file.csv`

(b) `awk 'BEGIN{FS=",";OFS=":";ORS="\n"}{print $1,$2,$3}' file.csv`

(c) `awk 'BEGIN{FS=",";OFS=":";ORS="\n\n"}{print $1,$2,$3}' file.csv`

(d) `awk -F, 'BEGIN{OFS=":"}{print $1,$2,$3"\n"}' file.csv`

### Answer

(a), (c), (d)

### Explanation

- `FS` needs to be set to `,` for correct field extraction. This can be done using the `-F` option or setting the `FS` variable in the `BEGIN` block.
- `OFS` needs to be set to `:` for the output field separator if separating the terms in `print` with `,`, or we can concatenate the fields with the string ":" directly without setting and using `OFS`.
- `ORS` needs to be set to `\n\n`, or we need to explicitly print a `\n` at the end of the `print` statement to separate the records with two newlines.

---

<div style="page-break-after: always;"></div>

## Question 15 (AWK) [MCQ] [6]

In a working directory number of text files are present with varying sizes (varying number of lines). For the following AWK script executed in the working directory, what is true for the output from the following options?

```
#!/usr/bin/awk -f

n < FNR {
    n = FNR
    nf = FILENAME
}
END {
    print FILENAME
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

(a) The file name that has the maximum number of lines among the files that are passed as arguments is printed

(b) The file name that has the minimum number of lines among the files that are passed as arguments is printed

(c) The file name that is passed as the first file argument is printed

(d) The file name that is passed as the last file argument is printed

### Answer

(d)

### Explanation

- Here we print `FILENAME` at the END. Which is always the last file name in the list of files passed as arguments. Everything else is irrelevant.

---
