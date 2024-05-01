# System Commands Sep 2023 OPPE-2 Batch-2
## Problem 1
Write a sed script `script.sed` which will remove all lines which have any one of the words "install", "installed" or "status". Use the following text as reference.

**Sample input**
```bash
2022-05-05 15:55:18 purge grub-pc:amd64 2.02-2ubuntu8.23 <none>
2022-05-05 15:55:18 purge grub-legacy-ec2:all 1:1 <none>
2022-05-05 15:55:18 purge grub-common:amd64 2.02-2ubuntu8.23 <none>
2022-05-05 15:55:14 status installed linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status half-installed linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status not-installed linux-virtual:amd64 <none>
2022-05-05 15:55:17 status installed grub-legacy-ec2:all 1:1
2022-05-05 15:55:17 status half-installed grub-legacy-ec2:all 1:1
2022-05-05 15:55:17 status installed os-prober:amd64 1.74ubuntu1
2022-05-05 15:55:17 status half-installed os-prober:amd64 1.74ubuntu1
2022-05-05 15:55:17 status installed grub2-common:amd64 2.02-2ubuntu8.23
2022-05-05 16:13:44 status half-installed libogg0:amd64 1.3.2-1
2022-05-05 16:13:44 install x11-common:all <none> 1:7.7+19ubuntu7.1
2022-05-05 16:13:44 status half-installed x11-common:all 1:7.7+19ubuntu7.1
2022-05-05 16:13:44 install libice6:amd64 <none> 2:1.0.9-2
2022-05-05 16:13:44 status half-installed libice6:amd64 2:1.0.9-2
2022-05-05 16:13:44 install libsm6:amd64 <none> 2:1.2.2-1
2022-05-05 16:13:44 status half-installed libsm6:amd64 2:1.2.2-1
2022-05-05 16:13:44 install fonts-dejavu-core:all <none> 2.37-1
2022-05-05 16:13:44 status half-installed fonts-dejavu-core:all 2.37-1
2022-05-05 16:13:44 install fontconfig-config:all <none> 2.12.6-0ubuntu2
2022-05-05 16:13:44 status half-installed fontconfig-config:all 2.12.6-0ubuntu2
2022-05-05 16:13:44 install libfontconfig1:amd64 <none> 2.12.6-0ubuntu2
2022-05-05 16:13:44 status half-installed libfontconfig1:amd64 2.12.6-0ubuntu2
2022-05-05 16:13:44 install libxrender1:amd64 <none> 1:0.9.10-1
```

**Sample output**
```
2022-05-05 15:55:18 purge grub-pc:amd64 2.02-2ubuntu8.23 <none>
2022-05-05 15:55:18 purge grub-legacy-ec2:all 1:1 <none>
2022-05-05 15:55:18 purge grub-common:amd64 2.02-2ubuntu8.23 <none>
```

### Solution
```sed
/installed\|install\|status/!p
```

## Problem 2
Write a sed script `script.sed` which will remove all html tags. Use the following text as reference to build your sed script.
Assume that the tags close on the same line.

**Sample Input**
```html
A <b>table</b> is an arrangement of <a href="/wiki/Information" title="Information">information</a> or <a href="/wiki/Data" title="Data">data</a>, typically in rows and columns, or possibly in a more complex structure. Tables are widely used in <a href="/wiki/Communication" title="Communication">communication</a>, <a href="/wiki/Research" title="Research">research</a>, and <a href="/wiki/Data_analysis" title="Data analysis">data analysis</a>. Tables appear in print media, handwritten notes, computer software, architectural ornamentation, traffic signs, and many other places. The precise conventions and terminology for describing tables vary depending on the context. Further, tables differ significantly in variety, structure, flexibility, notation, representation and use.<sup id="cite_ref-Fink000_1-0" class="reference"><a href="#cite_note-Fink000-1">[1]</a></sup><sup id="cite_ref-Mcnabb000_2-0" class="reference"><a href="#cite_note-Mcnabb000-2">[2]</a></sup><sup id="cite_ref-Morgan000_3-0" class="reference"><a href="#cite_note-Morgan000-3">[3]</a></sup><sup id="cite_ref-Robey000_4-0" class="reference"><a href="#cite_note-Robey000-4">[4]</a></sup><sup id="cite_ref-Zielinski000_5-0" class="reference"><a href="#cite_note-Zielinski000-5">[5]</a></sup> Information or data conveyed in table form is said to be in <b>tabular</b> format (<a href="https://en.wiktionary.org/wiki/tabular#Adjective" class="extiw" title="wikt:tabular">adjective</a>). In books and technical articles, tables are typically presented apart from the main text in numbered and captioned <a href="/wiki/Floating_block" class="mw-redirect" title="Floating block">floating blocks</a>.
```

