# System Commands OPPE Set 1

## Problem 1 (sed) [15 marks]

Gaurav is a software developer who works on a project in which he uses python as programming language. He puts as comment `# TODO: <things he wants to do later>` to the things he wants to do later in the code base. One day, he wants to complete all those things, for that, he wants to get all the todo tasks. He wants to write a SED script to search for the todo comments and extract only the `<things he wants to do later>` part.

Write the SED script for the above task.

**Sample Input**

```
...
        if self.propagate_exceptions:
            # if we want to repropagate the exception, we can attempt to
            # raise it with the whole traceback in case we can do that
            # (the function was actually called from the except part)
            # otherwise, we just raise the error again
            if exc_value is e:
                reraise(exc_type, exc_value, tb)
            else:
                raise e

        self.log_exception((exc_type, exc_value, tb))
        server_error = InternalServerError()
        # TODO: pass as param when Werkzeug>=1.0.0 is required
        # TODO: also remove note about this from docstring and docs
        server_error.original_exception = e
        handler = self._find_error_handler(server_error)

        if handler is not None:
            server_error = handler(server_error)
...
```

**Sample Output**

```
pass as param when Werkzeug>=1.0.0 is required
also remove note about this from docstring and docs
```

### Solution

```bash
#!/bin/sed -f

/# TODO:/! d
s/ *# TODO: //
```

## Problem 2 (sed) [15 marks]

Raj is a lazy student, he is in his bachelor's degree programme. He has decided to apply for a masters in data science program in various universities, so he wrote a general letter template and populated the respective values such as university name, experience and current position.

Write a script to achieve the same and get the university name, experience, and current_position from the standard input respectively and print the populated text.

**Template: template.txt**

```
Dear Members of the Admission Committee,

I am writing to apply for the Master's in Data Science program at [University Name]. With a strong background in data analysis and a passion for innovation, I am eager to join your esteemed institution to further refine my skills and contribute to the field.

Through [mention years] of experience in [Your Current or Previous Position], I've gained proficiency in programming, statistics, and data visualization. I am drawn to [University Name] for its reputation, cutting-edge research, and interdisciplinary approach, which align perfectly with my aspirations.

I am excited about the prospect of learning from [University Name]'s distinguished faculty and collaborating with fellow students who share my enthusiasm. Enclosed is my resume for your consideration.

Thank you for the opportunity to apply. I look forward to the chance of joining the Master's in Data Science program at [University Name].

Sincerely,
Raj
```

### Solution

```bash
#!/bin/bash

read -r university_name
read -r experience
read -r current_position

sed -e "s/\[University Name\]/$university_name/g" \
    -e "s/\[mention years\]/$experience/g" \
    -e "s/\[\Your Current or Previous Position\]/$current_position/g" \
    template.txt
```

## Problem 3 (awk) [15 marks]

Write an AWK script to provide the serial number, result, and total for the data on the student marks.

Note: The output should be tab separated values.

**Sample Input**

```
L1,L2,MATHS,SCIENCE,SOCIAL
86,92,78,90,85
70,80,95,88,92
92,88,35,82,78
65,20,20,85,90
88,90,92,78,85
```

**Sample Output**

```
SNO	L1	L2	MATHS	SCIENCE	SOCIAL	RESULT	TOTAL
1	86	92	78	90	85	PASS	431
2	70	80	95	88	92	PASS	425
3	92	88	35	82	78	FAIL	375
4	65	20	20	85	90	FAIL	280
5	88	90	92	78	85	PASS	433
```

### Solution

```bash
#!/bin/gawk -f

BEGIN {
    FS=","
    OFS="\t"
}

NR == 1 {
    print "SNO", "L1", "L2", "MATHS", "SCIENCE", "SOCIAL", "RESULT", "TOTAL"
}

NR > 1 {
    total = $1 + $2 + $3 + $4 + $5
    result = "PASS"
    for (i = 1; i <= 5; i++) {
        if ($i < 40) {
            result = "FAIL"
            break
        }
    }
    subject_total[1] += $1
    subject_total[2] += $2
    subject_total[3] += $3
    subject_total[4] += $4
    subject_total[5] += $5
    grand_total += total

    print NR-1, $1, $2, $3, $4, $5, result, total
}
```

## Problem 4 (awk) [20 marks]

Write an AWK script to provide the mean, and median for the data of student marks.

Hint: use `asort(arr)` function to sort the array `arr` by values

Note: The output should be tab separated values and hyphen (-) should be printed for non-applicable values.

**Sample Input**

