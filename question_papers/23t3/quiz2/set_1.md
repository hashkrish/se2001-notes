# System Commands Quiz-2 Set-1

## Question 1 [7]

```bash
$ pwd
/home/pinky
$ cd /var
$ pwd
/var
$ for i in {1..11}; do cd -; done
```

What is the output to the command `pwd` at the end of the execution of the given script? [NAT]

Hint: `cd -` will change the current working directory to the previous current working directory.

### Answer (ignore white space)

/home/pinky

### Explanation

- `cd -` changes the current working directory to the previous working directory.
- When `cd -` is run, the current working directory becomes the new previous working directory.
- If `cd -` is run twice, the current working directory remains same as initial state.
- For any even number of runs of `cd -`, the current working directory remains same as initial state.
- For any odd number of runs of `cd -`, the current working directory becomes the previous working directory.
- In the given script, `cd -` is run 11 times. So, the current working directory will be the previous working directory (`/home/pinky`)

<div style="page-break-after: always;"></div>

**Common data for question 2 to 6**

```bash
mkdir dir1 dir2

echo 0 > file1

ln file1 file1_h1
ln -s file1 file1_s1
ln -s file1 dir1/file1_s2

cd dir1
mv ../file1 .
echo 1 > ../file1
echo 2 > file1
ln -s ../file1 file1_s3
ln -s file1 file1_s4
cd ..

cp file1 dir2/file1
cp file1_s1 dir2/file1_s5
```

## Question 2 [3]

What will be the output of `cat ./dir1/file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

2

<div style="page-break-after: always;"></div>

## Question 3 [3]

What will be the output of `echo 3 > file1_h1; cat ./file1` after the execution of the given script? [NAT]

### Answer

1

<div style="page-break-after: always;"></div>

## Question 4 [3]

What will be the output of `echo 4 > ./dir1/file1_s1; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

1

<div style="page-break-after: always;"></div>

## Question 5 [3]

What will be the output of `echo 5 > ./dir1/file1_s3; cat ./dir1/file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

2

<div style="page-break-after: always;"></div>

## Question 6 [3]

What will be the output of `echo 6 > ./dir1/file1_s3; cat ./file1` after the execution of the given script? [NAT]

### Answer (ignore white space, number)

6

### Explanation

- Symbolic links depend solely on the path, and if the path is changed, the symbolic link will be broken.
- If a new file is kept in the original source file's path, that becomes the new parent file for the symbolic link.
- Relative path if stored in a symbolic link, it will be resolved based on the path of the symbolic link, and not the current working directory.
- Changing parent of a symbolic link will change the content of the symbolic link, and vice-versa.
- Hard links, once created, do not care about the path of the source file.

<div style="page-break-after: always;"></div>

## Question 7 [6]

```bash
$ cat data
1
2
3
4
5
6
7
8
9
10
$ awk '
{
    arr1[NR % 2] += $1
    arr2[$1 % 2] += $1
}
END {
    for (i in arr1) {
        print i, arr1[i] - arr2[i]
    }
}
' data
```

Which of the following option contains the output of the awk command given if the above commands are executed?

(a)

```
0 1
0 0
```

(b)

```
0 1
1 0
```

(c)

```
0 0
1 1
```

(d)

```
0 1
1 1
```

(e)

```
0 0
1 0
```

### Answer (ignore white space, number)

(e)

### Explanation

- `NR` is the number of records processed by `awk`.
- `NR % 2` will be 1 for odd lines and 0 for even lines.
- `$1 % 2` will be 1 for odd numbers and 0 for even numbers.
- `arr1[NR % 2] += $1` will add the number to the array `arr1` based on the line number.
- `arr2[$1 % 2] += $1` will add the number to the array `arr2` based on the number.
- Output of `seq` has same line number as the line content.
- `arr1[i] - arr2[i]` will be 0 always.
- The keys will be 0 and 1, and the values will be 0 for both keys.

<div style="page-break-after: always;"></div>

## Question 8 [8]

What will be the output of the following command? [NAT]

```bash
seq 100 |
    sed 's/\([[:digit:]]\)\1/\1/g' |
    sort -n |
    uniq |
    wc -l
