# OPPE-2

---

**Grading:**

- Section-1: Best 2 out of 3. 15 marks each
- Section-2: Best 2 out of 3. 15 marks each
- Section-3: Attempt all 2. 20 marks each

Total: 100 marks, 6 problems

---

## Section-1 Problem-1

Write a **SED script**,

- To insert a line `# FUNCTION DEFINITION` when the word `def` is found and that line should be shifted down.
- To remove the line that has `# TODO`

### Problem

### Prefix

```bash
script() { echo '#!/usr/bin/sed -f
```

### Solution

```sed
/^[[:blank:]]*def\b/ i # FUNCTION DEFINITION
/# TODO/ d
```

### Suffix

```bash
'
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

script > script.sed
sed -f script.sed 2>&1
```

### Test cases

**Public**

**Input-1**

```
def f():
    pass
```

**Output-1**

```
# FUNCTION DEFINITION
def f():
    pass
```

**Input-2**

```
# TODO: complete fibonacci
l=[0,1]
n=int(input)
for i in range(2, n):
    l.append(l[i-1], l[i-2])
if n==1:
    pass
```

**Output-2**

```
l=[0,1]
n=int(input)
for i in range(2, n):
    l.append(l[i-1], l[i-2])
if n==1:
    pass
```

**Private**

**Input-1**

```
def f():
    # TODO: SOMETHING
    pass
```

**Output-1**

```
# FUNCTION DEFINITION
def f():
    pass
```

**Input-2**

```
print('hi')
```

**Output-2**

```
print('hi')
```

**Input-3**

```
def g():
    pass
```

**Output-3**

```
# FUNCTION DEFINITION
def g():
    pass
```

**Input-4**

```
def a():
    def b():
        pass
    def c():
        pass
    TODO = 9
    return TODO
# ...
```

**Output-4**

```
# FUNCTION DEFINITION
def a():
# FUNCTION DEFINITION
    def b():
        pass
# FUNCTION DEFINITION
    def c():
        pass
    TODO = 9
    return TODO
# ...
```

---

## Section-1 Problem 2

Write a **SED script** to replace all the colons `:` from input with tab character `\t` but when colon is preceded by backslash `\:` then it should be replaced with `:`

### Problem

### Prefix

```bash
script() {
echo \
'#!/usr/bin/sed -f
```

### Solution

```sed
s/\([^\]\):/\1\t/g
s/^:/\t/
s/\\:/:/g
```

### Suffix

```bash
'
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

script > script.sed
sed -f script.sed 2>&1
```

### Test cases

**Public**

**Input-1**

```
a:b:c
```

**Output-1**

```
a    b    c
```

**Input-2**

```
a\:b:c
```

**Output-2**

```
a:b    c
```

**Private**

**Input-1**

```
:
```

**Output-1**

```

```

**Input-2**

```
\:
```

**Output-2**

```
:
```

**Input-3**

```
1:2:3:4:5
1:2:3:4:5
1:2:3:4:5
1:2:3:4:5
1:2:3:4:5
```

**Output-3**

```
1   2   3   4   5
1   2   3   4   5
1   2   3   4   5
1   2   3   4   5
1   2   3   4   5
```

**Input-4**

```
\::\::\:
```

**Output-4**

```
:   :   :
```

---

## Section-1 Problem 3

Write a script to print only the contents inside the multi-line strings from the python file named myscript.py
Note:

1. The multi-line string will start with `"""` and ends with `"""`
2. There will be a single equal sign `=` before starting `"""` and there can be spaces in-between them.
3. There is no text after starting `"""` and before `"""` in the same line.

### Problem

### Prefix

```bash
script() {
```

### Solution

```sed
sed -n '/= *"""/,/"""/ p' myscript.py | grep -v '"""'
```

### Suffix

```bash
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

cat > myscript.py

script 2>&1
```

### Test cases

**Public**

**Input-1**

```
a = """
abcd
"""
```

**Output-1**

```
abcd
```

**Input-2**

```
multi="""
a
b
c t
d 5
"""
```

**Output-2**

```
a
b
c t
d 5
```

**Private**

**Input-1**

```
multi="""
a
b

c t
d 5
"""
```

**Output-1**

```
a
b

c t
d 5
```

**Input-2**

```
a = """
0
"""
```

**Output-2**

```
0
```

**Input-3**

```
ui_2="""
9876432345678
"""
```

**Output-3**

```
9876432345678
```

**Input-4**

```
var= """

-----

"""
```

**Output-4**

```
-----
```

---

## Section-2 Problem-1

A defined region in file is such that the set of lines that starts with the line `# REGION` and ends with the line `# ENDREGION`.

Write an AWK script to print the lines that contain only digits within the defined region.

### Prefix