```
SNO	L1	L2	MATHS	SCIENCE	SOCIAL	RESULT	TOTAL
1	86	92	78	90	85	PASS	431
2	70	80	95	88	92	PASS	425
3	92	88	35	82	78	FAIL	375
4	65	20	20	85	90	FAIL	280
5	88	90	92	78	85	PASS	433
```

**Sample Output**

```
SNO	L1	L2	MATHS	SCIENCE	SOCIAL	RESULT	TOTAL
1	86	92	78	90	85	PASS	431
2	70	80	95	88	92	PASS	425
3	92	88	35	82	78	FAIL	375
4	65	20	20	85	90	FAIL	280
5	88	90	92	78	85	PASS	433
MEAN	80.2	74	64	84.6	86	-	388.8
MEDIAN	86	88	78	85	85	-	425
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
    for (i = 2; i <= 6; i++) {
        subject[i][NR] = $i
        subject_sum[i] += $i
    }
    total[NR] = $8
    total_sum += $8
}

END {
    count = NR - 1

    if (count <= 1) {
      print "MEAN", "-", "-", "-", "-", "-", "-", "-"
      print "MEDIAN", "-", "-", "-", "-", "-", "-", "-"
      exit
    }

    for (i = 2; i <= 6; i++) {
        asort(subject[i])
        if (count % 2 == 1) {
            median[i] = subject[i][(count + 1) / 2]
        } else {
            median[i] = (subject[i][count / 2] + subject[i][count / 2 + 1]) / 2
        }
    }
    asort(total)
    if (count % 2 == 1) {
        total_median = total[(count + 1) / 2]
    } else {
        total_median = (total[count / 2] + total[count / 2 + 1]) / 2
    }

    print "MEAN", \
        subject_sum[2] / count, \
        subject_sum[3] / count, \
        subject_sum[4] / count, \
        subject_sum[5] / count, \
        subject_sum[6] / count, \
        "-", \
        total_sum / count

    print "MEDIAN", \
        median[2], \
        median[3], \
        median[4], \
        median[5], \
        median[6], \
        "-", \
        total_median
}
```

## Problem 5 (bash) [15 marks]

The history of the commands used in the terminal are saved in ~/.bash_history. Assume that such file is currently stored in your working directory as bash_history.txt. Write a **bash script** to find the top 5 commands with their frequency counts and percentage usage.

Hint: In one of the solution strategies, a shell variable which stores the total count of all commands from the file should be declared and then subsequently used in the script. For successful test cases, ensure that the output format should be the same as the one shown in the **Desired output** section of the question.

**Relevent man pages**

```
SORT(1)                              User Commands                              SORT(1)
       sort - sort lines of text files
       sort [OPTION]... [FILE]...
       sort [OPTION]... --files0-from=F
       Write sorted concatenation of all FILE(s) to standard output.
       With no FILE, or when FILE is -, read standard input.
       Mandatory arguments to long options are mandatory for short options too.  Order‐
       ing options:
       -b, --ignore-leading-blanks
              ignore leading blanks
       -d, --dictionary-order
              consider only blanks and alphanumeric characters
       -f, --ignore-case
              fold lower case to upper case characters
       -g, --general-numeric-sort
              compare according to general numerical value
       -i, --ignore-nonprinting
              consider only printable characters
       -M, --month-sort
              compare (unknown) < 'JAN' < ... < 'DEC'
       -h, --human-numeric-sort
              compare human readable numbers (e.g., 2K 1G)
       -n, --numeric-sort
              compare according to string numerical value
       -R, --random-sort
              shuffle, but group identical keys.  See shuf(1)
       --random-source=FILE
              get random bytes from FILE
       -r, --reverse
              reverse the result of comparisons
       --sort=WORD
              sort according to WORD: general-numeric -g, human-numeric -h,  month  -M,
              numeric -n, random -R, version -V
       -V, --version-sort
              natural sort of (version) numbers within text
       Other options:
              merge at most NMERGE inputs at once; for more use temp files
       -c, --check, --check=diagnose-first
              check for sorted input; do not sort
       -C, --check=quiet, --check=silent
              like -c, but do not report first bad line
       --compress-program=PROG
              compress temporaries with PROG; decompress them with PROG -d
              annotate  the  part of the line used to sort, and warn about questionable
              usage to stderr
       --files0-from=F
              read input from the files specified by NUL-terminated names in file F; If
              F is - then read names from standard input
              sort via a key; KEYDEF gives location and type
       -m, --merge
              merge already sorted files; do not sort
              write result to FILE instead of standard output
              stabilize sort by disabling last-resort comparison
       -S, --buffer-size=SIZE
              use SIZE for main memory buffer
       -t, --field-separator=SEP
              use SEP instead of non-blank to blank transition
       -T, --temporary-directory=DIR
              use  DIR  for  temporaries, not $TMPDIR or /tmp; multiple options specify
              multiple directories
       --parallel=N
              change the number of sorts run concurrently to N
       -u, --unique
              with -c, check for strict ordering; without -c, output only the first  of
              an equal run
       -z, --zero-terminated
              line delimiter is NUL, not newline


UNIQ(1)                              User Commands                              UNIQ(1)

NAME
       uniq - report or omit repeated lines

SYNOPSIS
       uniq [OPTION]... [INPUT [OUTPUT]]

DESCRIPTION
       Filter adjacent matching lines from INPUT (or standard input), writing to OUTPUT
       (or standard output).

       With no options, matching lines are merged to the first occurrence.

       Mandatory arguments to long options are mandatory for short options too.

       -c, --count
              prefix lines by the number of occurrences

       -d, --repeated
              only print duplicate lines, one for each group

       -D     print all duplicate lines

       --all-repeated[=METHOD]
              like  -D,   but   allow   separating   groups   with   an   empty   line;
              METHOD={none(default),prepend,separate}

       -f, --skip-fields=N
              avoid comparing the first N fields

       --group[=METHOD]
              show  all  items,  separating  groups  with  an empty line; METHOD={sepa‐
              rate(default),prepend,append,both}

       -i, --ignore-case
              ignore differences in case when comparing

       -s, --skip-chars=N
              avoid comparing the first N characters

       -u, --unique
              only print unique lines

       -z, --zero-terminated
              line delimiter is NUL, not newline

       -w, --check-chars=N
              compare no more than N characters in lines


```

