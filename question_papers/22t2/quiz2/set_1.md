# Quiz 2

## Question 1

How many background processes will be running after 5 seconds after execution of the script? [NAT]

```bash
sleep 1 &
echo two &
echo three && echo four || echo five
sleep 6 &
sleep 2 &
sleep 12 &
```

### Answer

2

### Explanation

- All the sleep commands are run in the background using the `&` symbol.
- This means all of them start running at the same time.
- After 5 seconds, only the sleep commands with duration more than 5 seconds will be running.
- They are `sleep 6 &` and `sleep 12 &`.

---

## Question 2

The below text is the file `mycpuinfo`

```shell
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

 Select the command that retrieves only the number of cpu cores. The number of cpu cores is given in the text as value to the key "cpu cores". Thus, your output should be "4".

Note: The option -o will print only the matches not the entire line.

(a) `grep cpu mycpuinfo`

(b) `grep -o "cpu cores" mycpuinfo`

(c) `grep "cpu cores" mycpuinfo | egrep -o "[[:digit:]]+"`

(d) `grep -o "cpu cores" mycpuinfo | egrep -o "[[:digit:]]+"`

### Answer

(c)

### Explanation

- The command `grep "cpu cores" mycpuinfo` will print the line containing "cpu cores" from the file `mycpuinfo`.
- Then the command `egrep -o "[[:digit:]]+"` will print only the digits from the output of the previous command.
- If we use `-o` option with `grep`, it will print only the matching part of the line, that is "cpu cores".

---

## Question 3

The below text is the file `mycpuinfo` in the current working directory.

```shell
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

Select the command that retrieves only the number of cpu cores. The number of cpu cores is given in the text as value to the key "cpu cores". Thus, your output should be "4".

Note: The option -n in sed prevent default printing of lines.

(a)

```bash
sed -n '/^cpu/ p' /proc/cpuinfo
```

(b)

```bash
sed 's/cpu cores[[:blank:]]*:[[:blank:]]*//' mycpuinfo |
sed -n '/^[[:digit:]]/ p'
```

(c)

```bash
sed 's/cpu cores[[:blank:]]*:[[:blank:]]*//' mycpuinfo |
sed -n '/[[:digit:]]/ p'
```

(d)

```bash
sed -n '/[[:digit:]]/ p' mycpuinfo |
sed 's/cpu cores[[:blank:]]*:[[:blank:]]*//'
```

### Answer

(b)

### Explanation

- The command `sed 's/cpu cores[[:blank:]]*:[[:blank:]]*//' mycpuinfo` will remove the "cpu cores" and the spaces after it.
- Then the command `sed -n '/^[[:digit:]]/ p'` will print only the lines starting with a digit.
- As all lines are of format `key : value`, and no key starts with a digit, this command will print only the cpu cores value.

---

## Question 4

Select the sed script to pretty print a regular list  from the file `mylist` in such a way that the first and last line have the brackets, and the elements should be indented by a tab.

Note: The tab and newline characters are specified by \t and \n respectively.

**Sample Input**

```
[1,2,3,4]
```

**Sample Output**

```
[
    1,
    2,
    3,
    4
]
```

(a)

```bash
sed 's/\[/\[\n\t/g' mylist |
sed 's/\]/\n]/' |
sed '/^[[:blank:]]\{1,\}/ s/,/,\n\t/g'
```

(b)

```bash
sed 's/\[/\[\n\t/g' mylist |
sed 's/\]/\n]/' |
sed '/^[[:blank:]]\{1,\}/ s/,/,\n\t/'
```

(c)

```bash
sed 's/\[/\[\t\n/g' mylist |
sed 's/\]/\n]/' |
sed '/^[[:blank:]]\{1,\}/ s/,/,\n\t/g'
```

(d)

```bash
sed 's/\[/\[\t\n/g' mylist |
sed 's/\]/\n]/' |
sed '/^[[:blank:]]\{1,\}/ s/,/,\n\t/'
```

### Answer

(a)

### Explanation

- The command `sed 's/\[/\[\n\t/g' mylist` will insert a newline and a tab after `[`.
- The command `sed 's/\]/\n]/'` will insert a newline before `]`.
- The command `sed '/^[[:blank:]]\{1,\}/ s/,/,\n\t/g'` will insert a newline and a tab after each `,` in the lines starting with a tab.

---

## Question 5

```bash
sed -n '/[[:digit:]]\{3\}/ p' myfile
```

What does the above command do?

(a) Prints the line having only three digits

(b) Prints the line having at least three digits

(c) Prints the line having three consecutive digits

(d) Prints the line having at most two consecutive digits

### Answer

(c)

### Explanation

- The command `/[[:digit:]]\{3\}/` will match the lines having three consecutive digits.
- This will result in lines having at least three digits being printed.
- The `-n` option will suppress the default printing of lines.

---

## Question 6

What does the below command print?

```bash
awk 'arr[$0] != 1 {arr[$0]++; print;}' myfile
```

(a) Second occurrences of duplicate lines

(b) Distinct lines in the alphabetically sorted order

(c) Distinct lines in the order of first occurrence

(d) The lines that present more than once.

### Answer

(c)

### Explanation

- The command `arr[$0] != 1` will check if the line is already present in the array.
- If the line is not present, it will be printed and added to the array.
- This will result in the distinct lines in the order of first occurrence being printed.

