# System Commands September 2023 OPPE 1 Set 1

Section 1: 3 problems \* 15 marks
Section 2: 3 problems \* 20 marks

Total: 6 problems, 105 marks

---

## Section 1 - Problem 1

Error Handling requires one to understand exit status implementation. Write a function which will echo "Success" if there are 3 arguments passed to it and print all the three arguments. The exit status of any more or less arguments passed to the function should end up in exit status of 1.

Hint: Use return keyword

### Solution

```bash
#!/bin/bash
if [ $# -eq 3 ]; then
    echo Success "$1" "$2" "$3"
else
    exit 1
fi
```

---

## Section 1 - Problem 2

Sanjay is a professional photographer who capture photos of items for various clients. The photos database has thousands of photos collected each year. The photographs are stored in jpg format using YYYYMMDD_HHMMSS.jpg naming convention. For his backup purpose he wants to organise his data by moving the photos to a new directory created using monthYear (Ex: Jan2021) format (thus 12 directory for each year). Write a shell script which will create folders based on the image name and creates and moves it to the respective month directory.

**Hint:**

```
$ date --help
Usage: date [OPTION]... [+FORMAT]
  or:  date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
Display date and time in the given FORMAT.
With -s, or with [MMDDhhmm[[CC]YY][.ss]], set the date and time.

Mandatory arguments to long options are mandatory for short options too.
  -d, --date=STRING          display time described by STRING, not 'now'
...

FORMAT controls the output.  Interpreted sequences are:

  %%   a literal %
  %a   locale's abbreviated weekday name (e.g., Sun)
  %A   locale's full weekday name (e.g., Sunday)
  %b   locale's abbreviated month name (e.g., Jan)
  %B   locale's full month name (e.g., January)
  %c   locale's date and time (e.g., Thu Mar  3 23:05:25 2005)
  %C   century; like %Y, except omit last two digits (e.g., 20)
  %d   day of month (e.g., 01)
  %D   date; same as %m/%d/%y
  %e   day of month, space padded; same as %_d
  %F   full date; like %+4Y-%m-%d
  %g   last two digits of year of ISO week number (see %G)
  %G   year of ISO week number (see %V); normally useful only with %V
  %h   same as %b
  %H   hour (00..23)
  %I   hour (01..12)
  %j   day of year (001..366)
  %k   hour, space padded ( 0..23); same as %_H
  %l   hour, space padded ( 1..12); same as %_I
  %m   month (01..12)
  %M   minute (00..59)
  %n   a newline
  %N   nanoseconds (000000000..999999999)
  %p   locale's equivalent of either AM or PM; blank if not known
  %P   like %p, but lower case
  %q   quarter of year (1..4)
  %r   locale's 12-hour clock time (e.g., 11:11:04 PM)
  %R   24-hour hour and minute; same as %H:%M
  %s   seconds since the Epoch (1970-01-01 00:00 UTC)
  %S   second (00..60)
  %t   a tab
  %T   time; same as %H:%M:%S
  %u   day of week (1..7); 1 is Monday
  %U   week number of year, with Sunday as first day of week (00..53)
  %V   ISO week number, with Monday as first day of week (01..53)
  %w   day of week (0..6); 0 is Sunday
  %W   week number of year, with Monday as first day of week (00..53)
  %x   locale's date representation (e.g., 12/31/99)
  %X   locale's time representation (e.g., 23:13:48)
  %y   last two digits of year (00..99)
  %Y   year
  %z   +hhmm numeric time zone (e.g., -0400)
  %:z  +hh:mm numeric time zone (e.g., -04:00)
  %::z  +hh:mm:ss numeric time zone (e.g., -04:00:00)
  %:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)
  %Z   alphabetic time zone abbreviation (e.g., EDT)

...
Examples:
Convert seconds since the Epoch (1970-01-01 UTC) to a date
  $ date --date='@2147483647'

Show the time on the west coast of the US (use tzselect(1) to find TZ)
  $ TZ='America/Los_Angeles' date

Show the local time for 9AM next Friday on the west coast of the US
  $ date --date='TZ="America/Los_Angeles" 09:00 next Fri'

...
```