**Sample Output**
```bash
A table is an arrangement of information or data, typically in rows and columns, or possibly in a more complex structure. Tables are widely used in communication, research, and data analysis. Tables appear in print media, handwritten notes, computer software, architectural ornamentation, traffic signs, and many other places. The precise conventions and terminology for describing tables vary depending on the context. Further, tables differ significantly in variety, structure, flexibility, notation, representation and use.[1][2][3][4][5] Information or data conveyed in table form is said to be in tabular format (adjective). In books and technical articles, tables are typically presented apart from the main text in numbered and captioned floating blocks.
```

### Solution
```sed
s/<[^>]*>//g
```

## Problem 3
A dpkg log contains the information regarding installed, removed and purged packages. Using the following log for your reference write an AWK script `script.awk` which will list INSTALLED packages, REMOVED packages and PURGED packages with the total installations, removals purges as shown in the standard output.

Note: Use Column 3 to decide the installed/removed package

**Sample Input**
```bash
2022-05-05 15:55:14 startup packages remove
2022-05-05 15:55:14 remove linux-virtual:amd64 4.15.0.176.165 <none>
2022-05-05 15:55:14 remove linux-headers-virtual:amd64 4.15.0.176.165 <none>
2022-05-05 15:55:14 remove linux-headers-generic:amd64 4.15.0.176.165 <none>
2022-05-05 15:55:15 remove linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185 <none>
2022-05-05 15:55:17 startup packages remove
2022-05-05 15:55:17 remove grub-legacy-ec2:all 1:1 <none>
2022-05-05 15:55:17 remove os-prober:amd64 1.74ubuntu1 <none>
2023-12-09 11:57:17 startup packages remove
2023-12-09 11:57:18 remove npm:all 3.5.2-0ubuntu4 <none>
2023-12-09 11:57:18 remove node-gyp:all 3.6.2-1ubuntu1 <none>
2022-05-05 15:55:15 purge linux-image-4.15.0-176-generic:amd64 4.15.0-176.185 <none>
2022-05-05 15:55:15 purge linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185 <none>
2022-05-05 15:55:18 startup packages purge
2022-05-05 15:55:18 purge grub-pc:amd64 2.02-2ubuntu8.23 <none>
2022-05-05 15:55:18 purge grub-legacy-ec2:all 1:1 <none>
2022-05-05 15:55:18 purge grub-common:amd64 2.02-2ubuntu8.23 <none>
2022-05-05 15:55:14 status installed linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status half-installed linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status not-installed linux-virtual:amd64 <none>
2022-05-05 15:55:17 status installed grub-legacy-ec2:all 1:1
2022-05-05 15:55:17 status half-installed grub-legacy-ec2:all 1:1
2022-05-05 15:55:17 status installed os-prober:amd64 1.74ubuntu1
2022-05-05 15:55:17 status half-installed os-prober:amd64 1.74ubuntu1
2022-05-05 15:55:17 status installed grub2-common:amd64 2.02-2ubuntu8.23
2022-05-05 16:13:44 status half-installed libogg0:amd64 1.3.2-1
2022-05-05 16:13:44 install x11-common:all <none> 1:7.7+19ubuntu7.1
2022-05-05 16:13:44 status half-installed x11-common:all 1:7.7+19ubuntu7.1
2022-05-05 16:13:44 install libice6:amd64 <none> 2:1.0.9-2
2022-05-05 16:13:44 status half-installed libice6:amd64 2:1.0.9-2
2022-05-05 16:13:44 install libsm6:amd64 <none> 2:1.2.2-1
2022-05-05 16:13:44 status half-installed libsm6:amd64 2:1.2.2-1
2022-05-05 16:13:44 install fonts-dejavu-core:all <none> 2.37-1
2022-05-05 16:13:44 status half-installed fonts-dejavu-core:all 2.37-1
2022-05-05 16:13:44 install fontconfig-config:all <none> 2.12.6-0ubuntu2
2022-05-05 16:13:44 status half-installed fontconfig-config:all 2.12.6-0ubuntu2
2022-05-05 16:13:44 install libfontconfig1:amd64 <none> 2.12.6-0ubuntu2
2022-05-05 16:13:44 status half-installed libfontconfig1:amd64 2.12.6-0ubuntu2
2022-05-05 16:13:44 install libxrender1:amd64 <none> 1:0.9.10-1
```
**Sample output**
```
linux-virtual:amd64 <none> REMOVED
linux-headers-virtual:amd64 <none> REMOVED
linux-headers-generic:amd64 <none> REMOVED
linux-modules-4.15.0-176-generic:amd64 <none> REMOVED
grub-legacy-ec2:all <none> REMOVED
os-prober:amd64 <none> REMOVED
npm:all <none> REMOVED
node-gyp:all <none> REMOVED
x11-common:all 1:7.7+19ubuntu7.1 INSTALLED
libice6:amd64 2:1.0.9-2 INSTALLED
libsm6:amd64 2:1.2.2-1 INSTALLED
fonts-dejavu-core:all 2.37-1 INSTALLED
fontconfig-config:all 2.12.6-0ubuntu2 INSTALLED
libfontconfig1:amd64 2.12.6-0ubuntu2 INSTALLED
libxrender1:amd64 1:0.9.10-1 INSTALLED
total installed=7; total removed=8
```


