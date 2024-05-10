# System Commands Jan-2023 Quiz-1 Set-1

## Question 1 (echo) [6]

```bash
ALPHA="A"
GAMMA="G"
echo "$ALPHA$BETA$GAMMA"
```

Select the output from the above script. [MCQ]

(a) `ALPHABETAGAMMA`

(b) `ABG`

(c) `ABETAG`

(d) `AG`

### Answer

(d)

### Explanation

The variable `BETA` is not defined in the script. So, the value of `BETA` will be empty. The output will be `AG`.

---

<div style="page-break-after: always;"></div>

## Question 2 (shell variables) [6]

```bash
a=12
b=56
c=$((a + b))
d=$((a + c))
```

What will be the value of `d` at the end of execution? [NAT]

### Answer

80

### Explanation

- `$(( ))` is used to perform arithmetic operations in shell scripts.
- The value of `c` will be `12 + 56 = 68`.
- The value of `d` will be `12 + 68 = 80`.

---

<div style="page-break-after: always;"></div>

``

## Question 3 (shell variables) [6]

Select the missing command. [MCQ]

```bash
$ touch a
$ echo 5 > a
$ ** MISSING COMMAND **
$ cat a b
5
apples
```

(a) touch b

(b) echo b

(c) echo apples > b

(d) echo apples

### Answer

(c)

### Explanation

- The given script creates a file `a` and writes `5` to it.
- After the missing command, the output of `cat a b` is `5\napples`.
- Either `apples` is appended to the file `a` and an empty `b` file already exists in the folder.
- Or `apples` is written to the file `b`.
- This is done by the command `echo apples > b`.

---

<div style="page-break-after: always;"></div>

``

## Question 4 (cron) [7]

When will the script `/home/rohit/premodel.sh` get executed. [MCQ]

```bash
5 0 * 8 * /home/rohit/premodel.sh
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

(a) Every day at 00:05 in August

(b) Every day at 05:00 in August

(c) Every day at 08:00 in May

(d) Every day at 08:05 in May

### Answer

(a)

---

<div style="page-break-after: always;"></div>

``

## Question 5 (grep) [7]

Select the regex to extract only the value of "id" from the below HTML file names as index.html [MCQ]

```html
<html>
  <head>
    <title>My Site</title>
  </head>
  <body>
    <div class="container" id="container-secondary">
      <button id="load-preview-button">Load</button>
      <button id="play-video-button">Play</button>
    </div>
  </body>
</html>
```

Hint: `-o` option in grep prints only the matched regular expression.

```bash
grep -o "button" index.html
button
button
button
button
button
button
```

(a) `grep 'id=".*"' -o  index.html | cut -d'"' -f2`

(b) `cat index.html | grep 'id=".*"' | cut -d'"' -f2`

(c) `grep 'id=".*"' -o  index.html`

(d) `grep 'id="."' -o  index.html | cut -d'"' -f1`

### Answer

(a)

### Explanation

- The Regex is correct and same in all options. `id=".*"` matches the `id` attribute in the HTML file. This will however match as much as possible, thus if there is any other attribute after the `id` (not present in the sample), then it will match that too, till the last `"` of the line.
- The `-o` option in grep prints only the matched regular expression. This ensures that the `id` is the first attribute of each line.
- The `cut -d'"' -f2` command extracts the value of the `id` attribute. Even if multiple attributes are present after the `id`, only the `id` is printed.

---

<div style="page-break-after: always;"></div>

## Question 6 (regex) [7]

Choose the regular expression that match with **ONLY** the five _digit_ palindrome. Basic Regular Expression (BRE) is used.

(a) `^.....$`

(b) `^.{5}$`

(c) `^\([0-9]\)\([0-9]\)[0-9]\2\1$`

(d) `^\(.\)\(.\).\2\1$`

### Answer

(c)

### Explanation