### Solution

```bash
#!/bin/bash

for picture in $(ls *.jpg)
do
        dateinfo=${picture%%_*}
        newdir=`date -d $dateinfo +%b%Y`
        mkdir -p $newdir
        mv $picture $newdir
done
```

### Explanation

- `for picture in $(ls *.jpg)`: This will loop through all the jpg files in the current directory.
- `dateinfo=${picture%%_*}`: This will extract the date part from the file name.
  - `${picture%%_*}`: This will remove the part after the first `_` in the file name.
- `newdir=`date -d $dateinfo +%b%Y``: This will convert the date to the format `MonYYYY`.
- `mkdir -p $newdir`: This will create the directory if it does not exist, else not give any error.
- `mv $picture $newdir`: This will move the picture to the new directory.

---

## Section 1 - Problem 3

Write a bash script which works on output of `ls -li` to produce an output which will have unique list of files which are not softlinks and has only one file for multiple hardlinks present.

Note: The final output should be sorted by ascending order of inode number.

Hint: Output of the `ls -li` is given in a file sample.txt.
** `sample.txt` File **

```bash
   12 -rwxr-xr-x 1 root root 1113504 Apr 18  2022 bash
   13 -rwxr-xr-x 1 root root  716464 Mar 13  2018 btrfs
   14 -rwxr-xr-x 1 root root  375952 Mar 13  2018 btrfs-debug-tree
   15 -rwxr-xr-x 1 root root  371856 Mar 13  2018 btrfs-find-root
   16 -rwxr-xr-x 1 root root  396432 Mar 13  2018 btrfs-image
   17 -rwxr-xr-x 1 root root  375952 Mar 13  2018 btrfs-map-logical
   18 -rwxr-xr-x 1 root root  371856 Mar 13  2018 btrfs-select-super
   19 -rwxr-xr-x 1 root root  371856 Mar 13  2018 btrfs-zero-log
   20 lrwxrwxrwx 1 root root       5 Mar 13  2018 btrfsck -> btrfs
   21 -rwxr-xr-x 1 root root  375952 Mar 13  2018 btrfstune
   22 -rwxr-xr-x 3 root root   34888 Jul  4  2019 bunzip2
   23 -rwxr-xr-x 1 root root 2062296 Nov 25  2021 busybox
   22 -rwxr-xr-x 3 root root   34888 Jul  4  2019 bzcat
   24 lrwxrwxrwx 1 root root       6 Jul  4  2019 bzcmp -> bzdiff
   25 -rwxr-xr-x 1 root root    2140 Jul  4  2019 bzdiff
   26 lrwxrwxrwx 1 root root       6 Jul  4  2019 bzegrep -> bzgrep
   27 -rwxr-xr-x 1 root root    4877 Jul  4  2019 bzexe
   28 lrwxrwxrwx 1 root root       6 Jul  4  2019 bzfgrep -> bzgrep
   29 -rwxr-xr-x 1 root root    3642 Jul  4  2019 bzgrep
```

### Solution

```bash
cat sample.txt|sort -u -k1,1|grep -v "\->"
```

### Explanation

- `cat sample.txt`: This will print the contents of the file `sample.txt`.
- `sort -u -k1,1`: This will sort the output by the first column and remove duplicates.
  - `sort -k1` will sort the output by the first column and the columns after that. Whereas `sort -k1,1` will sort the output by the first column only.
  - `sort -u` will remove duplicates.
    - This uses only the first column to remove duplicates, thus removing the duplicates based on the inode number only.
- `grep -v "\->"`: This will remove the lines which have `->` in them (softlinks).

Another solution:

```bash
sort | grep -v 'lrwx' | uniq -w 10
```

## Section 2 - Problem 1 (extract rectangle)

Write a script that will remove the outer rectangle and grow the inner rectangle to the exact size of outer rectangle and the inner rectangle region should be replaced with '0' (zero) including the boundary line.

Note:

- The outer rectangle is always made up of asterisks '\*'
- The inner rectangle is always made up of lowercase X 'x'
- The input should be taken from the standard input