```bash
script() { echo '
```

### Solution

```awk
/# REGION/, /# ENDREGION/ {
    if ($0 ~ /^[[:digit:]]+$/) {
        print
    }
}
```

### Suffix

```bash
'
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

script > script.awk
cat | awk -f script.awk 2>&1
```

### Test cases

**Public**

**Input-1**

```
# REGION
1a
a long rain
2
# ENDREGION
```

**Output-1**

```
2
```

**Input-2**

```
42
y
# REGION
1
a long rain
2
# ENDREGION
b
1234
```

**Output-2**

```
1
2
```

**Private**

**Input-1**

```
1
a
# REGION
1
a long rain
3
# ENDREGION
a
1
```

**Output-1**

```
1
3
```

**Input-2**

```
1
a
# REGION
1928374
a long rain
3b
# ENDREGION
a
1
b1234
```

**Output-2**

```
1928374
```

**Input-3**

```
1
a
# REGION
1928374
a long rain
3b
# ENDREGION
a
1
b1234
1
a
# REGION
1928374
a long rain
3b
# ENDREGION
a
1
b1234
```

**Output-3**

```
1928374
1928374
```

**Input-4**

```
# REGION
# ENDREGION
# REGION
# ENDREGION
# REGION
# ENDREGION
# REGION
# ENDREGION
```

**Output-4**

```

```

---

## Section-2 Problem-2

Write an AWK script to replace the number from percentage to decimal value if the value ends with the percentage symbol.
Note

- The input data contains only one field
- The decimal places of input percentage is always 2
- The value of input is between 0.00% and 100.00% (ends inclusive)
  Ex:
- `10.13%` to `0.1013`
- `0.48%` to `0.0048`
- `7.46%` to `0.0746`

Hints: From `man awk`

```
gsub(r, s [, t])
    For  each  substring matching the regular expression r in the string t, substitute the string s, and return the number of substitutions.  If  t is not supplied, use $0.  An & in the replacement text is replaced with the text that was actually matched.  Use \& to get a literal &.   (This must  be  typed  as  "\\&";  see  GAWK: Effective AWK Programming for a fuller discussion of the rules for ampersands and  backslashes  in  the replacement text of sub(), gsub(), and gensub().)

sub(r, s [, t])
    Just like gsub(), but replace only the first matching substring.  Return either zero or one.

length([s])
    Return the length of the string s, or the length of $0 if s is not sup‐ plied.  As a non-standard extension, with an array  argument,  length() returns the number of elements in the array.
```

### Prefix

```bash
script() {
```

### Solution

```awk
BEGIN {
    OFS=""
}

$0 !~ /%$/ { print }
/%$/ {
    sub("%", "")
    a=$0
    b=$0
    sub("[.].*", "", a)
    sub(".*[.]", "", b)
    if (length(a) == 1) {
        print "0.0",a,b
    }
    if (length(a) == 2) {
        print "0.",a,b
    }
    if (length(a) == 3) {
        print "1.0000"
    }
}
```

### Suffix

```bash
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

script > script.awk
cat | awk -f script.awk 2>&1
```

### Test cases

**Public**

**Input-1**

```
10.13%
0.01

```

**Output-1**

```
0.1013
0.01
```

**Input-2**

```
0.48%
7.46%

```

**Output-2**

```
0.0048
0.0746
```

**Private**

**Input-1**

```
99.98%
99.88%
```

**Output-1**

```
0.9998
0.9988
```

**Input-2**

```
99

```

**Output-2**

```
99
```

**Input-3**

```
100.00%

```

**Output-3**

```
1.0000
```

**Input-4**

```
0.00%

```

**Output-4**

```
0.0000
```

---

## Section-2 Problem 3

Write a script to find the UIDs of the users belonging to the largest group. Assume there is only one largest group.

The file `group` in the current working directory stores the group information of the system in the format given below

```
groupname:x:GID:members(separated by comma)
```

An example line from `group` file is given below

```
student:x:214:ram,ahmed,robert,seema
```

The file `passwd` in the current working directory contains the user information. The format of the file is given below

```
username:x:UID:GID:description:home_directory:full_path_to_shell
```

Note: sort the output before printing
From `man awk`,

```
split(s, a [, r [, seps] ])
  Split  the string s into the array a and the separators array
  seps on the regular expression r, and return  the  number  of
  fields.   If  r is omitted, FS is used instead.  The arrays a
  and seps are cleared first.  seps[i] is the  field  separator
  matched  by  r  between  a[i]  and  a[i+1].  If r is a single
  space, then leading whitespace in s goes into the extra array
  element  seps[0]  and trailing whitespace goes into the extra
  array element  seps[n],  where  n  is  the  return  value  of
  split(s, a, r, seps).  Splitting behaves identically to field
  splitting, described above.  In particular, if r is a single-
  character  string, that string acts as the separator, even if
  it happens to be a regular expression metacharacter.
```

