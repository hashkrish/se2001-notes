# System Commands OPPE Set 2

## Problem 1 (bash) [15 marks]

In a proofreading task, it is usually required that each of the sentences in a manuscript should be numbered along with paragraph number. Write a **bash script** to print each sentence of a paragraph saved in sample.txt to a new line and add sentence number and paragraph number above each of the line.

Hint: One of the possible approaches is to use while loop along with IFS. This approach will need to remove leading and trailing spaces from line and add a fullstop at the end of each line.

**Sample case**

```
The plains are as flat as the proverbial pancake—a dead monotony of cultivated alluvium, square mile upon square mile of wheat, rice, vetch, sugar-cane, and other crops, amidst which mango groves, bamboo clumps, palms, and hamlets are scattered promiscuously. In some places the hills rise sheer from this, in others they are separated from the alluvial plains by belts of country known as the Tarai and Bhabar. The Tarai is low-lying, marshy land covered with tall, feathery grass, beautifully monotonous. This is succeeded by a stretch of gently-rising ground, 10 or 20 miles in breadth, known as the Bhabar—a strip of forest composed mainly of tall evergreen sal trees (Shorea robusta). These trees grow so close together that the forest is difficult to penetrate, especially after the rains, when the undergrowth is dense and rank. Very beautiful is the Bhabar, and very stimulating to the imagination. One writer speaks of it as "a jungle rhapsody, an extravagant, impossible botanical tour de force, intensely modern in its Titanic, incoherent magnificence." It is the home of the elephant, the tiger, the panther, the wild boar, several species of deer, and of many strange and beautiful birds.
```

**Desired output**

```
Paragraph 1, Statement 1:
The plains are as flat as the proverbial pancake—a dead monotony of cultivated alluvium, square mile upon square mile of wheat, rice, vetch, sugar-cane, and other crops, amidst which mango groves, bamboo clumps, palms, and hamlets are scattered promiscuously.

Paragraph 1, Statement 2:
In some places the hills rise sheer from this, in others they are separated from the alluvial plains by belts of country known as the Tarai and Bhabar.

Paragraph 1, Statement 3:
The Tarai is low-lying, marshy land covered with tall, feathery grass, beautifully monotonous.

Paragraph 1, Statement 4:
This is succeeded by a stretch of gently-rising ground, 10 or 20 miles in breadth, known as the Bhabar—a strip of forest composed mainly of tall evergreen sal trees (Shorea robusta).

Paragraph 1, Statement 5:
These trees grow so close together that the forest is difficult to penetrate, especially after the rains, when the undergrowth is dense and rank.

Paragraph 1, Statement 6:
Very beautiful is the Bhabar, and very stimulating to the imagination.

Paragraph 1, Statement 7:
One writer speaks of it as "a jungle rhapsody, an extravagant, impossible botanical tour de force, intensely modern in its Titanic, incoherent magnificence.

Paragraph 1, Statement 8:
" It is the home of the elephant, the tiger, the panther, the wild boar, several species of deer, and of many strange and beautiful birds.
```

### Solution

```bash
#!/bin/bash

input_file=$1
paragraph_number=1
while IFS= read -r paragraph; do
    statement_number=1
    IFS='.'
    for statement in $paragraph; do
        statement=$(echo "$statement" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        echo "Paragraph $paragraph_number, Statement $statement_number:"
        echo "$statement".
        echo
        ((statement_number++))
    done
    ((paragraph_number++))
done < "$input_file"
```

## Problem 2 (sed) [15 marks]

A file `mydata.csv` is present in the current working directory. Use sed to swap the fourth column to the first column.

**Sample input**

```
grep,219,10.95,47961
ls,208,10.4,43264
echo,195,9.75,38025
ps,92,4.6,8464
sed,82,4.1,6724
cd,80,4,6400
vi,77,3.85,5929
clear,72,3.6,5184
awk,72,3.6,5184
man,67,3.35,4489
```

**Sample output**

```
47961,219,10.95,grep
43264,208,10.4,ls
38025,195,9.75,echo
8464,92,4.6,ps
6724,82,4.1,sed
6400,80,4,cd
5929,77,3.85,vi
5184,72,3.6,clear
5184,72,3.6,awk
4489,67,3.35,man
```

### Solution

```bash
sed -E 's/^([^,]*),([^,]*),([^,]*),([^,]*)/\4,\2,\3,\1/' mydata.csv
```

## Problem 3 (sed) [15 marks]