- (d) matches any 5 character palindrome, even characters other than digits.
- (a) matches any 5 character text, not palindrome.
- (b) uses `{}` which is not supported in BRE. Otherwise it is same as (a).
- (c) matches only 5 digit palindrome.
- `^\([0-9]\)\([0-9]\)[0-9]\2\1$`:
  - `^` matches the start of the line.
  - `\([0-9]\)` matches a digit and stores it in `\1`.
  - `\([0-9]\)` matches another digit and stores it in `\2`.
  - `[0-9]` matches a digit.
  - `\2` matches the second digit.
  - `\1` matches the first digit.
  - `$` matches the end of the line.

---

<div style="page-break-after: always;"></div>

``

## Question 7 (regex) [8]

```
(+91|0)?[6-9][[:digit:]]{9}
```

What will be the matched case(s) from the above regular expression. Assume that the regular expression is using Extended Regular Expression Engine (ERE). [MSQ]

(a) Any ten digit mobile number

(b) Any ten digit mobile number starting with 6, 7, 8 or 9

(c) Any ten digit mobile number starting with 6, 7, 8 or 9 with 0 as prefix

(d) Any ten digit mobile number starting with 6, 7, 8 or 9 with +91 as prefix

### Answer

(b), (c), (d)

### Explanation

- `(+91|0)?` matches either `+91` or `0` zero or one time.
- `[6-9]` matches any digit between 6 and 9.
- `[[:digit:]]` matches any digit.
- `{9}` matches the previous character 9 times.
- So, the regular expression matches any ten digit mobile number starting with 6, 7, 8 or 9. With or without `0` or `+91` as prefix.

---

<div style="page-break-after: always;"></div>

``

## Question 8 (file) [6]

How many files will be created at the end of execution by the below script? [NAT]

```bash
touch a b c d
touch a e d
echo $RANDOM >> b
```

### Answer

5

### Explanation

- Touching pre-existing files simply updates the timestamp of the file.
- The command `touch a b c d` creates 4 files.
- The command `touch a e d` creates 1 file (e).
- The command `echo $RANDOM >> b` appends a random number to the file `b`, but does not create a new file.
- So, at the end of the execution, there will be 5 files.

---

<div style="page-break-after: always;"></div>

## Question 9 (file permission) [8]

Choose the type of user(s) who can write to the file traceback.txt using the console output given below. [MSQ]

```
$ ls -l
-rw-rw-r--  1 abdul student     6977 Aug  8 19:14  traceback.txt
```

(a) abdul

(b) ankit who belong to the group "student"

(c) catherine who do not belong to the group "student"

(d) jina who belong to the group "abdul"

### Answer

(a), (b)

### Explanation

- The file `traceback.txt` has the following permissions: `-rw-rw-r--`.
- The first `rw-` indicates that the owner of the file can read and write to the file.
- The second `rw-` indicates that the group `student` can read and write to the file.
- The third `r--` indicates that others can only read the file.
- So, the owner `abdul` and the group `student` can write to the file.

---

<div style="page-break-after: always;"></div>

## Question 10 (redirection) [6]

Choose the line that modified the _contents inside the file_ `backup.sh`

```bash
cat backup.sh | cut -d " " -f 1
echo -n >> backup.sh
echo hello world > backup.sh
cp backup.sh backup.2023.sh
```

(a) `cat backup.sh | cut -d " " -f 1`

(b) `echo -n >> backup.sh`

(c) `echo hello world > backup.sh`

(d) `cp backup.sh backup.2023.sh`

### Answer

(c)

### Explanation

- The command `echo hello world > backup.sh` writes the string `hello world` to the file `backup.sh`. Its original contents are replaced by the new string.
- `echo -n >> backup.sh` does not do anything to the file since we provide no argument to `echo`, and we use the `-n` flag, it does not print anything, not even a `\n` character.
- `cat backup.sh | cut -d " " -f 1` prints the first word of the file `backup.sh`. It does not modify the file.
- `cp backup.sh backup.2023.sh` copies the file `backup.sh` to `backup.2023.sh`. It does not modify the file.