### Prefix

```bash
script() {
```

### Solution

```bash
awk -F: '
{
    n = split($4, arr, ",")
    if (n > largest_group_count) {
        largest_group_count = n
        largest_group_name = $1
        largest_group_users = $4
    }
}
END {
    split(largest_group_users, arr, ",")
    for (i in arr) {
        print arr[i]
    }
}
' ./group | while read user; do
    grep "^$user:" ./passwd | cut -d: -f3
done | sort
```

### Suffix

```bash
}
```

### Invisible code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

script 2>&1
```

### Test cases

#### Public

**Input 1**

```
student:x:214:ram,ahmed,robert,seema
teacher:x:311:raja,narayan
EOF
ram:x:1001:1001::/home/ram:/usr/bin/bash
ahmed:x:1002:1002::/home/ahmed:/usr/bin/bash
robert:x:1003:1003::/home/robert:/usr/bin/bash
seema:x:1004:1004::/home/seema:/usr/bin/bash
raja:x:1005:1005::/home/raja:/usr/bin/bash
narayan:x:1006:1006::/home/narayan:/usr/bin/bash

```

**Output 1**

```
1001
1002
1003
1004
```

**Input 2**

```
student:x:214:ram,ahmed
teacher:x:311:raja,narayan,robert,seema
EOF
ram:x:1001:1001::/home/ram:/usr/bin/bash
ahmed:x:1002:1002::/home/ahmed:/usr/bin/bash
robert:x:1003:1003::/home/robert:/usr/bin/bash
seema:x:1004:1004::/home/seema:/usr/bin/bash
raja:x:1005:1005::/home/raja:/usr/bin/bash
narayan:x:1006:1006::/home/narayan:/usr/bin/bash

```

**Output 2**

```
1003
1004
1005
1006
```

#### Private

**Input 1**

```
student:x:214:ram,ahmed,robert,seema,arivu
teacher:x:311:raja,narayan
EOF
ram:x:1001:1001::/home/ram:/usr/bin/bash
ahmed:x:1002:1002::/home/ahmed:/usr/bin/bash
robert:x:1003:1003::/home/robert:/usr/bin/bash
seema:x:1004:1004::/home/seema:/usr/bin/bash
raja:x:1005:1005::/home/raja:/usr/bin/bash
narayan:x:1006:1006::/home/narayan:/usr/bin/bash
arivu:x:1007:1007::/home/arivu:/usr/bin/bash

```

**Output 1**

```
1001
1002
1003
1004
1007
```

**Input 2**

```
student:x:214:ram,ahmed
teacher:x:311:raja,narayan,robert,seema,arivu
study_group:x:122:ram,seema,arivu
study_group_5:x:123:ram,seema
EOF
ram:x:1001:1001::/home/ram:/usr/bin/bash
ahmed:x:1002:1002::/home/ahmed:/usr/bin/bash
robert:x:1003:1003::/home/robert:/usr/bin/bash
seema:x:1004:1004::/home/seema:/usr/bin/bash
raja:x:1005:1005::/home/raja:/usr/bin/bash
narayan:x:1006:1006::/home/narayan:/usr/bin/bash
arivu:x:1007:1007::/home/arivu:/usr/bin/bash

```

**Output 2**

```
1003
1004
1005
1006
1007
```

**Input 3**

```
teacher:x:311:raja,narayan,robert,arivu
EOF
ram:x:1001:1001::/home/ram:/usr/bin/bash
ahmed:x:1002:1002::/home/ahmed:/usr/bin/bash
robert:x:1003:1003::/home/robert:/usr/bin/bash
seema:x:1004:1004::/home/seema:/usr/bin/bash
raja:x:1005:1005::/home/raja:/usr/bin/bash
narayan:x:1006:1006::/home/narayan:/usr/bin/bash
arivu:x:1007:1007::/home/arivu:/usr/bin/bash

```

**Output 3**

```
1003
1005
1006
1007
```

**Input 4**

```
study_group:x:122:ram,seema,arivu
study_group_5:x:133:ram,seema
teacher:x:311:raja,narayan
EOF
ram:x:1001:1001::/home/ram:/usr/bin/bash
ahmed:x:1002:1002::/home/ahmed:/usr/bin/bash
robert:x:1003:1003::/home/robert:/usr/bin/bash
seema:x:1004:1004::/home/seema:/usr/bin/bash
raja:x:1005:1005::/home/raja:/usr/bin/bash
narayan:x:1006:1006::/home/narayan:/usr/bin/bash
arivu:x:1007:1007::/home/arivu:/usr/bin/bash