A file sample.txt contains multiple paragraphs. As it is a text file, discerning paragraphs could be tricky. To resolve this user wanted to add '---' before and after each paragraph. Write a **sed script** which will accomplish that.

**Sample Input**

```
The plains are as flat as the proverbial pancake—a dead monotony of cultivated alluvium, square mile upon square mile of wheat, rice, vetch, sugar-cane, and other crops, amidst which mango groves, bamboo clumps, palms, and hamlets are scattered promiscuously. In some places the hills rise sheer from this, in others they are separated from the alluvial plains by belts of country known as the Tarai and Bhabar. The Tarai is low-lying, marshy land covered with tall, feathery grass, beautifully monotonous.
This is succeeded by a stretch of gently-rising ground, 10 or 20 miles in breadth, known as the Bhabar—a strip of forest composed mainly of tall evergreen sal trees (Shorea robusta). These trees grow so close together that the forest is difficult to penetrate, especially after the rains, when the undergrowth is dense and rank. Very beautiful is the Bhabar, and very stimulating to the imagination. One writer speaks of it as "a jungle rhapsody, an extravagant, impossible botanical tour de force, intensely modern in its Titanic, incoherent magnificence." It is the home of the elephant, the tiger, the panther, the wild boar, several species of deer, and of many strange and beautiful birds.
```

**Sample Output**

```
---
The plains are as flat as the proverbial pancake—a dead monotony of cultivated alluvium, square mile upon square mile of wheat, rice, vetch, sugar-cane, and other crops, amidst which mango groves, bamboo clumps, palms, and hamlets are scattered promiscuously. In some places the hills rise sheer from this, in others they are separated from the alluvial plains by belts of country known as the Tarai and Bhabar. The Tarai is low-lying, marshy land covered with tall, feathery grass, beautifully monotonous.
---
---
This is succeeded by a stretch of gently-rising ground, 10 or 20 miles in breadth, known as the Bhabar—a strip of forest composed mainly of tall evergreen sal trees (Shorea robusta). These trees grow so close together that the forest is difficult to penetrate, especially after the rains, when the undergrowth is dense and rank. Very beautiful is the Bhabar, and very stimulating to the imagination. One writer speaks of it as "a jungle rhapsody, an extravagant, impossible botanical tour de force, intensely modern in its Titanic, incoherent magnificence." It is the home of the elephant, the tiger, the panther, the wild boar, several species of deer, and of many strange and beautiful birds.
---
```

### Solution

```bash
 sed  -e '/./s/^/---\n/' -e '/./s/$/\n---/' sample.txt

```

## Problem 4 (awk) [20 marks]

Write an AWK script which will add a row MODE which contains the mode of the student marks data.

Hint: use `asort(arr)` function to sort the array `arr` by values

Note:

- The input is tab separated values
- The output should be tab separated values
- hyphen (`-`) should printed for non-applicable values.
- mode is not applicable when there are multiple modes or all the values are unique
- Submit to get partial marks for passed private test cases.

Mode: To find the mode of a dataset, you identify the value(s) that appear most frequently. In a dataset, there can be one mode (unimodal), more than one mode (multimodal), or no mode at all.
Consider the dataset {2, 3, 4, 4, 5, 5, 5, 6, 7}. In this case, the mode is 5 because it appears most frequently (3 times).

**Sample Input**

```
SNO	L1	L2	MATHS	SCIENCE	SOCIAL	RESULT	TOTAL
1	86	92	78	90	85	PASS	431
2	70	80	95	88	78	PASS	425
3	92	88	35	88	78	FAIL	375
4	65	20	20	85	90	FAIL	280
5	88	90	92	78	85	PASS	433
```

**Sample Output**

```
SNO	L1	L2	MATHS	SCIENCE	SOCIAL	RESULT	TOTAL
1	86	92	78	90	85	PASS	431
2	70	80	95	88	78	PASS	425
3	92	88	35	88	78	FAIL	375
4	65	20	20	85	90	FAIL	280
5	88	90	92	78	85	PASS	433
MODE	-	-	-	88	-	PASS	-
```

#### Solution