---

<div style="page-break-after: always;"></div>

## Question 11 (link) [6]

A college student uses a pen drive to store files. The pen drive is always mounted on his system at `/mount` as a separate file system. His pen drive contains lots of files and directories. He wants to create a link to the directory `/mount/bio/phase-2/project-312` inside his home directory. What link can the student use?

(a) soft link

(b) hard link

(c) either soft link or hard link

(d) links will not work for this requirement

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

``

## Question 12 (conditional &&) [5]

Enter the number `A` that will print the output "SUCCESS"

```bash
[ "$A" -gt 10 ] && [ "$A" -lt 15 ] && [ "$(( A % 3 ))" -eq 0 ] && echo SUCCESS
```

### Answer

12

### Explanation

- The script checks if the number `A` is greater than 10, less than 15, and divisible by 3.
- Only the number `12` satisfies all the conditions.

---

<div style="page-break-after: always;"></div>

``

## Question 13 (if-else) [7]

Select the standard input that prints "MATCH" as output.

```bash
read str
pat='^@.*#'

if [[ "$str" =~ $pat ]]; then
    echo MATCH
else
    echo NOT MATCH
fi
```

(a) !@#$

(b) arch

(c) @#

(d) #@

### Answer

(c)

### Explanation

- The script reads a string from the standard input.
- The regular expression `^@.*#` matches any string that starts with `@` and ends with `#`. It can have zero or more characters between `@` and `#`.
- The string `@#` matches the regular expression and prints "MATCH".

---

<div style="page-break-after: always;"></div>

## Question 14 (for) [9]

The files inside the directory is given below.

```
-rw-rw-r--  1 meena meena        2 Nov 30 09:53  docker_notes.txt
-rwxrwxr-x  1 meena meena     2901 Nov 18 13:47  emacs_notes.txt
drwxrwxr-x 11 meena meena     4096 Jul 27 17:24  vim
-rw-rw-r--  1 meena meena     1709 Nov 18 13:47  vim_notes.txt
drw-rw-r--  1 meena meena     4096 Nov 18 13:47  x
drw-rw-r--  1 meena meena     4096 Nov 18 13:47  y
drw-rw-r--  1 meena meena     4096 Nov 18 13:47  z
```

Select the file(s) that will be printed in the output. [MSQ]

```bash
for file in *; do
    # -f returns exit status 0 when the operand is a file
    [ -f $file ] && echo $file
done
```

(a) docker_notes.txt

(b) emacs_notes.txt

(c) vim_notes.txt

(d) x

(e) y

(f) z

### Answer

(a), (b), (c)

### Explanation

- The script iterates over all the files in the directory.
- The condition `[ -f $file ]` checks if the file is a regular file.
- The files `docker_notes.txt`, `emacs_notes.txt`, and `vim_notes.txt` are regular files and will be printed in the output.

---

<div style="page-break-after: always;"></div>

## Question 15 (while) [6]

```bash
while read -r line; do
    echo $line
done < pattern.txt
```

Select the equivalent command for the above script.

(a) `cat pattern.txt`

(b) `cat pattern.txt | cat > pattern.txt`

(c) `cat > pattern.txt`

(d) `grep . pattern.txt`

### Answer

(a)

### Explanation

- The script reads each line from the file `pattern.txt` and prints it.
- The command `cat pattern.txt` prints the contents of the file `pattern.txt`. This is same as the script.
- (b) and (c) overwrite the file `pattern.txt` with an empty file. Even though (b) looks like it is idempotent, it is not, as the `cat` command will read the file and then truncate it, before writing to it, making it an empty file.
- (d) prints all _non-empty_ lines from the file `pattern.txt`, whereas the script prints all lines.
- The `-r` is required, without which the output will differ from `cat` if the file contains backslashes.
