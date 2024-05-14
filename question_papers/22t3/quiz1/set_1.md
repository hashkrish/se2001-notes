# System Command Quiz-1 Set-1

## Question 1 [6]

Choose the command to print the below text in the terminal. [MSQ]

```
Welcome to the Summer Camp
Pichavaram
```

(a)

```
echo 'Welcome to the Summer Camp
Pichavaram'
```

(b)

```
echo 'Welcome to the Summer Camp\nPichavaram'
```

(c)

```
echo 'Welcome to the Summer Camp'
echo 'Pichavaram'
```

(d)

```
echo 'Welcome to the Summer Camp' echo 'Pichavaram'
```

### Answer

(a), (c)

---

## Question 2 [6]

Select the output from the below script [MCQ]
Note: `rev` command will reverse

```bash
A="HA"
echo "${A}NN$(echo $A | rev)"
```

(a) HANNA

(b) HANNHA

(c) HAHA

(d) HANN

(e) NN

(f) HANNAH

(g) \${A}NN\$(echo \$A | rev)

### Answer

(f)

### Explanation

- `echo $A` → `HA`
- `echo $A | rev` → `AH`
- `${A}NN$(echo $A | rev)` → `HA` + `NN` + `AH` → `HANNAH`

---

Common data for Question 3 to 5
**Case 1**

```bash
echo Hello
read line
echo World
```

**Case 2**

```bash
echo Hello
read line &
echo World
```

## Question 3 [5]

When will the text `World` be printed if no input is given to stdin in case 1? [MCQ]

(a) Immediately

(b) After a minute

(c) The text `World` will not be printed

(d) Not enough information

### Answer

(c)

### Explanation

- The `read` is run in foreground and will busy block the script until the input is given.

---

## Question 4 [5]

When will the text `World` be printed if no input is given to stdin in case 2? [MCQ]

(a) Immediately

(b) After a minute

(c) The text `World` will not be printed

(d) Not enough information

### Answer

(a)

### Explanation

- The `read` is run in background and will not block the script. The `echo World` will be printed immediately.

---

## Question 5 [5]

Select the correct statement with respect to Case 2? [MSQ]

(a) The command `read line` will run in background

(b) The commands `read line` and `echo World` both will run in background

(c) The processes sent to background will be killed

(d) The `fg` command will move back the execution of `read line` to foreground

### Answer

(a), (d)

---

## Question 6 [7]

Select the output from the below script. [MCQ]

```bash
var="Water"
echo "-var-"
echo "-${var2:=Air}-"
echo "-${var2:-Fire}-"
echo "-${var2:+Earth}-"
```

(a)

```
-Water-
-Air-
-Fire-
-Earth-
```

(b)

```
-var-
-Air-
-Fire-
-Earth-
```

(c)

```
-var-
-Air-
-Air-
-Earth-
```

(d)

```
--
-Air-
-Air-
-Air-
```

### Answer

(c)

### Explanation

- `var` is not used in the script, so its initialized value does not affect the output.
- `var2:=Air` will set the value of the variable `var2` to be `Air` if it is unset. It then returns the value of `var2`.
- `var2:-Fire` will return `Air` if `var2` is unset, else return the value of `var2`.
- `var2:+Earth` will return `Earth` if `var2` is set, else return the value of `var2` (empty string).
- `var2` is not set initially, so the first command sets it to `Air` and prints it.
- `var2` is set now, so it simply returns its value `Air` again and prints it.
- `var2` is set, so it returns `Earth` and prints it. (But the value of `var2` remains as Air)

---

## Question 7 [7]

In an organization a particular software requires a key file. The key file will change at 6 am and 6 pm. The command `generate-key` will generate the key file with either of the option `--day` or `--night` with respect to the time at which the command is executed.
Choose the command that does the above job. [MCQ]

Hint:
The output of date command with and without the option are shown below.

```bash
$ date +%H:%M
15:06

$ date
Monday 19 September 2022 03:06:44 PM IST
```

(a)

```bash
[[ $(date +%H:%M) > 06:00 && $(date +%H:%M) < 18:00 ]] &&
	generate-key --day ||
	generate-key --night
```

(b)

```bash
[[ $(date) > 06:00 || $(date) < 18:00 ]] &&
	generate-key --day ||
	generate-key --night
```

(c)

```bash
[[ $(date +%H:%M) > 06:00 && $(date +%H:%M) < 18:00 ]] &&
	generate-key --night ||
	generate-key --day
```

(d)

```bash
[[ $(date +%H:%M) -gt 06:00 && $(date +%H:%M) -lt 18:00 ]] &&
	generate-key --day ||
	generate-key --night
```

### Answer

(a)

### Explanation

