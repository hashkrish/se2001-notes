# System Commands September 2023 OPPE 1 Set 2

Section 1: 3 problems \* 15 marks
Section 2: 3 problems \* 20 marks

Total: 6 problems, 105 marks

---

## Section 1 - Problem 1

Define a bash function `Determinant2x2` which calculates the determinant of a 2x2 matrix. An example usage of the function is shown below. Assume that the arguments are only integers.

#### Example

```bash
#for following Determinant
#   a =|1  2|
#      |3  4|

$ Determinant2x2 1 2 3 4
-2
```

### Solution

```bash
Determinant2x2() {
a=$1
b=$2
c=$3
d=$4
determinant=$(echo "$a * $d - $b * $c" | bc -l)
echo "$determinant"
}
```

---

## Section 1 - Problem 2

Write a bash script which accepts an integer input and finds all the numbers from one to the number provided which are divisible by 3 and 5.
Make sure that the script checks of the number is integer and is not less than one and exits with exit code 1 if the check fails.

### Solution

```bash

#!/bin/bash
read -p number

if [ $# -eq 0 ]; then
  exit 1
fi

if ! [[ $number =~ ^[0-9]+$ ]] || [ $number -lt 1 ]; then
  exit 1
fi

for ((i = 1; i <= number; i++)); do
  if ((i % 15 == 0)); then
    echo "$i"
  fi
done

```

---

## Section 1 - Problem 3

Write a **shell script** which will

- Read usernames.txt text file with usernames and generate passwords for each username using a hash value generated using shasum command.
- Stores the first ten characters from the output as a password and saves it into a new file `user_passwords.txt`.

Hint:

```
$ shasum --help
Usage: shasum [OPTION]... [FILE]...
Print or check SHA checksums.
With no FILE, or when FILE is -, read standard input.

  -a, --algorithm   1 (default), 224, 256, 384, 512, 512224, 512256
...
```

**Sample Input**

```text
tisha
sumedh
avyan
navya
```

#### Desired Output

```shell
tisha:c0840f4321
sumedh:117045d067
avyan:6951b4a77f
navya:57a84ed47c
```

### Solution

```bash
#!/bin/bash

input_file="usernames.txt"
output_file="user_passwords.txt"

while read -r username; do
  echo "$username:$(tr -d '\n' <<< "$username" | shasum -a 256 | cut -c1-10)"
done < "$input_file" > $output_file
```

### Explanation

- `input_file="usernames.txt"`: Assigns the input file name to a variable.
- `output_file="user_passwords.txt"`: Assigns the output file name to a variable.
- `while read -r username; do`: Reads each line from the input file.
- `tr -d '\n' <<< "$username"`: Removes the newline character from the username.
- `shasum -a 256`: Generates an SHA-256 hash value for the username.
- `cut -c1-10`: Extracts the first ten characters from the hash value.
- `done < "$input_file" > $output_file`: Redirects the output to the output file.

---

## Section 2 - Problem 1 (extract rectangle)

Write a script that will remove the inner rectangle and shrink the outer rectangle to the exact size of inner rectangle and the excess space surrounding the rectangle should be removed. After that fill the inner rectangle with 0 'zero'.

Note:

- The outer rectangle is always made up of asterisks '\*'
- The inner rectangle is always made up of lowercase X 'x'
- The output should not have empty lines before or after rectangle.
- The output should not have spaces to left or right of the rectangle.

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
**************************
*000000000000000000000000*
*000000000000000000000000*
**************************
```

### Solution

```bash
while read -r line; do
    line=${line//\*/ }
    echo "$line"
done |
  grep -oE 'x[x ]+x' |
  tr ' ' '0'
```

---

## Section 2 - Problem 2 (pipes, redirections)

A text file usually contains puctuations, upper case letters. Write a shell script/command which will remove punctuations, convert uppercase letters to lower case and finally convert the space character to newline character in that order. Finally use concepts of sort and uniq commands to print top 5 most frequent words with its count. The content are in file called `text.txt` in current working directory.

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
cat text.txt|tr '[:upper:]' '[:lower:]'|tr -d '[:punct:]'| tr ' ' '\n' | sort | uniq -c | sort -rn | head -10|tail -5

```

---

## Section 2 - Problem 3

Write a grep command which will extract the product name and its price from the following text from file `data.txt`.

**Sample Input**

```
<span class="token punctuation">{</span> <span class="token string">"_id"</span> <span class="token operator">:</span> <span class="token function" <span class="token maybe-class-name">ObjectId</span></span <span class="token punctuation">(</span <span class="token string">"5968dd23fc13ae04d9000002"</span <span class="token punctuation">)</span <span class="token punctuation">,</span> <span class="token string">"product_name"</span> <span class="token operator">:</span> <span class="token string">"Mountain Juniperus ashei"</span <span class="token punctuation">,</span> <span class="token string">"supplier"</span> <span class="token operator">:</span> <span class="token string">"Keebler-Hilpert"</span <span class="token punctuation">,</span> <span class="token string">"quantity"</span> <span class="token operator">:</span> <span class="token number">292</span <span class="token punctuation">,</span> <span class="token string">"unit_cost"</span> <span class="token operator">:</span> <span class="token string">"$8.74"</span> <span class="token punctuation">}</span>
```

**Sample Output**

```
Mountain Juniperus ashei:$8.74
```

### Solution

```bash
grep -E '"product_name.*\$[0-9.]+"' data.txt -o | cut -d'"' -f8,42 --output-delimiter=:
```