```

Hints:

1. `seq 100` will generate 1 to 100 in each line
2. `-n` option in `sort` command sort numerically
3. `uniq` command will remove the **adjacent** duplicate lines

### Answer

90

### Explanation

- `seq 100` will generate numbers from 1 to 100.
- `sed 's/\([[:digit:]]\)\1/\1/g'` will find numbers that have the same digit repeated and replace it with the digit present only once. Example 11 → 1, 22 → 2, ... 100 → 10
- There are 10 such numbers (11, 22, 33, 44, 55, 66, 77, 88, 99, 100) which have the same digit repeated.
- These numbers are changed to 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, which are already present in the sequence.
- Sorting and removing duplicates will remove those numbers altogether.
- `wc -l` will count the number of lines
- 100 - 10 = 90 unique numbers

<div style="page-break-after: always;"></div>

## Question 9 [8]

```bash
awk '
/^[^0-9].*[0-9]*$/ {
    arr[FILENAME]=arr[FILENAME]":::"$0
}
END {
    for (i in arr) {
        print i, arr[i]
    }
}
' *
```

What will the given AWK command print?
Hint: FILENAME is a default variable have the value of filename

(a) The filename and contains all the lines in the file that starts with numbers

(b) The filename and contains all the lines in the file that ends with numbers

(c) The filename and contains all the lines in the file that starts and ends with numbers

(d) The filename and contains all the lines that has a number in it but not at the beginning

### Answer

(d)

### Explanation

- `FILENAME` is a built-in variable in `awk` which contains the name of the file being processed.
- `/^/` is the start of the line.
- `[^0-9]` is a negated character class that matches any character except a digit.
- `.*` matches any character (except for line terminators) zero or more times.
- `[0-9]*` matches any digit zero or more times.
- `/$/` is the end of the line.
- `/^[^0-9].*[0-9]*$/` will match lines that are non-empty and may have numbers in it but not as the first character.

<div style="page-break-after: always;"></div>

## Question 10 [6]

```bash
[ "a" = "a" ] && [ 1 -ne 2 ]
v1=$?
[[ "a" == "a" && 1 -ne 2 ]]
v2=$?
echo $((v1 + v2))
```

What will be the output from the above script?

(a) 0

(b) 1

(c) 2

(d) -1

### Answer

(a)

### Explanation

- `[ "a" = "a" ]` will evaluate to true and return exit code 0.
- `[ 1 -ne 2 ]` will evaluate to true and return exit code 0.
- `[[ "a" == "a" && 1 -ne 2 ]]` will evaluate to true and return exit code 0.
- `==` and `=` are equivalent in bash.
- `$?` will contain the exit code of the last command.
- `v1` will be 0 and `v2` will be 0.
- `echo $((v1 + v2))` will print 0.

<div style="page-break-after: always;"></div>

## Question 11 [6]

Which of the following sed commands will show only the 6th and 8th line of a file 'index.txt'.

(a) `sed -e '6p' -e '8p' index.txt`

(b) `sed -n '8p;6p' index.txt`

(c) `sed -n -e '6p' -e '8p' index.txt`

(d) `sed -n '6,8p' index.txt`

### Answer

(b), (c)

### Explanation

- `sed -n` will suppress the default output, without this, all lines are printed.
- `6p` will print the 6th line.
- `8p` will print the 8th line.
- `6,8p` will print lines from 6 to 8. Including line 7.

<div style="page-break-after: always;"></div>

## Question 12 [7]

What will the following command do upon execution.
`find /home/users/Documents/ -name '*.doc' | grep -v '102421' | xargs -I{} mv {} /home/Documents/OfficeFiles`

(a) Move all files with doc extension from `Documents` folder whose content matches with 102421 to `OfficeFiles` folder

(b) Move all files with doc extension from `Documents` folder whose content does not match with 102421 to `OfficeFiles` folder

(c) Move all files with doc extension from `Documents` folder whose name matches with 102421 to `OfficeFiles` folder

(d) Move all files with doc extension from `Documents` folder whose name does not match with 102421 to `OfficeFiles` folder

### Answer

(d)

### Explanation

- `find /home/users/Documents/ -name '*.doc'` will find all files with `.doc` extension in `/home/users/Documents/` directory.
- `grep -v '102421'` will exclude lines that contain `102421`.
- `xargs -I{} mv {} /home/Documents/OfficeFiles` will move the files to `/home/Documents/OfficeFiles`.
- The grep happens on the file names, not the content of the files.
- `-v` option in `grep` will exclude lines that contain the pattern.

<div style="page-break-after: always;"></div>

## Question 13 [8]

A html file index.html has the following general format. Identify the correct command from the options which will extract content from `<p>` tags (that is the content between `<p>` and `</p>` and **not the lines with tags**). [MSQ]

**Hint:**

```bash
$ cat data
START_REGION1
START_REGION7
a
b
END_REGION7
END_REGION1
START_REGION2
START_REGION7
1
2
END_REGION7
END_REGION2
$ sed -n '/START_REGION7/,/END_REGION7/p' data
START_REGION7
a
b
END_REGION7
START_REGION7
1
2
END_REGION7
$ sed -n '/START_REGION1/,/END_REGION1/ {/START_REGION7/,/END_REGION7/p}' data
START_REGION7
a
b
END_REGION7
```

**Content of index.html file**

```
<!-- Case 1 -->
<html>
  <head>
    <title>Alphabets</title>
  </head>

  <body>
    <p>
        abcd
    </p>
  </body>