- `date +%H:%M` will give the current time in 24-hour format.
- You can compare dates by directly doing string comparison if it is in 24-hour format in MSB to LSB order.
- The command `generate-key --day` will be executed if the current time is greater than 6:00 and less than 18:00, else `generate-key --night` will be executed.
- `-gt` and `-lt` are used for integer comparison, so it will not work for string comparison.

---

## Question 8 [5]

Which of the following command will run the script `/home/reena/scripts/monday-greetings.sh` on every Monday at 10:00 AM in the month of October. [MCQ]

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

(a) `0 0 10 10 * /home/reena/scripts/monday-greetings.sh`

(b) `10 0 0 10 1 /home/reena/scripts/monday-greetings.sh`

(c) `* 0 10 * 0  /home/reena/scripts/monday-greetings.sh`

(d) `0 10 * 10 1 /home/reena/scripts/monday-greetings.sh`

### Answer

(d)

---

## Question 9 [6]

Below is the output of `ls -li` command. Select the number of hardlinks and softlinks `todo.md` is having respectively. [MCQ]

```text
$ pwd
/home/ram/tmp/6177

$ ls -li
total 0
28320712 -rw-rw-r-- 1 ram ram 0 Sep 20 13:24 notes.md
28320714 -rw-rw-r-- 1 ram ram 0 Sep 20 13:24 quicklinks.md
28320713 -rw-rw-r-- 4 ram ram 0 Sep 20 13:24 todo.md
```

(a) 1, 4

(b) 4,1

(c) 1,0

(d) 4,cannot be determined with above data

(e) cannot be determined with above data, cannot be determined with above data

### Answer

(d)

### Explanation

- The third field in the output of `ls -li` command is the number of hardlinks. It shows that `todo.md` has 4 hardlinks.
- The number of softlinks cannot be determined from the output of `ls -li` command as there can be softlinks to `todo.md` present in other directories as well.

---

**Consider the below command outputs for question 10 and 11**

Note that in the output of the command `ls -li` the first field is the inode number. Also that /home/ram is the home directory of the user.

```shell
$ pwd
/home/ram/tmp/6177

$ ls -li
total 0
28320712 -rw-rw-r-- 1 ram ram 0 Sep 20 13:24 notes.md
28320714 -rw-rw-r-- 1 ram ram 0 Sep 20 13:24 quicklinks.md
28320713 -rw-rw-r-- 4 ram ram 0 Sep 20 13:24 todo.md
```

```shell
$ cd /home/ram/tmp/28041

$ pwd
/home/ram/tmp/28041

$ ls -li
total 0
28320713 -rw-rw-r-- 4 ram ram  0 Sep 20 13:24 todo2.md
28320713 -rw-rw-r-- 4 ram ram  0 Sep 20 13:24 todo3.md
28320716 -rw-rw-r-- 1 ram ram  0 Sep 20 13:26 todo4.md
28320717 lrwxrwxrwx 1 ram ram 15 Sep 20 13:26 todo5.md -> ../6177/todo.md
28320718 lrwxrwxrwx 1 ram ram 16 Sep 20 13:26 todo6.md -> ../6177/notes.md
28320713 -rw-rw-r-- 4 ram ram  0 Sep 20 13:24 todo.md
```

## Question 10 [5]

With respect to the above given data, how many files in `~/tmp/28041` is referring (hardlink + softlink) to the file `~/tmp/6177/todo.md` ? [NAT]

### Answer

4

### Explanation

- `todo2.md`, `todo3.md`, and `todo.md` in `~/tmp/28041` are hardlinks to `todo.md` in `~/tmp/6177` as they have the same inode number.
- `todo5.md` in `~/tmp/28041` is a softlink to `todo.md` in `~/tmp/6177`.
- So, there are 4 files in `~/tmp/28041` referring to `todo.md` in `~/tmp/6177`.

---

## Question 11 [6]

With respect to the above given data, if the directory name `~/tmp/6177` is changed to `~/tmp/6178`, then which of the files in `~/tmp/28041` will be broken? [MSQ]

(a) todo.md

(b) todo2.md

(c) todo3.md

(d) todo4.md

(e) todo5.md

(f) todo6.md

### Answer

(e), (f)

### Explanation

- `todo5.md` is a softlink to `todo.md` in `~/tmp/6177`. If the directory name is changed to `~/tmp/6178`, then the softlink will be broken.
- `todo6.md` is a softlink to `notes.md` in `~/tmp/6177`. If the directory name is changed to `~/tmp/6178`, then the softlink will be broken.

---

## Question 12 [6]

What will be the result of the keystrokes `$jddk0dw` on vi editor or `<C-e><C-k><C-k><C-a><M-d><C-d>` on emacs editor from first line first character on the text given below. `<C-x>` and `<M-x>` refers to Control + x and Meta/Alt + x respectively. [MCQ]

```text
abcd efgh ijkl
mnop qrst uvw
xyz
```

Hint:
Emacs:

- `<C-k>` delete the entire line (from the cursor to the end)
- `<M-d>` delete word
- `<C-d>` delete character

Vi:

- `dd` delete the entire line
- `dw` delete word

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
- `dd` deletes the entire line. (`mnop qrst uvw`)
- `k` moves the cursor to the previous line.
- `0` moves the cursor to the beginning of the line.
- `dw` deletes the word. (`abcd`)

---

## Question 13 [6]

Choose the command that matches a sequence of one or more digits at the end of the lines in the file `data.txt`. [MCQ]

(a) `grep '^[0-9]*' data.txt`

(b) `grep '[0-9][0-9]*' data.txt`

(c) `grep '[0-9]*[0-9]$' data.txt`

(d) `grep '^[0-9]*[0-9]$' data.txt`

### Answer

(c)

### Explanation

- `^` matches the start of the line.
- `[0-9]*` matches zero or more digits.
- `[0-9]` matches exactly one digit.
- `$` matches the end of the line.
- `[0-9]*[0-9]` matches one or more digits.
- So, the command `grep '[0-9]*[0-9]$' data.txt` matches a sequence of one or more digits at the end of the lines in the file `data.txt`.

---

## Question 14 [6]

The contents of file.txt is given below

```text
You've gotta dance like there's nobody watching,
Love like you'll never be hurt,
Sing like there's nobody listening,
And live like it's heaven on earth.
― William W. Purkey
```

Select the command that prints the output same as the contents of file.txt [MSQ]

(a) `grep . file.txt`

(b) `grep .* file.txt`

(c) `grep [0-9] file.txt`

(d) `grep [.] file.txt`

### Answer

(a), (b)

### Explanation

- `grep .` will print all the non-empty lines in the file. In this file we don't have any empty lines, so it is equivalent to `cat file.txt`.
- `grep .*` will print all the lines in the file. It is equivalent to `cat file.txt`.
- `grep [0-9]` will print all the lines that contain a digit in the file. But there are no digits in the file, so it will not print anything.
- `grep [.]` will print all the lines that contain a dot in the file. So it will print the last two lines.

---

## Question 15 [5]

What will be the output from the script when the value of variable `status` is 200? [MCQ]

```bash
if [[ $status -eq 200 ]]; then
	print "Success"
else
	print "Something went wrong"
fi
```

(a) `Success`

(b) `Something went wrong`

(c) Nothing will be printed

(d) Throws an error and nothing will be printed

### Answer

(a)

---

## Question 16 [8]

```bash
while read line; do
	pat='[0-3][a-g][123][xyz]'
	[[ "$line" =~ $pat ]] && break
done
```

Select the standard input(s) that break the loop. [MSQ]

(a) `8iadaz`

(b) `3g2z`

(c) `jkjkjkjk2j2yjkjk`

(d) `.a.a.a.2.2.1.`

(e) `00210132a1z01231`

(f) `1a2w01231`

### Answer

(b), (e)

### Explanation

- The pattern `[0-3][a-g][123][xyz]` matches the following:
  - `[0-3]` → Any digit from 0 to 3
  - `[a-g]` → Any lowercase alphabet from a to g
  - `[123]` → Any digit from 1 to 3
  - `[xyz]` → Any character x, y, or z
- The input `3g2z` matches the pattern.
- The input `00210132a1z01231` matches the pattern (`2a1z`).

---

## Question 17 [6]

Select all the files that will be copied (not moved) to `~/anotherdir` after running the below script.
Note that `stat` command is used to get the file status and with option `-c %s` is to get the total size in bytes. [MSQ]

```bash
for i in *; do
	if ! [[ $(stat -c %s "$i") -eq 0 ]]; then
		cp $i ~/anotherdir/$i
	else
		mv $i ~/anotherdir/$i
	fi
done
```

```text
$ ls -l
-rw-rw-r--   1 ahmed ahmed   61432 Jul 20 18:40  temp.awk
-rw-rw-r--   1 ahmed ahmed       0 Aug  7 13:55  temp.hi
-rw-rw-r--   1 ahmed ahmed   12233 Aug 20 15:24  temp.hs
-rw-rw-r--   1 ahmed ahmed   59433 Aug  7 13:55  temp.o
-rwxrw-r--   1 ahmed ahmed       0 Aug 21 01:49  temp.py
-rwxr-xr-x   1 ahmed ahmed       0 Aug  6 17:39  temp.sh

$ stat -c %s temp.hs #
12233
```

(a) temp.awk

(b) temp.hi

(c) temp.hs

(d) temp.o

(e) temp.py

(f) temp.sh

### Answer

(a), (c), (d)

### Explanation

- All files that have non-zero size will be copied to `~/anotherdir`.
- The files `temp.awk`, `temp.hs`, and `temp.o` have non-zero size, so they will be copied to `~/anotherdir`.