```

**Output 4**

```
1001
1004
1007
```

---

## Section-3 Problem 1

Write a script to rename all the files present in the current working directory with extension based on the file type.

| File Type                 | Extension    |
| ------------------------- | ------------ |
| Bourne-Again shell script | .sh          |
| Python script             | .py          |
| C source                  | .c           |
| other type                | No extension |

Hint: Get the file type using `file` command.

### Prefix

```bash
script() {
```

### Solution

```bash
for f in *; do
    type=$(file $f)
    bash_pat='.*Bourne-Again shell script.*'
    python_pat='.*Python script.*'
    c_pat='.*C source.*'
    if [[ $type =~ $bash_pat ]]; then
        mv "$f" "$f.sh"
    elif [[ "$type" =~ $python_pat ]]; then
        mv "$f" "$f.py"
    elif [[ "$type" =~ $c_pat ]]; then
        mv "$f" "$f.c"
    fi
done
```

### Suffix

```bash
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

cat > myfile

script 2>&1

ls
```

### Test cases

**Public**

**Input-1**

```
#include <stdio.h>

int main() {
    print("Hello World");
    return 0;
}
```

**Output-1**

```
myfile.c
```

**Input-2**

```
#!/usr/bin/python3

print("Hello World")
```

**Output-2**

```
myfile.py
```

**Input-3**

```
#!/usr/bin/bash

echo "Hello World"
```

**Output-3**

```
myfile.sh
```

**Input-4**

```
Hello World
```

**Output-4**

```
myfile
```

**Private**

**Input-1**

```
#include <stdio.h>

int main() {
    print("Hello World");
    return 0;
}
```

**Output-1**

```
myfile.c
```

**Input-2**

```
#!/usr/bin/python3

print("Hello World")
```

**Output-2**

```
myfile.py
```

**Input-3**

```
#!/usr/bin/bash

echo "Hello World"
```

**Output-3**

```
myfile.sh
```

**Input-4**

```
Hello World
```

**Output-4**

```
myfile
```

---

## Section-3 Problem 2

In a computer science project, there is a bash script written to validate the programs written by the students.

- The project was structured such that `main.sh` in the project's root directory takes standard input and provides the standard output that is used for validation.
- The project files are present in the directory `project` that is located in the current working directory.

  ```
  ./project/
  ├── main.sh
  ├── ...
  │   ├── ...
  │   └── ...
  ..
  ```

- The test cases are located in the directory `testcases` that is located in the current working directory.
- The structure of `testcases` directory is given below

  ```
  ./testcases/
  ├── 1/
  │   ├── input.txt
  │   └── output.txt
  ├── 2/
  │   ├── input.txt
  │   └── output.txt
  ├── 3/
  │   ├── input.txt
  │   └── output.txt
  ..
  ```

- The output should be printed to the screen in the format `<test case>,PASS` if the output from the main.sh and test case are same otherwise `<test case>,FAIL` where `<test case>` is the test case number inside `testcases` directory.

### Prefix

```bash
script() {
```

### Solution

```bash
TESTCASE_DIR=../testcases
PROJECT_DIR=./project
cd $PROJECT_DIR
for tc in $TESTCASE_DIR/*; do

    tc_=$(basename $tc)

    bash main.sh < $tc/input.txt > "actual_output_$tc_"
    diff $tc/output.txt "actual_output_$tc_" > /dev/null 2>&1

    if [ $? == 0 ]; then
        echo "$tc_,PASS"
    else
        echo "$tc_,FAIL"
    fi
done
```

### Suffix

```bash
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

c=0
while read line; do
    [ "$line" == "EOF" ] && break
    ((c++))
    mkdir -p ./testcases/$c
    echo $line > ./testcases/$c/input.txt
    read line
    echo $line > ./testcases/$c/output.txt
done

mkdir ./project
cat > ./project/main.sh

script | sort 2>&1
```

### Test cases

**Public**

**Input-1**

```
1
1
2
0
EOF
read n; echo $((n%2))
```

**Output-1**

```
1,PASS
2,PASS
```

**Input-2**

```
1
1
2
1
EOF
read n; echo $((n%2))
```

**Output-2**

```
1,PASS
2,FAIL
```

**Private**

**Input-1**

```
1
1
5
1
EOF
read n; echo $((n%3))
```

**Output-1**

```
1,PASS
2,FAIL
```

**Input-2**

```
100
0
55
5
EOF
read n; echo $((n%10))
```

**Output-2**

```
1,PASS
2,PASS
```

**Input-3**

```
100
0
55
5
56
1
EOF
read n; echo $((n%5))
```

**Output-3**

```
1,PASS
2,FAIL
3,PASS
```

---
