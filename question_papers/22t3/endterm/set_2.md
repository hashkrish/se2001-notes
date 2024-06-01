# System Commands, End Term Set-2

## Question 1 (echo) [-e removed in second echo] [6]

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
```

What will be the output of the below script?

```bash
echo -n '* ' # There is a space after *
echo -n '*\n*\n* '  # There is a space after the last *
echo -n '* ' # There is a space after *
```

(a)

```
*
* * *
*
```

(b)

```
* * * * *
```

(c)

```
* *\n*\n* *
```

(d)

```
* *
*
* *
```

### Answer

(c)

### Explanation

- Without `-e` flag in `echo`, the `\n` will be treated as a normal character and not as a newline character.

---

<div style="page-break-after: always;"></div>

## Question 2 (link) [Same as set-1] [6]

A college student uses a pen drive to store files. The pen drive is always mounted on his system at `/mount` as a separate file system. His pen drive contains lots of files and directories. He wants to create a link to the directory `/mount/bio/phase-2/project-312` inside his home directory. What link can the student use?

(a) soft link

(b) hard link

(c) either soft link or hard link

(d) links will not work this requirement

### Answer

(a)

### Explanation

- A soft link is a pointer to the file or directory. It is a symbolic link to the file or directory.
- A hard link is a pointer to the inode of the file. It is a direct link to the file.
- Hard link cannot be created for directories.
- Hard links cannot be created across file systems.
- Soft link will work for this requirement as it uses the path to the file or directory.

---

<div style="page-break-after: always;"></div>

## Question 3 (shell variable) [Same as set-1] [7]

Complete the script to rename all the files in the current directory to include the time of creation in the name itself as given in the example below. Assume all the files have creation times.
Example: The filename `myfile` should be renamed to `myfile_2022-10-20T14:52:58`

```bash
for file in *; do
    creation_time=$(stat -c '%w' $file)
    # Sample output from `stat -c %w`
    # "2022-10-20 14:52:58.738413991 +0530"
    # ***********************
    # * COMPLETE THE SCRIPT *
    # ***********************
done
```

(a)

```bash
mv $file ${creation_time/ /T}
```

(b)

```bash
mv $file $creation_time
```

(c)

```bash
temp="${creation_time%%.*}"
temp="${temp/ /T}"
mv "$file" "${file}_$temp"
```

(d)

```bash
temp="${creation_time%%.*}"
temp="${temp/ /T}"
mv "$file" "$temp"
```

### Answer

(c)

### Explanation

- `${creation_time%%.*}` removes the fractional part of the time.
- `${temp/ /T}` replaces the space with `T` to make the time format ISO 8601 compliant.
- `${file}_$temp` renames the file with the time of creation.

---

<div style="page-break-after: always;"></div>

## Question 4 (cron) [9pm & 10pm swapped] [7]

Which of the following command will run the script `/home/bill/autoscript/backup.sh` at 9:00 pm every day-of-week from Monday through Friday in every month from January through June and at 10:00 pm every day-of-week from Monday through Friday in every month from July through December. [MCQ]

**Hint**: Below is the description of the sequence in the cron job command.

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

(a)

```
0 22 * 1-6 1-5 /home/bill/autoscript/backup.sh
0 21 * 7-12 1-5 /home/bill/autoscript/backup.sh
```

(b)

```
0 10 * 1-6 1-5 /home/bill/autoscript/backup.sh
0 9 * 7-12 1-5 /home/bill/autoscript/backup.sh
```

(c)

```
0 9 * 1-5 1-6 /home/bill/autoscript/backup.sh
0 10 * 1-5 7-12 /home/bill/autoscript/backup.sh
```

(d)

```
0 21 * 1-6 1-5 /home/bill/autoscript/backup.sh
0 22 * 7-12 1-5 /home/bill/autoscript/backup.sh
```

### Answer

(d)

### Explanation

- Cron uses 24-hour format for time. So 10pm is 22 hours, and 9pm is 21 hours.

---

<div style="page-break-after: always;"></div>

## Question 5 (vi/emacs) [Same as set-1] [6]

What does the key sequence `G$vgg0yGp` do in vi editor?
Hint:

- `v` to enter into visual mode
- `p` to paste next
- `y` to copy selected

or

What does the key sequence `<M->><C-SPACE><M-<><C-w><C-y>` do in Emacs?
Hint:

- `<C-SPACE>` to set a mark
- `<C-W>` copy text from mark to current cursor position
- `<C-y>` to paste text

(a) Cut the paragraph and paste at the end of the document.

(b) Copy the paragraph and paste at the end of the document.

(c) Cut and paste the entire document (finally one copy of initial document)

(d) Copy and paste the entire document (finally two copies of initial document)

### Answer

(d)

### Explanation

- `G` moves the cursor to the last line.
- `$` moves the cursor to the end of the line.
- `v` enters visual mode.
- `gg` moves the cursor to the first line.
- `0` moves the cursor to the beginning of the line. Entire document is selected.
- `y` copies the selected text (entire document).
- `G` moves the cursor to the last line (first character).
- `p` pastes the copied text (entire document).
- The pasted document is pasted after the first character of last line, not at the end of the document.

---

<div style="page-break-after: always;"></div>

## Question 6 (shell script) [MSQ] [Same as set-1] [8]

A student named Varsha has a lot of configuration files in her Linux system. Somehow she lost all the data but fortunately she backed up her configuration files in a specific way such that the back up directory named `backup_config` contains all the configuration files along with one file named `files`.
The file `files` contains the absolute paths to the config files, one path per line for each config file. Choose the script that restores all the files to their location. Assume the backup directory contains only files not directories.
The current working directory where the scripts are run is `backup_config` directory.

(a)

```bash
for file in `cat files`; do
    cp "${file/*/}" "${file%:}"
