# System Commands Sep-2024 End Term Set-1

## Question 1 [3]

Following command is ran in shell. Which of the following option is the correct output of the command. [MCQ]

```bash
echo fol1/{fol2,{fol3,fol4}}
```

(a) `fol1/fol2 fol1/fol3 fol1/fol4`

(b) `fol1/{fol2/fol3} fol1/{fol2/fol4}`

(c) `fol1/{fol2fol3} fol1/{fol2fol4}`

(d) `fol1/fol2, fol3 fol1/fol2, fol4`

(e) `fol1/{fol2, {fol3, fol4}}`

### Answer

(a)

## Question 2 [3]

Choose the corner case(s) from stdin that make this `awk` command fail to calculate the sum of all numbers present in the input, while ignoring non-numeric values. [MCQ]

```bash
#!/bin/bash

awk '{
    sum = 0
    for (i = 1; i <= NF; i++) {
        if ($i ~ /^[0-9]+$/) sum += $i
    }
    print sum
}'
```

(a) `100 200 hello 300`

(b) `one two three`

(c) `10 20 30 forty 50`

(d) `500 -50 300`

(e) `20 twenty 10`

### Answer

(d)

## Question 3 [3]

Given the following command:

```bash
$ sort -k1,3 -k4rn file | awk '{prev=key; key=$1 FS $2 FS $3} key!=prev'
```

Where `file` has the following content:

```text
text1 a1 a2 10
text1 a1 a2 5
text2 b2 b8 15
text3 b9 b4 25
text4 g1 k5 80
text4 g1 k5 50
text5 y5 p3 100
text5 y5 p3 25
```

Which among the following options will be the output of the command? [MCQ]

**Hint**

The `sort -k1,3 -k4rn` command:

- Sorts lines by the **first three fields** in **alphabetical order**.
- Then sorts by the **fourth field** (numbers) in **reverse order**.

(a)

```text
text1 a1 a2 10
text1 a1 a2 5
text2 b2 b8 15
text3 b9 b4 25
text4 g1 k5 80
text4 g1 k5 50
text5 y5 p3 25
text5 y5 p3 100
```

(b)

```text
text1 a1 a2 10
text2 b2 b8 15
text3 b9 b4 25
text4 g1 k5 80
text5 y5 p3 100
```

(c)

```text
text1 a1 a2 10
text1 a1 a2 5
text2 b2 b8 15
text3 b9 b4 25
text4 g1 k5 50
text4 g1 k5 80
text5 y5 p3 100
text5 y5 p3 25
```

(d)

```text
text1 a1 a2 5
text1 a1 a2 10
text2 b2 b8 15
text3 b9 b4 25
text4 g1 k5 80
text4 g1 k5 50
text5 y5 p3 25
text5 y5 p3 100
```

### Answer

(b)

## Question 4 [3]

Using **regular expressions** (ERE), write a pattern that matches lines where:

1. The first word consists only of lowercase letters.
2. The second field is a 2- or 3-digit number.
3. The third word consists only of lowercase letters.
4. The fourth field is a number consisting of exactly 3 digits.

Choose the correct pattern from the following options. [MCQ]

(a) `^[a-z]+\s+[0-9]{2,3}\s+[a-z]+\s+[0-9]{3}$`

(b) `^[a-z]+\s+[0-9]{2,3}}\s+[a-z]+\s+[0-9]{1,3}$`

(c) `^[a-zA-Z]+\s+[0-9]+\s+[a-z]+\s+[0-9]{2,3}$`

(d) `^[a-z]+\s+[0-9]+\s+[a-z]+\s+[0-9]{3}$`

### Answer

(a)

## Question 5 [3]

Select the command(s) that find the file/directory names that starts with `a` and ends with `e` (case-sensitive). [MCQ]

(a) `ls | grep 'a.*e'`

(b) `grep 'a.*e'`

(c) `echo a*e`

(d) `echo a*e*`

### Answer

(c)

## Question 6 [4]

When will the script `/home/Garima/report.sh` get executed? [MCQ]

```bash
#report.sh
45 23 15 10 * /home/rohit/report.sh
```

**Hint:** Please refer to the following:

```text
* * * * * <Command(s) with argument>
| | | | |
| | | | ----- Command or Script to Execute
| | | -------- Day of the Week (0 - 6) [Sunday = 0, Monday = 1, ..., Saturday = 6]
| | ---------- Month of the Year (1 - 12) [January = 1, ..., December = 12]
| ------------ Day of the Month (1 - 31)
-------------- Hour (0 - 23)
------------- Minute (0 - 59)
```

(a) Every 15th of October at 23:45

(b) Every 15th of November at 23:45

(c) Every day at 23:45 in October

(d) Every day at 15:45 in October

### Answer

(a)

## Question 7 [4]

Choose the regular expression that matches **ONLY** an eight **character** palindrome (can contain any alphanumeric characters). Basic Regular Expression (BRE) is used. [MCQ]

(a) `^.{8}$`