**Sample input**

```
exit --help
$$
ps
ps |grep "$$"
$$
ps |grep $$
man $$
man shell varialbe
man shell
man bash
man bash|grep $$
man bash
echo 123|rev
echo 123 | rev
man rev
echo 123 | rev
$$
ps
$1
exit
```

**Sample output**

```
$$: 3: 15%
echo: 3: 15%
exit: 2: 10%
man: 7: 35%
ps: 4: 20%
```

### Solution

```bash
#!/bin/bash
total=$(wc -l < bash_history.txt)
cut -d' ' -f1 bash_history.txt |
	sort|
	uniq -c|
	sort -nr|
	sed -e 's/^ *//'|
	awk -v total=$total 'BEGIN{OFS=": "}{print $2, $1, ($1 / total) * 100 "%"}'|
	head -n5 | sort
```

## Problem 6 (bash) [20 marks]

It is often required to run some basic statistics on a file. Write a **bash script** using `getopts` method such that options,

- -l will print the total number of lines in the files, and
- -s sorts by column number provided.

**Sample Input**

```
Company,Date,Amount
CompanyA,2020-04-29,31211.18
CompanyA,2021-09-20,2366.91
CompanyA,2021-10-23,3491.17
CompanyA,2021-04-04,14304.44
CompanyA,2021-11-01,21679.58
CompanyA,2022-09-06,16277.49
CompanyA,2021-12-14,29527.37
CompanyA,2023-03-01,1447.83
CompanyA,2020-08-22,30383.23
```

**Sample output**

```
$ ./script.sh -l financial_records.csv
Total lines in financial_records.csv is 50
$ ./script.sh -s2 financial_records_short.csv
Company,Date,Amount
CompanyA,2020-04-29,31211.18
CompanyA,2020-08-22,30383.23
CompanyA,2021-04-04,14304.44
CompanyA,2021-09-20,2366.91
CompanyA,2021-10-23,3491.17
CompanyA,2021-11-01,21679.58
CompanyA,2021-12-14,29527.37
CompanyA,2022-09-06,16277.49
CompanyA,2023-03-01,1447.83

```

**Template**

```bash
#!/bin/bash
filename=${@: -1}

while getopts "ls:" options; do
  case "${options}" in
    l)
	 # enter your command to print in the correct format here
     ;;
    s)
      arg=${OPTARG} # argument obtained for option -s
	 # enter your command to print in the correct format here
      ;;
  esac
done
```

### Solution

```bash
#!/bin/bash
filename=${@: -1}

while getopts "lts:u:" options; do
  case "${options}" in
    l)
      echo "Total lines in"  "$filename" is "$(wc -l < "$filename")"
     ;;
    s)
      str=${OPTARG}
      sort -t',' -k"$str","$str" -n "$filename"
      ;;
  esac
done
```