done
```

(b)

```bash
while read file; do
    cp "./${file##*/}" "$file"
done < files
```

(c)

```bash
while read file; do
    cp "./${file//*\//}" "$file"
done < files
```

(d)

```bash
for file in `cat files`; do
    cp "$file" "./${file##*/}"
done
```

### Answer

(b), (c)

### Explanation

- `${file/*/}` removes everything from the variable `file`, this is not the correct way to get the file name from the path.
- `./${file##*/}` gets the file name from the path by removing everything from the start till the last `/`.
- `cp "./${file##*/}" "$file"` copies the file in the current directory with the file name to its original location.
- `${file//*\//}` removes everything from the variable `file` till the last `/`.
- `cp "./${file//*\//}" "$file"` copies the file in the current directory with the file name to its original location.

---

<div style="page-break-after: always;"></div>

## Question 7 (shell script) [NAT] [second if will execute f is always 1] [6]

How many lines will be printed after executing the below script?

```bash
for i in {1..10}; do
    f=1
    if ((i%3==0)); then
        f=0
        continue
    fi
    if [[ $f -eq 1 &&  $i -gt 5 ]]; then
        continue
    fi
    echo '***'
done
```

### Answer (exact)

4

### Explanation

- The variable `f=1` is set for every iteration.
- The assignment `f=0` is done only when `i` is divisible by 3, but followed by `continue` statement, thus the value of `f` again resets to `1`.
- Thus, the first part of the second `if` condition will always be true, and the second part will be true only when `i` is greater than 5.
- Thus, the first part of the second `if` can be dropped from the script, as it is redundant.
- The second `if` will be true for all values of `i` greater than 5.
- Thus for values which are greater than 5, or multiples of 3 the loop will not print the pattern.
- Only numbers lesser than or equal to 5 and not divisible by 3 (1,2,4,5) will print the pattern.

---

<div style="page-break-after: always;"></div>

## Question 8 (shell script) [redirected to stderr] [6]

Select the correct statement(s) based on the below script. Assume that `file1` is not empty.
Hint: `tee` command takes the stdin and prints it to the terminal and also writes to the file given as argument.

```bash
while read line; do
    echo $line 1>&2
done < file1 > file2 | tee file3
```

(a) **file2** will **NOT** be empty at the end of execution

(b) **file3** will **NOT** be empty at the end of execution

(c) The contents of **file1** will be displayed in the terminal

(d) **file3** contains the contents of **file1**

### Answer

(c)

### Explanation

- The script reads the contents of `file1` and prints it to the stderr.
- The stdout (which is empty) is redirected to `file2`, so `file2` will be empty.
- The empty stdout is piped to `tee` which writes the empty content to `file3`.
- The un-redirected stderr will be displayed in the terminal.
- We can redirect `stderr` to tee using `|&` instead of `|`.

---

<div style="page-break-after: always;"></div>

## Question 9 (grep/regex) [Repeated consecutively] [6]

Choose the regular expression to match with a string that contains at least a character repeated three times consecutively. Assume the regular expression is using Extended Regular Expression Engine (ERE).

(a) `...`

(b) `.*.*.*`

(c) `(.)\1\1`

(d) `(.).*\1.*\1`

(e) `^(.).*\1.*\1$`

### Answer

(c)

### Explanation

- `(.)` captures any character.
- `\1` matches the same character as captured by the first group.
- `(.)\1\1` matches any character repeated three times consecutively.
- (d) will match any character repeated thrice but not consecutively.

---

<div style="page-break-after: always;"></div>

## Question 10 (grep/regex) [Same as set-1] [8]

Choose the matching line(s) for any of the following regular expressions. Assume that the regular expression is using Extended Regular Expression Engine (ERE). [MSQ]

```
^$
^([[:digit:]]){3,}$
^[^.]+$
```

(a) An empty line

(b) A line having a number with only one decimal place (Ex: 10.1)

(c) A line without a space

(d) A line with three spaces

(e) A line starts with two repeated numbers

(f) A line containing four repeated numbers

(g) A line without a dot

(h) A line with one or more dot characters

### Answer

(a), (f), (g)

---

<div style="page-break-after: always;"></div>

## Question 11 (sed) [6]

What does the given sed script do? `N` command in sed appends the next line to the pattern space(current line) with a newline character `\n` being the separator.

```sed
N
N
N
s/\n//g
```

(a) Merge every two consecutive lines to a single line

(b) Merge every three consecutive lines to a single line

(c) Merge every four consecutive lines to a single line

(d) The input remains unaltered

### Answer

(c)

### Explanation

- Each `N` reads the next line into pattern space, thus 3 `N` reads 3 next lines into pattern space, having a total of 4 lines in the pattern space.
- The `s/\n//g` command removes all the newline characters from the pattern space, thus merging all the 4 lines into a single line.

---

<div style="page-break-after: always;"></div>

## Question 12 (sed) [NAT] [second command does nothing] [6]

The input file to the below sed script named `data` contains 100 characters, among them 47 are numbers `[0-9]`. How many characters will be in the output after executing the below script? Assume that sed is using Extended Regular Expression Engine (ERE). [MSQ]

```sed
s/([0-9])/\1\1/g
s/([0-9])\1/\1\1/g
```

### Answer

147

### Explanation

- The first `s/([0-9])/\1\1/g` command replaces every number with the number repeated twice.
- The second command is an identity command, as it is trying to replace the number repeated twice with the same number repeated twice, it does nothing.
- The file has 47 numbers, and each number is replaced with the number repeated twice, thus the output will have $47 \times 2=94$ numbers.
- The output will have 100+47=147 characters.

---

<div style="page-break-after: always;"></div>

## Question 13 (sed) [Same as set-1] [8]

Consider a file named `data` containing some text located in the current working directory. Select the correct statement(s) for the output printed by the below script.

```bash
count=0
while read line; do
    # -o in grep will print only the matches not the entire line,
    # and prints one match per line
    for i in `echo "$line" | grep -o '~ITER~'`; do
        ((count++))
        line="${line/~ITER~/$count}" # ~ITER~ is replaced with $count
    done
    echo "$line"
done < data
```

(a) Only the first occurrence of `~ITER~` in every line of the file `data` is replaced

(b) The value replaced with `~ITER~` is constant across the lines

(c) The value of `count` at the end of execution and total number of occurrences of `~ITER~` in the file `data` are equal

(d) The same result can be achieved within file `data` with the following script

```bash
# -q in grep gives only the exit status, not output
c=0; while $(grep -q "~ITER~"); do
    ((c++)); sed "s/~ITER~/$c/"
done
```

### Answer

(c)

### Explanation

- The script reads the file line by line.
- For every occurrence of `~ITER~` in the line, it replaces it with the value of `count`.
- The value of `count` is incremented for every occurrence of `~ITER~`.
- The value of `count` at the end of execution and total number of occurrences of `~ITER~` in the file `data` are equal.
- The later occurrences in a line are also replaced as the for loop iterates over all the occurrences of `~ITER~` in the line.

---

<div style="page-break-after: always;"></div>

## Question 14 (awk) [twice to thrice] [6]

What will the output from the below command represent?

```bash
awk '
{
    arr[$0]++
}
arr[$0] == 3 {
    print
}
' data
```

(a) The lines that are distinct

(b) The lines that are repeated exactly thrice

(c) The lines that are repeated thrice or more

(d) The lines that are repeated more than thrice

### Answer

(c)

### Explanation

- The script reads the file line by line.
- It maintains a count of each line in the array `arr`.
- If the count of the line is 3, it prints the line.
- Lines present more than thrice will also have its count as 3 at some point when the line is read for the third time.
- The lines that are repeated thrice or more are printed.

---

<div style="page-break-after: always;"></div>

## Question 15 (awk) [NAT] [shuffling the data points] [8]

What will be the output from the below script?

```bash
awk '
{
    x[NR]=$1; y[NR]=$2
    x_+=$1;   y_+=$2
}
END {
    x_=x_/NR; y_=y_/NR
    denx_2=0; deny_2=0
    for (i in x) {
        num+=(x[i]-x_)*(y[i]-y_)
        denx_2+=(x[i]-x_)^2
        deny_2+=(y[i]-y_)^2
    }
    print num/(denx_2^0.5 * deny_2^0.5)
}
' << EOF
5 6
3 4
1 2
7 8
EOF
```

### Answer

1

### Explanation

- The script is finding the Pearson correlation coefficient between two variables.
- The Pearson correlation coefficient is a measure of the linear relationship between two variables.
- The given data is clearly linearly related($y=x+1$), so the Pearson correlation coefficient will be 1.

---
