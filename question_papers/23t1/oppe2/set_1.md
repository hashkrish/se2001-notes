## Problem 1 (sed)

Write a SED script to add a new column in the beginning with entry "S1" or "S2". "S1" occurs periodically every 3rd line starting from first line, while rest is "S2"

**Sample Input**

```bash
Ajay,Chennai,Sales,40
Mona,Mumbai,Sales,60
Rajan,Patna,Buisness,50
Narayanan,Kochi,Sales,30
Anuj,Pune,Sales,70
Mohan,Jaipur,Buisness,70
Naga,Vizag,Sales,45
Chaitrali,Nagpur,Sales,90
Sanjana,Delhi,Buisness,80
Maitreyi,Bhopal,Sales,30
Sreni,Bangaluru,Sales,20
```

**Sample Output**

```bash
S1,Ajay,Chennai,Sales,40
S2,Mona,Mumbai,Sales,60
S2,Rajan,Patna,Buisness,50
S1,Narayanan,Kochi,Sales,30
S2,Anuj,Pune,Sales,70
S2,Mohan,Jaipur,Buisness,70
S1,Naga,Vizag,Sales,45
S2,Chaitrali,Nagpur,Sales,90
S2,Sanjana,Delhi,Buisness,80
S1,Maitreyi,Bhopal,Sales,30
S2,Sreni,Bangaluru,Sales,20
```

### Solution

```bash
#!/usr/bin/sed -f

1~3! s/^/S2,/
/^S2/! s/^/S1,/
```

---

<div style="page-break-after: always;"></div>

## Problem 2 (sed)

Write a bash script to add serial number as first column to the CSV file `data.csv` and do a in-place replacement (overwrite) the file `data.csv`. The serial number starts with 1 on the first line.

### Solution

```bash
sed -i '=' data.csv ; sed -i 'N; s/\n/,/' data.csv
```

---

<div style="page-break-after: always;"></div>

## Problem 3 (sed)

Write a SED script to mask the first 6 digits of the phone numbers with asterisks, such that only last four digits of phone number of ten digits are visible.

### Solution

```bash
#!/usr/bin/sed -f

s/[[:digit:]]\{6\}\([[:digit:]]\{4\}\)/******\1/
```

---

<div style="page-break-after: always;"></div>

## Problem 4 (AWK)

A folder contains multiple CSV files. Write an AWK script to concatenate these files into one while removing headers(first line) from each CSV file while keeping header from first file intact.

### Solution

```bash
#!/usr/bin/awk -f

NR==1 || (FNR>1)
```

---

<div style="page-break-after: always;"></div>

## Problem 5 (AWK)

A certain data is obtained from a simulation and is saved to a file. The data is a CSV file having three columns, for _time_, _energy1_ and _energy2_ respectively. The first line contains the header information.

Write an AWK script to print a new column _totalenergy_ with the sum of _energy1_ and _energy2_.

**Sample Input**

```
time,energy1,energy2
0,1001,-1500
10,1005,-1650
15,1007,-1734
```

**Sample Output**

```
time,energy1,energy2,totalenergy
0,1001,-1500,-499
10,1005,-1650,-645
15,1007,-1734,-727
```

### Solution

```bash
#!/usr/bin/awk -f
BEGIN {
    FS=","
    OFS=","
}
NR == 1 {
    $(NF+1)="totalenergy"
}
NR > 1 {
    $(NF+1)=$2+$3
}
{
    print $0
}
```

---

<div style="page-break-after: always;"></div>

## Problem 6 (AWK)

Write an AWK script to print average and sample standard of deviation of the energy values for _energy1_, _energy2_ and _total energy_ respectively in the format `mean+/-SD` provided in the sample output.

Hint: The sample standard of deviation formula is,
$$ s = \sqrt{\frac{1}{N-1} \sum\_{i=1}^N (x_i - \overline{x})^2} $$
Where, N is the total number of data points, $x_i$ is the $i^{th}$ data point and $\overline{x}$ is mean of x.

**Sample Input**

```
time,energy1,energy2,totalenergy
0,1001,-1500,-499
10,1005,-1650,-6=45
15,1007,-1734,-727
```

**Sample Output**

```
1004.33+/-3.05505,-1628+/-118.541,-623.667+/-115.487
```

### Solution

```bash
#!/bin/awk -f

BEGIN {
    FS=",";
    OFS=",";
}
NR > 1{
    ene1[NR]=$2;
    ene2[NR]=$3;
    ene3[NR]=$4;
    sum1+=$2;
    sum2+=$3;
    sum3+=$4
}
END{
    ene1avg=sum1/(NR-1);
    ene2avg=sum2/(NR-1);
    ene3avg=sum3/(NR-1);
    for (i in ene1){
        sumsquare1+=(ene1[i]-ene1avg)^2;
        sumsquare2+=(ene2[i]-ene2avg)^2;
        sumsquare3+=(ene3[i]-ene3avg)^2;
    }
    sd1=sqrt(sumsquare1/(NR-2));
    sd2=sqrt(sumsquare2/(NR-2));
    sd3=sqrt(sumsquare3/(NR-2));
    print ene1avg"+/-"sd1, ene2avg"+/-"sd2, ene3avg"+/-"sd3
}
```

---

<div style="page-break-after: always;"></div>

## Problem 7 (bash)

Write a bash script to extract and print the content of the file `myfile` that is present somewhere in the file hierarchy of compressed tar file `data.tar.gz`
Assume there is only one file with the name `myfile`

### Solution

```bash
mkdir out.d
tar xvf data.tar.gz --directory=out.d
find out.d -name 'myfile' -exec cat {} \;
```

---

<div style="page-break-after: always;"></div>

## Problem 8 (bash)

Write a bash script to find the file that is located in the maximum depth in the directory `./data` and print its content.

Assume there is at least on file in the directory `./data` and only file is located in the maximum depth.

**Sample Input Structure**

```
$ tree -F
./
└── data/
    ├── a/
    │   ├── c/
    │   │   └── h
    │   ├── d/
    │   └── g
    ├── b/
    │   ├── c/
    │   └── d/
    └── f

$ cat ./data/f
This is f
$ cat ./data/a/g
This is g
$ cat ./data/a/c/h
This is h
```

**Sample Output**

```
This is h
```

Here, a, b, c, d, and data are the directories, and the f, g and h are the files. Among the files "h" is located in the maximum depth

### Solution

```bash
#!/bin/bash

find data -type f | awk -F'/' 'NF>max{max=NF;file=$0}END{print file}' | xargs cat
```

---