```bash
#!/bin/gawk -f
BEGIN {
    OFS="\t"
}
{
        print
}

NR > 1 {
    result = $7
    for (i = 2; i <= 6; i++) {
        subject[i][NR] = $i
        subject_sum[i] += $i
    }
    for (i = 2; i <= 8; i++) {
        freq[i][$i] += 1
    }
    total_sum += $8
    total[NR] = $8
}

END {
    count = NR - 1

    for (i = 2; i <= 8; i++) {
        max_freq = 0
        for (mark in freq[i]) {
            if (freq[i][mark] > max_freq) {
                max_freq = freq[i][mark]
                mode[i] = mark
            }
        }

        has_mode = 0
        for (mark in freq[i]) {
            if (freq[i][mark] == max_freq && mark != mode[i]) {
                has_mode = 1
            }
        }
        max_freq_occurrence = 0
        for (mark in freq[i]) {
            if (freq[i][mark] == max_freq) {
                max_freq_occurrence++
            }
        }
        if (has_mode == 1 || max_freq == 1 || max_freq == count || max_freq_occurrence > 1)  {
            mode[i] = "-"
        }

    }

    print "MODE", \
        mode[2], \
        mode[3], \
        mode[4], \
        mode[5], \
        mode[6], \
        mode[7], \
        mode[8]
}
```

## Problem 5 (awk) [15 marks]

Write an AWK script that will print the count of each word appearing in a paragraph. Note that the paragraph may contain punctuation. Use gsub function to remove the punctuations and tolower function to convert a word to lowercase.

**NOTE**: The words should be in ascending order.

**man page of gsub in AWK**

```
 gsub(r, s [, t])        For each substring matching the  regular
                               expression r in the string t, substitute
                               the string s, and return the  number  of
                               substitutions.   If  t  is not supplied,
                               use $0.  An & in the replacement text is
                               replaced with the text that was actually
                               matched.  Use \& to  get  a  literal  &.
                               (This  must be typed as "\\&"; see GAWK:
                               Effective AWK Programming for  a  fuller
                               discussion  of  the  rules  for  &'s and
                               backslashes in the replacement  text  of
                               sub(), gsub(), and gensub().)

 tolower(str)            Return  a  copy  of the string str, with
                               all  the  uppercase  characters  in  str
                               translated to their corresponding lower‐
                               case counterparts.  Non-alphabetic char‐
                               acters are left unchanged.
```

For example: for a paragraph as follows

```
If you must cross a coarse, cross cow across a crowded cow crossing, cross the cross, coarse cow across the crowded cow crossing carefully.
```

** Desired output **

```
a: 2
across: 2
carefully: 1
coarse: 2
cow: 4
cross: 4
crossing: 2
crowded: 2
if: 1
must: 1
the: 2
you: 1
```

### Solution

```bash
#!/usr/bin/gawk -f
BEGIN {
  OFS=": "
}

{
  gsub(/[[:punct:]]/, "", $0)

  for (i=1; i<=NF; i++) {
    word = tolower($i)
    count[word]++
  }
}

END {
  i=0
  for(word in count) {
    words[i++] = word
  }
  asort(words)
  for(i in words) {
    word = words[i]
    print word, count[word]
  }
}
```

## Problem 6 (bash) [20 marks]

It is often required to run some basic statistics on a file. Write a **bash script** using `getopts` method such that options,

- -t will print the number of columns present in the file, and
- -u prints unique entries based on the column number provided.

**Sample Input**

```
Company,Date,Amount
CompanyA,2020-04-29,31211.18
CompanyA,2021-09-20,2366.91
CompanyA,2021-10-23,3491.17
CompanyB,2021-04-04,14304.44
CompanyA,2021-11-01,21679.58
CompanyA,2022-09-06,16277.49
CompanyA,2021-12-14,29527.37
CompanyA,2023-03-01,1447.83
CompanyA,2020-08-22,30383.23
```

**Sample output**

```
$ ./script.sh -u1 financial_records.csv
the unique entries in column 1 is CompanyA CompanyB
$ ./script.sh -t financial_records.csv
Number of columns in financial_records.csv is 3
```

**Sample format**

```bash
#!/bin/bash
filename=${@: -1}

while getopts "tu:" options; do
  case "${options}" in
    t)
	 # enter your command to print in the correct format here
     ;;
    u)
      arg=${OPTARG} # argument obtained for option -u
	 # enter your command to print in the correct format here
      ;;
  esac
done
```

### Solution

```bash
#!/bin/bash
filename=${@: -1}

while getopts "tu:" options; do
  case "${options}" in
    t)
      echo "Number of columns in" $filename is  $(awk -F',' '{print NF; exit}' "$filename")
     ;;
    u)
      str=${OPTARG}
      echo "the unique entries in column" $str is $(awk -F',' -v col="$str" 'NR>1 {print $col}' "$filename" | sort -u)
      ;;
  esac
done
```