</html>
```

(a) `sed -n "/<p>/,/<\/p>/p" index.html`

(b) `sed -n "/<p>/,/<\/p>/{/<p>/! {/<\/p>/! p}}" index.html`

(c) `sed -n "/<p>/,/<\/p>/{/<p>/!,/<\/p>/! p}" index.html`

(d) `awk '/<p>/,/<\/p>/' index.html|grep -v "<"`

### Answer

(b), (d)

### Explanation

- `sed -n "/<p>/,/<\/p>/p"` will print the lines between `<p>` and `</p>`, including the lines with the tags.
- `sed -n "/<p>/,/<\/p>/{/<p>/! {/<\/p>/! p}}"` will print the lines between `<p>` and `</p>`, excluding the lines with the tags. This is a compound statement, where we first check if the line is between `/<p>/` and `/</p>/`, then check if it is not `/<p>/`, then check if it is not `/</p>/` and only then print the line.
- (c) is not a correct option as the inner statement matches any two lines between `<p>` and `</p>`, and only print the lines between them.
- `awk '/<p>/,/<\/p>/' index.html|grep -v "<"` will print the lines between `<p>` and `</p>`, including the lines with the tags, and then remove the lines with the tags using grep. This only works if the expected lines itself do not contain `<`.

<div style="page-break-after: always;"></div>

## Question 14 [8]

A html file index.html has the following general format. Identify the correct command which will extract content from `<p>` tags (that is the content between `<p>` and `</p>`). [MSQ]

**Hint:**

```bash
$ cat data
START_REGION1
START_REGION7
a
b
END_REGION7
END_REGION1
START_REGION2
START_REGION7
1
2
END_REGION7
END_REGION2
$ sed -n '/START_REGION7/,/END_REGION7/p' data
START_REGION7
a
b
END_REGION7
START_REGION7
1
2
END_REGION7
$ sed -n '/START_REGION1/,/END_REGION1/ {/START_REGION7/,/END_REGION7/p}' data
START_REGION7
a
b
END_REGION7
```

**Content of index.html file**

```
<!-- Case 2 -->
<html>
  <head>
    <title>Alphabets</title>
  </head>

  <body>
    <p>efgh
    </p>
    <p>
    ijkl</p>
  </body>
</html>
```

(a) `sed -n "/<p>/,/<\/p>/p" index.html | sed 's#</?p>##g`

(b) `sed -n "/<p>/,/<\/p>/{/<p>/! {/<\/p>/! p}}" index.html`

(c) `sed -n "/<p>/,/<\/p>/{/<p>/!,/<\/p>/! p}" index.html`

(d) `awk '/<p>/,/<\/p>/' index.html | sed 's#</?p>##g'`

### Answer

(a), (d)

### Explanation

