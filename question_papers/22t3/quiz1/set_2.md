# System Command Quiz-1 Set-2

## Question 1 [6] Same as set-1

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
A="AH"
echo "${A}NN$(echo $A | rev)"
```

(a) AHNNA

(b) AHNNAH

(c) AHHA

(d) AHNN

(e) NN

(f) AHNNHA

(g) \${A}NN\$(echo \$A | rev)

### Answer

(f)

---

**Common data for Question 3 to 5**
**Case 1**

```bash
echo Welcome
read line
echo Home
```

**Case 2**

```bash
echo Welcome
read line &
echo Home
```

## Question 3 [5]

When will the text `Home` be printed if no input is given to stdin in case 1? [MCQ]

(a) Immediately

(b) After a minute

(c) The text `Home` will not be printed

(d) Not enough information

### Answer

(c)

---

## Question 4 [5]

When will the text `Home` will be printed if no input is given to stdin in case 2? [MCQ]

(a) Immidiately

(b) After a minute

(c) The text `Home` will not be printed

(d) Not enough information

### Answer

(a)

---

## Question 5 [5]

Select the correct statement with respect to the above script? [MSQ]

(a) The command `read line` will run in background

(b) The commands `read line` and `echo World` both will run in backgroud

(c) The processes sent to background will be killed

(d) The `fg` command will move back the execution of `read line` to foreground

### Answer

(a), (d)

---

## Question 6 [7]

Select the output from the below script. [MCQ]

```bash
var="Wind"
echo "-var-"
echo "-${var2:=Air}-"
echo "-${var2:-Fire}-"
echo "-${var2:+Earth}-"
```

(a)

```
-Wind-
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
-Wind-
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

---

## Question 7 [7] Same as set-1

In an organization a particular software requires a key file while the keys will change at 6 am and 6 pm. The command `generate-key` will generate the key file with either of the option `--day` or `--night` with respect to the time at which the command is executed.
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

---

## Question 8 [5]

Which of the following command will run the script `/home/reena/scripts/monday-greetings.sh` on every Monday at 10:10 AM in the month of October. [MCQ]

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

(d) `10 10 * 10 1 /home/reena/scripts/monday-greetings.sh`

### Answer

(d)

---

## Question 9 [6] Same as set-1

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

(e) cannot be determined with above data,cannot be determined with above data

### Answer

(d)

---

**Consider the below command outputs for question 10 and 11**
Note that in the output of the command `ls -li` the first field is the inode number. Also that /home/ram is the home directory of the user.

```text
$ pwd
/home/ram/tmp/6177

$ ls -li
total 0
28320712 -rw-rw-r-- 1 ram ram 0 Sep 20 13:24 notes.md
28320714 -rw-rw-r-- 1 ram ram 0 Sep 20 13:24 quicklinks.md
28320713 -rw-rw-r-- 4 ram ram 0 Sep 20 13:24 todo.md
```

```text
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

## Question 10 [5] Same as Set-1

With respect to the above given data, how many files in `~/tmp/28041` is referring (hardlink + softlink) to the file `~/tmp/6177/todo.md` ? [NAT]

### Answer

4

---

## Question 11 [6] Same as Set-1

With respect to the above given data, if the directory name `~/tmp/6177` is changed to `~/tmp/6178`, then which of the files in `~/tmp/28041` will be broken? [MSQ]

(a) todo.md

(b) todo2.md

(c) todo3.md

(d) todo4.md

(e) todo5.md

(f) todo6.md

### Answer

(e), (f)

---

## Question 12 [6] Same as Set-1

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

---

## Question 13 [6]

Choose the command that matches a sequence of one or more digits at the end of the lines in the file `data.txt`. [MCQ]

(a) `grep '^[0-9]*' data.txt`

(b) `grep '[0-9][0-9]*' data.txt`

(c) `grep '[0-9][0-9]*$' data.txt`

(d) `grep '^[0-9][0-9]*$' data.txt`

### Answer

(c)

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

Select the command that prints the output different than the contents of file.txt [MSQ]

(a) `grep . file.txt`

(b) `grep .* file.txt`

(c) `grep [0-9] file.txt`

(d) `grep [.] file.txt`

### Answer

(c), (d)

---

## Question 15 [5] Same as Set-1

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

## Question 16 [8] Same as Set-1

```bash
while read line; do
	$pat = '[0-3][a-g][123][xyz]'
	[[ $line =~ $pat ]] && break
done
```

Select the standard input(s) that do break the loop. [MSQ]

(a) 8iadaz

(b) 3g2z

(c) jkjkjkjk2j2yjkjk

(d) .a.a.a.2.2.1.

(e) 00210132a1z01231

(f) 1a2w01231

### Answer

(b), (c), (e)

---

## Question 17 [6]

Select all the files that will be copied (not moved) to `~/anotherdir` after running the below script.
Note that `stat` command is used to get the file status and with option `-c %s` is to get the total size in bytes. [MSQ]

```bash
for i in *; do
	if ! [[ $(stat -c %s "$i") -eq 0 ]]; then
		mv $i ~/anotherdir/$i
	else
		cp $i ~/anotherdir/$i
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

$ stat -c %s temp.hs
12233
```

(a) temp.awk

(b) temp.hi

(c) temp.hs

(d) temp.o

(e) temp.py

(f) temp.sh

### Answer

(b), (e), (f)
