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

---
<div style="page-break-after: always;"></div>

## Question 2 (shell variables) [6]

```bash
a=12
b=56
c=$(a + b)
d=$(a + c)
```

What will be the value of `d` at the end of execution? [NAT]

### Answer
80

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

---
<div style="page-break-after: always;"></div>

``
## Question 4 (cron) [7]

When will the script `/home/rohit/premodel.sh`  get executed. [MCQ]

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

(a) Everyday at 00:05 in August 
(b) Everyday at 05:00 in August 
(c) Everyday at 08:00 in May 
(d) Everyday at 08:05 in May 

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
grep "button" index.html
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


---
<div style="page-break-after: always;"></div>

## Question 6 (regex) [7]

Choose the regular expression that match with **ONLY** the five <u>digit</u> palindrome. Basic Regular Expression (BRE) is used.

(a) `^.....$`
(b) `^.{5}$`
(c) `^\([0-9]\)\([0-9]\)[0-9]\2\1$`
(d) `^\(.\)\(.\).\2\1$`

### Answer
(c)


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

---
<div style="page-break-after: always;"></div>

## Question 10 (redirection) [6]

Choose the line that modified the <u>contents inside the file</u> `backup.sh`

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

---
<div style="page-break-after: always;"></div>

## Question 11 (link) [6]

A college student uses a pen drive to store files. The pen drive is always mounted on his system at `/mount` as a separate file system. His pen drive contains lots of files and directories.  He wants to create a link to the directory `/mount/bio/phase-2/project-312` inside his home directory. What link can the student use?

(a) soft link 
(b) hard link
(c) either soft link or hard link
(d) links will not work for this requirement

### Answer

(a)

---
<div style="page-break-after: always;"></div>

``
## Question 12 (conditional &&) [5]

Enter the number `A` that will print the output "SUCCESS"

```bash
[ "$A" -gt 10 ] && 
[ "$A" -lt 15 ] && 
[ "$(( A % 3 ))" -eq 0 ] && 
echo SUCCESS
```

### Answer
12

---
<div style="page-break-after: always;"></div>

``
## Question 13 (if-else) [7]

Select the standard input that prints "MATCH" as output.

```bash
read str
pat='^@.*#'

if [[ "$str" =~  "$pat" ]]; then
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


---
<div style="page-break-after: always;"></div>


## Question 15 (while) [6]

```bash
while read line; do
    echo $line
done < pattern.txt
```

Select the equivalent command for the above script.

(a) `cat pattern.txt`
(b) `cat pattern.txt | cat > pattern.txt`
(c) `cat > pattern.txt`
(d) `grep . pattern.txt`

### Answer
(a), (d)