**Sample Input**

```
********************************
*                              *
*  xxxxxxxxxxxxxxxxxxxxxxxxxx  *
*  x                        x  *
*  x                        x  *
*  xxxxxxxxxxxxxxxxxxxxxxxxxx  *
*                              *
********************************
```

**Sample Output**

```
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
x                              x
x  00000000000000000000000000  x
x  00000000000000000000000000  x
x  00000000000000000000000000  x
x  00000000000000000000000000  x
x                              x
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### Solution

```bash
while read -r line; do
    line=${line//x/0}

    # n = width of inner rectangle + 1
    # +1 is due to the new line character

    n=$(echo "$line" | grep -oE '0 +0' | wc -m)
    for ((i = 0; i < (n-3); i++)); do
        line=${line/0 /00}
    done
    line=${line//\*/x}
    echo "$line"
done
```

### Explanation

The question asks us to replace the `x` with `0` and replace the `*` with `x` and fill the inner rectangle with `0`.

- `while read -r line; do`: This will read the input line by line.
- `line=${line//x/0}`: This will replace all the `x` with `0`.
- `n=$(echo "$line" | grep -oE '0 +0' | wc -m)`: This will count the number of spaces between `0` and `0` in the line.
  - `grep -oE '0 +0'`: This will match `0` followed by one or more spaces followed by `0`.
  - `wc -m`: This will count the number of characters.
- `for ((i = 0; i < (n-3); i++)); do`: This will loop through the number of spaces between `0` and `0`.
  - `line=${line/0 /00}`: This will replace `0` followed by a space with `00`.
  - This will fill the inner spaces with `0`.
- `line=${line//\*/x}`: This will replace all the `*` with `x`.
- `echo "$line"`: This will print the line.

---

## Section 2 - Problem 2 (pipe)

A text file usually contains puctuations, upper case letters. Write a shell script/command which will remove punctuations, convert uppercase letters to lower case and finally convert the space character to newline character in that order. Finally use concepts of sort and uniq commands to print top number 5 through 10 most frequent words with its count. The content are in file called `text.txt` in current working directory.

Hint:

```bash
$ tr --help
Usage: tr [OPTION]... SET1 [SET2]
Translate, squeeze, and/or delete characters from standard input,
writing to standard output.

  -c, -C, --complement    use the complement of SET1
  -d, --delete            delete characters in SET1, do not translate
  -s, --squeeze-repeats   replace each sequence of a repeated character
                            that is listed in the last specified SET,
                            with a single occurrence of that character
  -t, --truncate-set1     first truncate SET1 to length of SET2
      --help     display this help and exit
      --version  output version information and exit

SETs are specified as strings of characters.  Most represent themselves.
Interpreted sequences are:

...
  [:alnum:]       all letters and digits  [:alpha:]       all letters
  [:blank:]       all horizontal whitespace
  [:cntrl:]       all control characters
  [:digit:]       all digits
  [:graph:]       all printable characters, not including space
  [:lower:]       all lower case letters
  [:print:]       all printable characters, including space
  [:punct:]       all punctuation characters
  [:space:]       all horizontal or vertical whitespace
  [:upper:]       all upper case letters
  [:xdigit:]      all hexadecimal digits
  [=CHAR=]        all characters which are equivalent to CHAR
...

$ sort --help
Usage: sort [OPTION]... [FILE]...
  or:  sort [OPTION]... --files0-from=F
Write sorted concatenation of all FILE(s) to standard output.

With no FILE, or when FILE is -, read standard input.

Mandatory arguments to long options are mandatory for short options too.
Ordering options:

  -b, --ignore-leading-blanks  ignore leading blanks
  -d, --dictionary-order      consider only blanks and alphanumeric characters
  -f, --ignore-case           fold lower case to upper case characters
  -g, --general-numeric-sort  compare according to general numerical value
  -i, --ignore-nonprinting    consider only printable characters
  -M, --month-sort            compare (unknown) < 'JAN' < ... < 'DEC'
  -h, --human-numeric-sort    compare human readable numbers (e.g., 2K 1G)
  -n, --numeric-sort          compare according to string numerical value
  -R, --random-sort           shuffle, but group identical keys.  See shuf(1)
      --random-source=FILE    get random bytes from FILE
  -r, --reverse               reverse the result of comparisons
      --sort=WORD             sort according to WORD:
                                general-numeric -g, human-numeric -h, month -M,
                                numeric -n, random -R, version -V
  -V, --version-sort          natural sort of (version) numbers within text

...

$ uniq --help
Usage: uniq [OPTION]... [INPUT [OUTPUT]]
Filter adjacent matching lines from INPUT (or standard input),
writing to OUTPUT (or standard output).

With no options, matching lines are merged to the first occurrence.

Mandatory arguments to long options are mandatory for short options too.
  -c, --count           prefix lines by the number of occurrences
  -d, --repeated        only print duplicate lines, one for each group
  -D                    print all duplicate lines
      --all-repeated[=METHOD]  like -D, but allow separating groups
                                 with an empty line;
                                 METHOD={none(default),prepend,separate}
  -f, --skip-fields=N   avoid comparing the first N fields
      --group[=METHOD]  show all items, separating groups with an empty line;
                          METHOD={separate(default),prepend,append,both}
  -i, --ignore-case     ignore differences in case when comparing
  -s, --skip-chars=N    avoid comparing the first N characters
  -u, --unique          only print unique lines
  -z, --zero-terminated     line delimiter is NUL, not newline
  -w, --check-chars=N   compare no more than N characters in lines
      --help     display this help and exit
      --version  output version information and exit

A field is a run of blanks (usually spaces and/or TABs), then non-blank
characters.  Fields are skipped before chars.

Note: 'uniq' does not detect repeated lines unless they are adjacent.
You may want to sort the input first, or use 'sort -u' without 'uniq'.
...
```

### Solution

```bash
cat text.txt | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '\n' | sort | uniq -c | sort -rn | head -10 | tail -5 | while read -r line; do
        echo ${line##* }
    done
```

or

```bash
cat text.txt | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '\n' | sort | uniq -c | sort -rn | head -10 | tail -5 | tr -s ' ' | cut -d ' ' -f 3
```

### Explanation

- `cat text.txt`: This will print the contents of the file `text.txt`.
- `tr '[:upper:]' '[:lower:]'`: This will convert the uppercase letters to lowercase.
- `tr -d '[:punct:]'`: This will remove the punctuations.
- `tr ' ' '\n'`: This will convert the space character to newline character.
- `sort`: This will sort the output.
- `uniq -c`: This will count the number of occurrences of each word.
- `sort -rn`: This will sort the output in reverse order of count.
- `head -10`: This will print the top 10 words.
- `tail -5`: This will print the last 5 words of those (5-10).
- `while read -r line; do`: This will read the output line by line.
- `echo ${line##* }`: This will print the last word of the line.
- `tr -s ' ' | cut -d ' ' -f 3`: This will remove the extra spaces and print the third word.

---

## Section 2 - Problem 3

Write a grep command which will extract the values of color and name of color from the following text from file `data.txt`.

```html
<span class="token string">"aliceblue"</span
><span class="token operator">:</span> <span class="token punctuation">[</span
><span class="token number">240</span><span class="token punctuation">,</span>
<span class="token number">248</span><span class="token punctuation">,</span>
<span class="token number">255</span><span class="token punctuation">,</span>
<span class="token number">1</span><span class="token punctuation">]</span>
```

### Solution

```bash
grep -oE '"[a-z]+"|:|\[|[0-9]+|,|\]' | tr -d '\n' | grep -oE '"[a-z]+":\[[0-9]+,[0-9]+,[0-9]+,[0-9]+\]'
```

### Explanation

- `grep -oE '"[a-z]+"|:|\[|[0-9]+|,|\]'`: This will extract the values of color and name of color.
- The values will be printed in separate lines due to the `-o` option.
- `tr -d '\n'`: This will remove the new line characters.
  - It will also put multiple such outputs in a single line.
- The second grep without the `|` with -o will separate each output into separate lines.