---

## Question 7

Select the command that prints the lines from 4 to 7 of file `myfile`. Assume that the `myfile` contains at least 7 lines. [MSQ]

(a)

```bash
head -7 myfile | tail -4
```

(b)

```bash
tail -4 myfile | tail -7
```

(c)

```bash
sed -n '4,7 p' myfile
```

(d)

```bash
awk 'NR >= 4 && NR <= 7 {print;}' myfile
```

### Answer

(a), (c), (d)

---

## Question 8

Select the command that prints a line which is the number of lines in the file `myfile`. [MSQ]

Note: NR in AWK is a predefined variable which holds the number of records seen so far.

(a)

```bash
cat myfile | wc -l
```

(b)

```bash
awk 'END { print NR; }' myfile
```

(c)

```bash
awk '{ print NR; }' myfile
```

(d)

```bash
awk 'BEGIN { print NR; }' myfile
```

### Answer

(a), (b)

### Explanation

- The command `cat myfile | wc -l` will print the number of lines in the file `myfile`.
- The `wc -l` command prints the number of lines in the file.
- The command `awk 'END { print NR; }' myfile` will print the number of lines in the file.
  - The `END` block in AWK is executed after processing all the lines in the file.
  - The `NR` variable holds the number of records seen so far.

---

## Question 9

Here is a part of information from AWK manual,

```bash
gsub(r, s [, t])  For each substring matching the regular  expres‐
                  sion r in the string t, substitute the string s,
                  and return the number of substitutions.  If t is
                  not  supplied,  use $0.  An & in the replacement
                  text is replaced with the text that was actually
                  matched.  Use \& to get a literal &.  (This must
                  be typed as "\\&";
```

The contents in the file `myfile` are given below

```
Ram
Laila
Ahmed
Ragav
Peter
```

What will be the output after execution of the below command?

```bash
awk '{
    gsub(/.*/, NR":&");
    print $0;
}' myfile
```

(a)

```
1:Ram
2:Laila
3:Ahmed
4:Ragav
5:Peter
```

(b)

```
NR:Ram
NR:Laila
NR:Ahmed
NR:Ragav
NR:Peter
```

(c)

```
1:
2:
3:
4:
5:
```

(d)

```
1:&
2:&
3:&
4:&
5:&
```

### Answer

(a)

### Explanation

- The command `gsub(/.*/, NR":&")` will replace the entire line with the line number followed by a colon and the line itself.
  - `NR` variable stores the current line number in AWK.
  - `gsub` is used to substitute all occurrences in a line in AWK, similar to sub/g in sed.
  - `/.*/` matches the entire line.
  - `&` in the replacement string of `gsub` refers to the entire match.
  - `NR":&"` concatenates the value of `NR` and `":&"`, where `&` expands to the entire match.

---

## Question 10

```bash
BEGIN {
    FS=","
}
{
    sum = 0
    for (i=1; i<=NF; i++) {
        if ($i ~ /^[-+]?[[:digit:]]+\.?[[:digit:]]*$/) {
            sum += $i
        }
        else {
            print "Invalid data"
            exit 1
        }
    }
    print sum
}
```

Select all correct statement(s) with respect to the above AWK script. [MSQ]

(a) The file to be used is a comma separated file if there is more than one field.

(b) The number of field can be at most 5

(c) If any of the field values is `.123` then `Invalid data` will be printed.

(d) If any of the field values is `+-1.123` then `Invalid data` will be printed.

(e) if any of the fields contain an alphabet then `Invalid data` will be printed.

### Answer

(a), (c), (d), (e)

### Explanation

- The `FS=","` means that the file is comma separated.
- The script checks if each field is a number using the regex `/^[-+]?[[:digit:]]+\.?[[:digit:]]*$/`.
  - `^[-+]?` matches an optional sign at the start.
    - `?` matches zero or one occurrence of the preceding character, not more (d) is correct.
  - `[[:digit:]]+` matches one or more digits, not zero (c) is correct.
  - `\.?` matches an optional dot.
  - `[[:digit:]]*` matches zero or more digits after the dot.
- Any non-numeric field will print `Invalid data` and exit (e) is correct.
- The loop iterates from `1` to `NF`, which is the number of fields in the line.
- This is dynamic and changes for each line, so (b) is incorrect.

---

## Question 11

```bash
BEGIN {
    FS=","
}
{
    sum = 0
    for (i=1; i<=NF; i++) {
        if ($i ~ /^[-+]?[[:digit:]]+\.?[[:digit:]]*$/) {
            sum += $i
        }
        else {
            print "Invalid data"
            exit 1
        }
    }
    print sum
}
```

Select the output to the above AWK script for the file given below. [MSQ]

```
1,2,3
1.1,2.1,3.1
-1.1,2.1,3.1
+1.1,2.1,3.1
a,b,2
.1,89,1
```

(a)

```
Invalid data
```

(b)

```
6
6.3
4.1
6.3
Invalid data
```

(c)

```
6
6.3
4.1
6.3
2
Invalid data
```

(d)

```
6
6.3
4.1
6.3
2
1
```

### Answer

(b)

### Explanation

- The script calculates the sum of the numbers in each line.
- The `exit 1` statement will exit the script if any field is not a number.
- This means if there are multiple wrong fields in a line, only the first one will be printed as `Invalid data`.

---