### Solution
```awk
/install .*/ {count++; print $4,$6,"INSTALLED"}
/remove .*/ {rcount++; print $4,$6, "REMOVED"}
END {print "total installed=" count "; " "total removed=" rcount}
```

## Problem 4
Leo is a graduate student and works with meteorological data. He has received a file which has rainfall data for each metropolitan city in india. He quickly wants to find which city has received maximum and minimum rainfall each year. Please write an awk script `script.awk` which achieves the same. Use following data as a reference to create the awk script.

**Sample Input**
```html
Year    City          Rainfall (mm)
2020    Mumbai        1500
2020    Delhi         1100
2020    Kolkata       1300
2020    Chennai       1400
2021    Mumbai        1200
2021    Delhi         1000
2021    Kolkata       1100
2021    Chennai       1300
2022    Mumbai        1400
2022    Delhi         1300
2022    Kolkata       1200
2022    Chennai       1500
```

**Sample Output**
```
Year City Max-Rainfall Min-Rainfall
2020 Mumbai 1500 Delhi 1100
2021 Chennai 1300 Delhi 1000
2022 Chennai 1500 Kolkata 1200
```

### Solution
```awk
{
    if (FNR == 1) { next }  # Skip header
    
    if (!max[$1]) {
        max[$1] = $3  # Initialize max rainfall for each year
        max_city[$1] = $2
    } else {
        if ($3 > max[$1]) {
            max[$1] = $3  # Update max rainfall for each year
            max_city[$1] = $2
        }
    }
    
    if (!min[$1]) {
        min[$1] = $3  # Initialize min rainfall for each year
        min_city[$1] = $2
    } else {
        if ($3 < min[$1]) {
            min[$1] = $3  # Update min rainfall for each year
            min_city[$1] = $2
        }
    }
}
END {
    printf("Year City Max-Rainfall Min-Rainfall\n")
    for (year in max) {
        printf("%s %s %d %s %d\n", year, max_city[year], max[year], min_city[year], min[year])
    }
}
```

## Problem 5
A teacher conducts an online objective exam for their course, the students are allowed to submit it multiple times, and the submissions done by the students are in time series format (ordered by timestamp). The format of the data received in a CSV format is given below.

```
timestamp,roll_number,evaluation_details
```

**Sample Input**
```
2023-09-01 09:00:00,1921821,11/20
2023-09-01 09:01:37,1921822,15/20
2023-09-01 09:02:00,1921821,15/20
2023-09-01 09:03:00,1921822,20/20
2023-09-01 09:04:00,1921823,20/25
```

**Sample Output**
```
1921821,75
1921822,100
1921823,80
```

Write a bash script `script.sh` to find the total score of each student and print the output in the format `roll_number, score` sorted by the roll number.

Note:
- The score is calculated by scaling the fraction of evaluation_details to 100.
- The submission with the highest score should be considered for scoring.
- The timestamp is in the format `YYYY-MM-DD HH:MM:SS`
- The submission data is provided as standard input, and the output should be printed to standard output.


### Solution
```bash
#!/bin/bash

awk -F, '{
    split($3, arr, "/")
    score = arr[1] / arr[2] * 100
    if (score > max[$2]) {
        max[$2] = score
    }
} END {
    for (i in max) {
        print i "," max[i]
    }
}' | sort -t, -k1,1
```

## Problem 6
Using the following information as a reference, write a bash script `script.sh` to extract hex colours and the colour values in the parenthesis.

**Sample Input**
```html
<table class="table">
    <tbody><tr>
        <th>Color</th>
        <th>Hex</th>
        <th>RGB</th>
    </tr>
    <tr>
        <td style="background-color:#ff3a2c"></td>
        <td><a href="/color/ff3a2c" title="#ff3a2c color">#ff3a2c</a></td>
        <td>(255,58,44)</td>
    </tr>
    </tbody></table>
```
**Sample Output**
```bash
#ff3a2c: (255,58,44)
```

### Solution
```bash
grep -A1 /color html.text|grep -o "#.\{6\} \|(.*)"|sed 'N;s/\n/:/'
#Alternative
sed -n '/[[:alnum:]]/p':sed 'N;s/\n/:/'
```

```