- `sed -n "/<p>/,/<\/p>/p"` will print the lines between `<p>` and `</p>`, including the lines with the tags.
- `sed 's#</?p>##g'` will remove the `<p>` and `</p>` tags.
- The `#` is used as a delimiter in the `s` command to avoid escaping the `/` in the tags.
- Here the lines containing the tag also contain the data, hence the tags need to be removed, not the entire line.

<div style="page-break-after: always;"></div>

## Question 15 [8]

A html file index.html has the following general format. Identify the correct command which will extract content from `<p>` tags (that is the content between `<p>` and `</p>`). [MCQ]

**Hint:**

```bash
$ cat data
START_REGION1
START_REGION7
a
b
END_REGION7
END_REGION1
START_REGION2
START_REGION7
1
2
END_REGION7
END_REGION2
$ sed -n '/START_REGION7/,/END_REGION7/p' data
START_REGION7
a
b
END_REGION7
START_REGION7
1
2
END_REGION7
$ sed -n '/START_REGION1/,/END_REGION1/ {/START_REGION7/,/END_REGION7/p}' data
START_REGION7
a
b
END_REGION7
```

**Content of the index.html file**

```html
<!-- Case 3 -->
<html>
  <head>
    <title>Alphabets</title>
  </head>

  <body>
    <p>mnop</p>
  </body>
</html>
```

(a) `sed -n "/<p>.*<\/p>/p" index.html | sed 's#</?p>##g`

(b) `sed -n "/<p>/,/<\/p>/{/<p>/! {/<\/p>/! p}}" index.html`

(c) `sed -n "/<p>/,/<\/p>/{/<p>/!,/<\/p>/! p}" index.html`

(d) `awk '/<p>.*<\/p>/' index.html | sed 's#</?p>##g'`

### Answer

(a),(d)

### Explanation

- Here the content is present in single line sandwiched between `<p>` and `</p>`.
- We have to extract the content between the tags.
- (a) and (d) print only lines having starting and ending tags, then use `sed` to remove the tags.

<div style="page-break-after: always;"></div>

## Question 16 [6]

How many background processes will be running at the end of 5 seconds after the execution of the following script? [NAT]

```bash
sleep 1 &
echo two &
echo three && echo four || echo five && echo six
sleep 6 &
sleep 2 &
sleep 7 &
sleep 12 &
```

### Answer

3

### Explanation

- All the commands are executed in the background except for the `echo three && echo four || echo five && echo six` command. So they do not block each other.
- They run independently, and after 5 seconds only commands that have time more than 5 seconds will still be running, that is 6, 7, and 12.

<div style="page-break-after: always;"></div>

## Question 17 [7]

The following text is the content of the file `mycpuinfo`

```
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 126
model name    : Intel(R) Core(TM) i5-1035G1 CPU @ 1.00GHz
stepping    : 5
microcode    : 0xb0
cpu MHz        : 1200.000
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 0
cpu cores    : 4
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 27
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust sgx bmi1 avx2 smep bmi2 erms invpcid avx512f avx512dq rdseed adx smap avx512ifma clflushopt intel_pt avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves split_lock_detect dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req avx512vbmi umip pku ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid sgx_lc fsrm md_clear flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid unrestricted_guest vapic_reg vid ple pml ept_mode_based_exec tsc_scaling
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs itlb_multihit srbds mmio_stale_data
bogomips    : 2380.80
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:
```

Select the command(s) that retrieves only the model name of the cpu. The output from the command should be "Intel(R) Core(TM) i5-1035G1 CPU @ 1.00GHz"

**Note:** The option -o of grep will print only the matches, not the entire line.

(a) `grep model name mycpuinfo`

(b) `grep -o "model_name" mycpuinfo`

(c) `grep "model name" mycpuinfo | egrep -o ":.*" | sed 's/://g'`

(d) `grep "model[ ]name" mycpuinfo | egrep -o ":.*" | cut -d: -f2-`

### Answer

(c), (d)

### Explanation

- (a) will not work as there is a space between `model` and `name`, but it is not quoted. It also does not print only the value, but entire line if quoted.
- (b) there is no `model_name` in the file.
- (c) will print the line containing `model name`, then print the part with and after `:`, then remove the `:`. This will print the model name.
- (d) will print the line containing `model name`, then print the part after `:`. This will print the model name.

<div style="page-break-after: always;"></div>