(b) `^\([a-zA-Z0-9]\)\([a-zA-Z0-9]\)\([a-zA-Z0-9]\)\([a-zA-Z0-9]\)\4\3\2\1$`

(c) `^[0-9a-zA-Z]{8}$`

(d) `^\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\4\3\2\1$`

### Answer

(b)

## Question 8 [4]

Given the following code is present in `script.sh`, which of the following option(s) will result in the script **echo "false"** or **exiting with an error code 1**? [MSQ]

```bash
#!/usr/bin/env bash
if [[ $# -ne 1 ]] || [[ $1 =~ ^[0-9]+$ ]]; then
  exit 1
fi
(( ($1 % 4 == 0 && $1 % 100 != 0) || ($1 % 400 == 0) )) && echo true || echo false
```

(a) `./script.sh 2020`

(b) `./script.sh "A2022"`

(c) `./script.sh 2400 2200`

(d) `./script.sh -400`

(e) `./script.sh 2024`

(f) `./script.sh 2021`

### Answer

(b), (c), (d), (f)

## Question 9 [3]

You are given the following data in a file:

```text
apple 12 banana 100
grape 300 orange 150
apple 12 banana 120
mango 15 peach 200
grape 300 orange 180
mango 15 peach 220
```

Which of the following script/method from the option(s) that filters out duplicate lines based on the first three fields, keeping only the **first occurrence** of each unique combination. [MSQ]

(a)

```bash
while read line; do
  first_three=$(echo "${line}" | cut -d' ' -f1-3)
  if [[ ! " ${seen[@]} " =~ " ${first_three} " ]]; then
    echo "${line}"
    seen+=("${first_three}")
  fi
done < file
```

(b)

```bash
cat file | while read -r a b c d; do
  if ! grep -q "$a $b $c" <<< "${seen[@]}"; then # <<< is standard input
    echo "$a $b $c $d"
    seen+=("$a $b $c")
  fi
done
```

(c)

```bash
cut -d' ' -f1-3 | uniq | while read first_three; do
  grep "^$first_three" file | head -n1
done
```

(d)

```bash
cat file | sort -u -k1,3 | uniq
```

### Answer

(a), (b), (d)

## Question 10 [3]

Which of the following `sed` commands from the options will print lines **except first 3 lines** from the `data.txt` file? [MSQ]

(a) `sed '1,3d' data.txt`

(b) `sed '1~3d' data.txt`

(c) `sed '/^$/d' data.txt`

(d) `sed -n '4,$p' data.txt`

### Answer

(a), (d)

## Question 11 [3]

An **IPv4 address** is typically represented in the format XXX.XXX.XXX.XXX, where XXX is a number between 0 and 255. **Identify the correct extended or basic regular expression** from the following, which will match an IPv4 address. Note: All the regular expressions are either **BRE** or **ERE**. [MSQ]

(a) `^([0-9]{1,3}\.){3}[0-9]{1,3}$`

(b) `^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}$`

(c) `^([0-9]{1,3}.){3}[0-9]{1,3}$`

(d) `^[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}$`

### Answer

(a), (b), (d)

## Question 12 [3]

Select the command that prints a line which is the number of lines in the file `myfile`.
Note: `NR` in AWK is a predefined variable which holds the number of records seen so far. [MSQ]

(a) `cat myfile | wc -l`

(b) `awk 'END { print NR; }' myfile`

(c) `awk '{ print NR; }' myfile`

(d) `awk 'BEGIN { print NR; }' myfile`

### Answer

(a), (b)

## Question 13 [3]

How many asterisks (``*``) are printed after the **first loop** has completed execution? [NAT]

```bash
#!/bin/bash

print_pattern(){
  for i in {1..3}; do
    sleep 0.2
    echo -n "*"
  done
}

for i in {1..2}; do #first loop
  print_pattern
done

for _ in {1..3}; do #second loop
  print_pattern &
done
wait #Command issued to finish process
```

### Answer

6

## Question 14 [4]

How many asterisks (``*``) are printed after the **second loop** (excluding first loop) has completed execution? [NAT]

```bash
#!/bin/bash

print_pattern(){
  for i in {1..3}; do
    sleep 0.2
    echo -n "*"
  done
}

for i in {1..2}; do #first loop
  print_pattern
done

for _ in {1..3}; do #second loop
  print_pattern &
done
wait #Command issued to finish process
```

### Answer

9

## Question 15 [4]

```bash
./script.sh "hello-world-from-bash-scripting"
```

Following script is saved as `script.sh` in current working directory. Above commands are run in the bash in the current working directory. What will be the output of the command.

**Hint**

(Use case of tr will be added)

```bash
#!/usr/bin/bash

string=$(echo "$1" | sed -r 's/\*//g' | tr "-" " " | tr -d "_" | tr [a-z] [A-Z])
IFS=" "
for i in ${string}; do
  echo -n ${i:0:1}
done
```

**NOTE**: Enter the exact answer without any space in the beginning or at the end. [NAT]

### Answer

HWFS
