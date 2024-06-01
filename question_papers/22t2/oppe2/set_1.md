# OPPE-2 Set 1

# Section 1 Any 1

## Problem 1 [15 marks]

Write a **sed script** to

- Swap the first and second fields in the given input having field separator as a colon `:`.

- Replace every occurrence of the character `?` if found at the end of a line to `!`.

Note: complete partial tasks for partial marking. Test case description: The input is the input file. And output is the output of running your sed script.

### Prefix

```bash
dir=$RANDOM
while [ -a $dir ]; do dir=$RANDOM; done
mkdir $dir
cd $dir

cat >input.txt
sed '
```

### Solution

```bash
s/^\([^:]*\):\([^:]*\)/\2:\1/
s/?$/!/
```

### Suffix

```bash
' input.txt 2>&1
```

### Test cases

#### Public

**Input-1**

```
This is field 1
There is no field 2 in this line?
Is this field 2? I don't think so.
Does it matter?
It does
Maybe? maybe not
```

**Output-1**

```
This is field 1
There is no field 2 in this line!
Is this field 2? I don't think so.
Does it matter!
It does
Maybe? maybe not
```

**Input-2**

```
This is field1:And now field2:and now3
Is it field1?:Maybe this is field2:is this field3?
this is not field2:is this not field1?: field3 :field4
and?
```

**Output-2**

```
And now field2:This is field1:and now3
Maybe this is field2:Is it field1?:is this field3!
is this not field1?:this is not field2: field3 :field4
and!
```

#### Private

**Input-1**

```
This is field 1
Does it matter?
There is no field 2 in this line?
Is this field 2? I don't think so.
Maybe? maybe not
There is no field 2 in this line?
Is this field 2? I don't think so.
Maybe? maybe not
Maybe? maybe not
```

**Output-1**

```
This is field 1
Does it matter!
There is no field 2 in this line!
Is this field 2? I don't think so.
Maybe? maybe not
There is no field 2 in this line!
Is this field 2? I don't think so.
Maybe? maybe not
Maybe? maybe not
```

**Input-2**

```
field1:field2
1:2
2:1
3:4
field1:field2:field3
1:2:4
2:3:4:5
```

**Output-2**

```
field2:field1
2:1
1:2
4:3
field2:field1:field3
2:1:4
3:2:4:5
```

**Input-3**

```
This is field1:And now field2:and now3
Is it field1?:Maybe this is field2:is this field3?
this is not field2:is this not field1?: field3 :field4
and?
This is field1:And now field2:and now3
Is it field1?:Maybe this is field2:is this field3?
this is not field2:is this not field1?: field3 :field4
Is it field1?:Maybe this is field2:is this field3?
this is not field2:is this not field1?: field3 :field4
why not? why yes?
no:no:yes
```

**Output-3**

```
And now field2:This is field1:and now3
Maybe this is field2:Is it field1?:is this field3!
is this not field1?:this is not field2: field3 :field4
and!
And now field2:This is field1:and now3
Maybe this is field2:Is it field1?:is this field3!
is this not field1?:this is not field2: field3 :field4
Maybe this is field2:Is it field1?:is this field3!
is this not field1?:this is not field2: field3 :field4
why not? why yes!
no:no:yes
```

----

## Problem 2 [15 marks]

Write a **sed script** to

- Replace every three letter abbreviation of day of week to the respective number as given in the table. The abbreviation can be in any case or mixed case

  | Abbreviation(case insensitive match) | Replace with |
  | ------------------------------------ | ------------ |
  | sun                                  | 1            |
  | mon                                  | 2            |
  | tue                                  | 3            |
  | wed                                  | 4            |
  | thu                                  | 5            |
  | fri                                  | 6            |
  | Sat                                  | 7            |

- Change the first and third occurrences of the character `!` to `.`, on each line.

Note: complete partial tasks for partial marking. Test case description: Input is the input file to sed. Output is the output printed on running your sed script.

### Prefix

```bash
dir=$RANDOM
while [ -a $dir ]; do dir=$RANDOM; done
mkdir $dir
cd $dir

cat >input.txt
sed '
```

### Solution

```bash
s/sun/1/gI
s/mon/2/gI
s/tue/3/gI
s/wed/4/gI
s/thu/5/gI
s/fri/6/gI
s/sat/7/gI
s/!/./1
s/!/./2
```

### Suffix

```bash
' input.txt 2>&1
```

### Test cases

#### Public

**Input-1**

```
!!!
!!!!
first! second! third! fourth!
first!
first! second!
third fourth
```

**Output-1**

```
.!.
.!.!
first. second! third. fourth!
first.
first. second!
third fourth
```

**Input-2**

```
first exclamation! now second! now third! and now fourth!
first! second! third! fourth!
sun! mon! tue! wed! sat!
fri
thu
all weeks done!
all weeks! yes ! sunday
done thursday
```

**Output-2**

```
first exclamation. now second! now third. and now fourth!
first. second! third. fourth!
1. 2! 3. 4! 7!
6
5
all weeks done.
all weeks. yes ! 1day
done 5rsday
```

#### Private

**Input-1**

```
first! second! third! fourth!
first!
first! second!
third fourth
!
!!
!!!
!!!!
!!!!!
```

**Output-1**

```
first. second! third. fourth!
first.
first. second!
third fourth
.
.!
.!.
.!.!
.!.!!
```

**Input-2**

```
sun
this is monday
this is tue sday
thursday
friday saturday
sunday to sat done
oops wednesday wed
```

**Output-2**

```
1
this is 2day
this is 3 sday
5rsday
6day 7urday
1day to 7 done
oops 4nesday 4
```

**Input-3**

```
sun
this is monday
this is tue sday
thursday
friday sat
sunday to saturday done
oops wednesday 4
first! second! third! fourth!
first!
first! second!
third fourth
!
!!
!!!
!!!!
!!!!!

first exclamation! now second! now third! and now fourth!
first! second! third! fourth!
sun! mon! tue! wed! sat!
fri
thu
all weeks done!
all weeks! yes ! sunday
done thursday
```

**Output-3**

```
1
this is 2day
this is 3 sday
5rsday
6day 7
1day to 7urday done
oops 4nesday 4
first. second! third. fourth!
first.
first. second!
third fourth
.
.!
.!.
.!.!
.!.!!

first exclamation. now second! now third. and now fourth!
first. second! third. fourth!
1. 2! 3. 4! 7!
6
5
all weeks done.
all weeks. yes ! 1day
done 5rsday
```

----

# Section 2 Any 1

## Problem 1 [20 marks]

Given a file that contains current years board exam scores of students in all the schools in an area.
Each line in the file contains four **comma-separated** fields: school code, roll number of the student, name of the student, and marks in the below format.

`School_code,Student_Roll_no,Name,Marks`

All the fields could be alphanumeric values except the last field `Marks` which is a number less than 500, as the maximum marks of the exam is out of 500.

Write an **AWK script** to print the roll numbers of the toppers of each school.
For example if there is marks details of students of 11 schools of an area in the file, then your output should contain 11 roll numbers in any order, one for each school.

**Test case description:** Input is the contents of the input file.
Your script does not need to read any input.
Output is the expected output from your script.
Your script may print expected roll numbers in any order, evaluation script sorts the input before printing.

### Prefix

```bash
script() {
echo '
```

### Solution

```bash
BEGIN {
  FS=","
}
{
  if ($4 > max[$1]) {
    max[$1] = $4
    max_student[$1] = $2
  }
}
END {
  for (i in max_student) {
    print max_student[i]
  }
}
```

### Suffix

```bash
' > yourscript.awk
awk -f yourscript.awk data | sort
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

while read -r line; do
  [[ $line == "" ]] && break
  echo $line
done > data

script 2>&1
```

### Test cases

#### Public

**Input-1**

```
B,B48428261,Tanya,395
A,A15469349,Ernie,124
B,B15318389,Shon,242
A,A13879754,Alvaro,400
```

**Output-1**

```
A13879754
B48428261
```

**Input-2**

```
D,D33139341,Dwight,60
A,A369253,Harrison,401
D,D7779266,Hattie,491
B,B31354967,Tommie,39
D,D6371719,Brendon,296
D,D24516910,Dwight,267
D,D97274653,Hassan,464
B,B93518088,Anna,274
B,B10154966,Kent,83
B,B5350590,Kent,431
```

**Output-2**

```
A369253
B5350590
D7779266
```

#### Private

**Input-1**

```
A,A562211,Dwight,226
A,A4948836,Dionne,417
A,A5545339,Tyson,388
B,B43874041,Laurel,279
D,D68737194,Hattie,415
B,B54342976,Isaac,267
E,E7887833,Kim,312
B,B61295886,Suzanne,326
B,B70519324,Harrison,24
E,E74147946,Brendon,389
```

**Output-1**

```
A4948836
B61295886
D68737194
E74147946
```

**Input-2**

```
B,B8632595,Imelda,6
E,E68299732,Milford,72
C,C3149843,Deann,203
E,E16876334,Polly,108
D,D2416078,Corrine,457
B,B30397662,Lawrence,264
A,A53966679,Lawrence,337
A,A28243235,Hassan,58
C,C50497734,Kermit,491
B,B18365625,Angelique,52
```

**Output-2**

```
A53966679
B30397662
C50497734
D2416078
E16876334
```

**Input-3**

```
A,A91875283,Rose,232
D,D74353759,Kim,470
A,A759412,Reba,442
D,D9183249,Shirley,328
C,C44633125,Cameron,287
D,D51345966,Helene,278
C,C66401499,Tyson,30
C,C96416778,Shon,279
C,C4516214,Kermit,419
A,A62234326,Keisha,195
```

**Output-3**

```
A759412
C4516214
D74353759
```

**Input-4**

```
B,B5739924,Monica,476
A,A9565664,Laurel,44
B,B0607372,Suzanne,164
E,E5717272,Tommie,334
C,C19168055,Brendon,103
D,D088899,Hattie,420
D,D44794073,Angelique,419
D,D37761740,Elizabeth,77
A,A10401738,Dionne,464
D,D31894432,Ernie,210
```

**Output-4**

```
A10401738
B5739924
C19168055
D088899
E5717272
```

**Input-5**

```
I,I53601184,Isaac,405
H,H21335146,Hattie,273
W,W11359870,Jacklyn,391
M,M1531485,Reba,417
L,L71792319,Dwayne,354
I,I44347630,Dwayne,115
E,E6693048,Alvaro,447
F,F94943963,Shon,34
Q,Q7610816,Sterling,29
W,W6143624,Tyson,333
H,H6444254,Brant,471
A,A17852179,Whitney,8
P,P82685413,Laurel,82
L,L32248215,Brendon,244
W,W31325955,Brant,259
A,A4534288,Shon,295
N,N17473294,Emery,401
I,I49466315,Alvaro,179
V,V91535328,Shirley,313
V,V17879799,Suzanne,100
A,A23806252,Shirley,323
M,M8277082,Elizabeth,265
H,H87832850,Harrison,453
W,W8035400,Sterling,69
V,V72221973,Tommie,216
B,B55362086,Shon,197
A,A15683717,Tommie,166
W,W21262361,Alonzo,216
R,R75266952,Kermit,495
U,U1647676,Polly,269
Q,Q7267781,Rose,98
R,R73555436,Kirby,189
T,T56205998,Alvaro,243
V,V28257738,Kermit,256
U,U793720,Reba,474
H,H50613317,Susan,98
Z,Z4987573,Lauren,350
U,U3964715,Polly,439
B,B8529214,Dwight,463
S,S9985932,Alonzo,186
X,X91358326,Alvaro,186
V,V61865339,Milford,91
H,H4097312,Tyson,471
R,R24281888,Mitch,464
R,R14522387,Imelda,211
Z,Z25855830,Kermit,230
P,P09696,Jacklyn,485
B,B1875031,Emery,41
C,C20665845,Keisha,153
F,F60562040,Rose,39
R,R35495694,Kent,142
S,S15287827,Susan,368
B,B53273118,Laurel,451
I,I42839964,Brendon,448
L,L93484689,Kirby,377
B,B2408620,Shon,248
G,G34884751,Jacklyn,191
I,I69853358,Isaac,265
F,F64399917,Corrine,468
U,U23836730,Shirley,238
Q,Q6423699,Brant,47
A,A064360,Dionne,372
D,D44586327,Beverley,39
S,S3058025,Deann,262
V,V52741134,Dwayne,74
V,V94562672,Anna,46
S,S41663213,Alonzo,178
Y,Y7620598,Milford,139
V,V10224216,Harrison,175
E,E49681195,Lawrence,151
T,T38341216,Alonzo,260
A,A41696145,Mitch,7
J,J569679,Jacklyn,307
F,F25216925,Lawrence,234
W,W8993442,Dwayne,32
D,D75607195,Avery,128
E,E28507114,Kermit,428
V,V40486228,Brendon,78
Y,Y2398940,Dwayne,366
Z,Z38274681,Shirley,401
Z,Z295236,Kent,62
T,T57987570,Beverley,51
V,V808575,Ernie,10
F,F9816355,Tanya,431
C,C29928351,Sterling,361
P,P35793350,Helene,351
V,V75736918,Alvaro,177
S,S2565995,Kelli,473
F,F35533955,Elmo,213
J,J41347728,Rose,206
V,V15452190,Alonzo,55
E,E76921823,Tyson,16
R,R5156258,Sterling,406
R,R41192265,Dwayne,77
R,R6271667,Milford,103
U,U48322176,Brant,309
P,P3245416,Sandy,37
B,B49714397,Kirby,286
H,H14323564,Kim,110
L,L33549020,Lauren,368
```

**Output-5**

```
A064360
B8529214
C29928351
D75607195
E6693048
F64399917
G34884751
H6444254
I42839964
J569679
L93484689
M1531485
N17473294
P09696
Q7267781
R75266952
S2565995
T38341216
U793720
V91535328
W11359870
X91358326
Y2398940
Z38274681
```

----

## Problem 2 [20 marks]

Write an **AWK script** to print the number of user defined functions and the number of calls made to these functions in an input python program file. Functions may or may not contain arguments.

The output consists of two parts

- First line of the output is a number that is the number of user defined functions in the input file.

- Followed by one line for each user defined function counted above, print the number of calls to each function in the format `<function_name>:<number_of_times_called>`.
Just print the function name, not the arguments or brackets, and in the same order they appear in the input file.

E.g. consider the below function definitions in the input file.

```
def function_1(argument1="default"):
 print("something");

def function_2():
 print("This is function_2");
```

If `function_1` is called 3 times and `function_2` is called 4 times and these are the only two user defined functions in the input file then the output from your script should be.

```
2
function_1:3
function_2:4
```

In Python a function is defined using the `def` keyword and is called by using the function name followed by parenthesis. As shown below

**Examples**

```
# This is a comment
# function definition of function_1()
def function_1():
 print("this is a function")

# function call
function_1()
```

**Note**: Assume that there are no recursive calls, and no user defined function will call other user defined functions.
But some test cases may contain string similar to function call in comments that should be ignored for full score.

**Test case description**: Input is the contents of the input file on which your AWK script will be run. Your script does not need to read any input. Output is the output printed by your script.

### Prefix

```bash
script() {
echo '
```

### Solution

```bash
/^[^#]/{
  if ($0 ~ /^def [[:alnum:]_]+\(.*\):$/) {
    split($0, t1)
    split(t1[2], t2, "(")
    fn[t2[1]]=0
  }

  else {
    for (f in fn) {
      if ($0 ~ f"\\(.*\\)") {
        fn[f]++
      }
    }
  }

}

END {
  for (f in fn) { n++; }
  print n
  for (f in fn) { print f":"fn[f]; }
}
```

### Suffix

```bash
' > yourscript.awk
awk -f yourscript.awk data
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

cat > data

script 2>&1
```

### Test cases

#### Public

**Input-1**

```
def function_1(argument1="default"):
  print("something")

def function_2():
  print("This is function_2")

function_1()
function_2()
function_2()
function_1();function_2()
function_1();function_2()
```

**Output-1**

```
2
function_1:3
function_2:4
```

**Input-2**

```
def foo(x):
  return x

def bar():
  return 2

print(bar())
print(foo(bar()))
```

**Output-2**

```
2
foo:1
bar:2
```

#### Private

**Input-1**

```
def a():
  pass

def b():
  pass

def c():
  pass
```

**Output-1**

```
3
a:0
b:0
c:0
```

**Input-2**

```
def a(x):
  pass

def b(x):
  pass

def c(x=0):
  pass

a(b(c()))
```

**Output-2**

```
3
a:1
b:1
c:1
```

**Input-3**

```
def a(x=0):
  pass

def b(x=0):
  pass

def c(x=0):
  pass

a(); b(); c()
```

**Output-3**

```
3
a:1
b:1
c:1
```

**Input-4**

```
def a(x=0):
  pass

def b(x=0):
  pass

def c(x=0):
  pass

def d():
  pass

a()
# This is a call to function b()
b()
c()
```

**Output-4**

```
4
a:1
b:1
c:1
d:0
```

**Input-5**

```
def f(a):
  print(a)
```

**Output-5**

```
1
f:0
```

----

# Section 3 Attempt all

## Problem 1 [15 marks]

A confidential and long text file has to be shared with others.
Before sharing the file, the owner of the file wants to hide some sensitive text.

Write a **sed script** that will print the file after making the below changes.

- If any line contains any of the strings `Password`, `password`, `Address`, `address`, or the line consists of only digits then the entire line should be replaced with the string `##REDACTED##`. Note that the word `REDACTED` is in capitals with two `#` characters on each side in the replaced string.

- Add the line `##CONFIDENTIAL##` before the first and after the last line of the file.
Note that the word `CONFIDENTIAL` is in capitals with two `#` characters on each side, there should be no other characters(including spaces) on this line.

Note: complete partial tasks for partial marking.
Hint: use command like `/pattern/ c string` to replace complete line containing the `pattern` with `string`.
Test case description: The input is the input file.
And output is the output of running your sed script.

### Prefix

```bash
dir=$RANDOM
while [ -a $dir ]; do dir=$RANDOM; done
mkdir $dir
cd $dir

cat >input.txt
sed '
```

### Solution

```bash
1i##CONFIDENTIAL##
/[Pp]assword/c##REDACTED##
/[Aa]ddress/c##REDACTED##
s/^[0-9]\+$/##REDACTED##/
$a##CONFIDENTIAL##
```

### Suffix

```bash
' input.txt 2>&1
```

### Test cases

#### Public

**Input-1**

```
This is a protected file
```

**Output-1**

```
##CONFIDENTIAL##
This is a protected file
##CONFIDENTIAL##
```

**Input-2**

```
This is another proctected file
this contain one protected info
as below
9897623637
and it needs to be redacted.
```

**Output-2**

```
##CONFIDENTIAL##
This is another proctected file
this contain one protected info
as below
##REDACTED##
and it needs to be redacted.
##CONFIDENTIAL##
```

**Input-3**

```
This is random file
which may contain some password
or Passwords
or a lot of information
or some ADDRESSES of people
The address are not public info
Address with capital A is to be replaced
hence they should be protected
some line may contain phone numbers like
9890723742
and these numbers like 9897636279 alone on line
are also protected info and should be hidden
91 9823242345
The above line contains a space along with digits
hence it is not to be replaced. As it is not all digits.
```

**Output-3**

```
##CONFIDENTIAL##
This is random file
##REDACTED##
##REDACTED##
or a lot of information
or some ADDRESSES of people
##REDACTED##
##REDACTED##
hence they should be protected
some line may contain phone numbers like
##REDACTED##
and these numbers like 9897636279 alone on line
are also protected info and should be hidden
91 9823242345
The above line contains a space along with digits
hence it is not to be replaced. As it is not all digits.
##CONFIDENTIAL##
```

#### Private

**Input-1**

```
##CONFIDENTIAL##
This is a protected file
##CONFIDENTIAL##
```

**Output-1**

```
##CONFIDENTIAL##
##CONFIDENTIAL##
This is a protected file
##CONFIDENTIAL##
##CONFIDENTIAL##
```

**Input-2**

```
This is another proctected file
this contain one protected info
as below
9897623637
and it needs to be redacted.
another phone number
9893213738
```

**Output-2**

```
##CONFIDENTIAL##
This is another proctected file
this contain one protected info
as below
##REDACTED##
and it needs to be redacted.
another phone number
##REDACTED##
##CONFIDENTIAL##
```

**Input-3**

```
This is another proctected file
this contain one protected info
as below
9897623637
and it needs to be redacted.
another phone number
9893213738
but not below ones
91 982382378
928923bd923
```

**Output-3**

```
##CONFIDENTIAL##
This is another proctected file
this contain one protected info
as below
##REDACTED##
and it needs to be redacted.
another phone number
##REDACTED##
but not below ones
91 982382378
928923bd923
##CONFIDENTIAL##
```

**Input-4**

```
This is random file
which may contain some password
yes
```

**Output-4**

```
##CONFIDENTIAL##
This is random file
##REDACTED##
yes
##CONFIDENTIAL##
```

**Input-5**

```
This is random file
Address with capital A is to be replaced
last line

```

**Output-5**

```
##CONFIDENTIAL##
This is random file
##REDACTED##
last line
##CONFIDENTIAL##

```

**Input-6**

```
This is random file
yes it is
which may contain some password
or Passwords
or a lot of information
or some ADDRESSES of people
The address are not public info
Address with capital A is to be replaced
hence they should be protected
some line may contain phone numbers like
9890723742
and these numbers like 9897636279 alone on line
are also protected info and should be hidden
91 9823242345
The above contains a space along with digits

```

**Output-6**

```
##CONFIDENTIAL##
This is random file
yes it is
##REDACTED##
##REDACTED##
or a lot of information
or some ADDRESSES of people
##REDACTED##
##REDACTED##
hence they should be protected
some line may contain phone numbers like
##REDACTED##
and these numbers like 9897636279 alone on line
are also protected info and should be hidden
91 9823242345
The above contains a space along with digits
##CONFIDENTIAL##

```

----

## Problem 2 [15 marks]

A student has to submit his data in a text file containing keys on the odd-numbered lines and the corresponding values on the next even-numbered lines, as shown below.

```
key1
value1
key2
value2
key3
value3
```

But the student made a mistake and his file `data.txt` looks like below,

```
value1
key1
value2
key2
value3
key3
```

Write an **AWK script** to print the file `data.txt` after correcting the mistake.
Basically, your AWK script should swap every two consecutive lines in the file.
Assume that the file will always contain even number of lines.

### Prefix

```bash
script() {
echo '
```

### Solution

```bash
NR % 2 == 1 { valueLine = $0 }
NR % 2 == 0 { print $0; print valueLine }
```

### Suffix

```bash
' > yourscript.awk
awk -f yourscript.awk data.txt
}
```

### Invisible Code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do DIR=$RANDOM; done
mkdir $DIR; cd $DIR

cat > data.txt

script 2>&1
```

### Test cases

#### Public

**Input-1**

```
value1
key1
value2
key2
value3
key3

```

**Output-1**

```
key1
value1
key2
value2
key3
value3
```

**Input-2**

```
1
brightness
0.4
volume
0.8
left
0.9
right

```

**Output-2**

```
brightness
1
volume
0.4
left
0.8
right
0.9

```

#### Private

**Input-1**

```
1
a

```

**Output-1**

```
a
1
```

**Input-2**

```
abcdefghijklmnopqrstuvwxyz
lowercase
ABCDEFGHIJKLMNOPQRSTUVWXYZ
UPPERCASE

```

**Output-2**

```
lowercase
abcdefghijklmnopqrstuvwxyz
UPPERCASE
ABCDEFGHIJKLMNOPQRSTUVWXYZ

```

**Input-3**

```
1
1
2
2
3
3
4
4

```

**Output-3**

```
1
1
2
2
3
3
4
4
```

**Input-4**

```
a
a
b
b
c
c
z
z

```

**Output-4**

```
a
a
b
b
c
c
z
z
```

**Input-5**

```
a
A
b
B

```

**Output-5**

```
A
a
B
b
```

----

## Problem 3 [15 marks]

You run a bash utility that regularly creates a lot of files in the directory named `outfiles`.
One file is duplicated many times among these files.
You want to eliminate duplicates and keep only one copy.
We do not know which file is duplicated, but only one file is duplicated that we know.
Except for these duplicates all others are distinct.
Write a **Bash script** that finds all the duplicate files directly under the directory `outfiles` and removes the duplicate files.
Among the duplicate files keep the file whose name appears first in lexicographically sorted order.
i.e. if files `de`, `dgt`, `we` and `bb` are duplicates, keep the file `bb` and remove the files `de`, `dgt` and `we`.

If required use the bash script named `printdup.sh` in your script, which is located in the current working directory.
Run the command `bash printdup.sh outfiles` to print all the duplicate files in the directory `outfiles`.
The output of this command will contain file paths of duplicate files with respect to the current working directory.

E.g. if the files `de`, `dgt`, `we` and `bb` present in the directory `outfiles` are duplicates, then the following will be the output if run under the current working directory.
Note that the files may or may not be sorted lexicographically in the output of `printdup`.

```bash
$ bash printdup.sh outfiles
outfiles/de
outfiles/dgt
outfiles/we
outfiles/bb
```

Note: Do not add/remove/edit any files other than the ones specified in the problem.
Hint:

- To read a file/input line by line in bash use one of the below ways.

  Below will read the file `input.txt` line by line.

```bash
while read line; do
  # commands..
done <input.txt
```

Below will read output from `command1` line by line.

```bash
command1 |
while read line; do
 # commands..
done
```

- Alternatively `xargs` can be used.

**Test case description:** Input is read by the evaluation script, your script does not need to read any input.
First line of input is the list of all duplicate files in the directory `outfiles` and second line of input is the list of all remaining files in the directory `outfiles`.
Your script does not need to print anything.
Expected output is the list of files in the directory `outfiles`, printed by evaluation script after running your script.

### Prefix

```bash
script(){
```

### Solution

```bash
bash printdup.sh outFiles | sort >files.dup

flag=0
while read line; do
  if [[ "$flag" == "0" ]]; then
    flag=1;
    continue;
  fi
  rm $line
done <files.dup

# Alternate solution
# bash printdup.sh outfiles | sort | sed '1d' | xargs rm
```

### Suffix

```bash
}
```

### Invisible Code

```bash
dir=$RANDOM
while [ -a $dir ]; do dir=$RANDOM; done
mkdir $dir
cd $dir

# create printdup.sh
echo "find $1 ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD| sed 's/  */:/g' | cut -d':' -f2 | shuf " >printdup.sh

# create local files
mkdir outfiles
cd outfiles

c=6

# function to create files
read var
files=($var)
for file in ${files[@]}; do
  # calculate no. of lines
  c=$((c+c))
  lines=$(( c%23 ))
  for((i=0;i<$lines;i++));do
    echo $i >>$file
  done
done

# create dupes
read var
files=($var)
file=${files[0]}
c=$((c+c))
lines=$(( c%23 ))
for((i=0;i<$lines;i++));do
  echo $i >>$file
done

len=${#files[@]}
for ((i=1;i<$len;i++)); do
  cp $file ${files[$i]}
done

# unset variables
unset files
unset file
unset var
unset c

cd /$dir

# run script
script 2>&1

cd /$dir/outfiles
ls | sort


```

### Test cases

#### Public

**Input-1**

```
meta.cfg dump1 dump4 log.13 log.net graph dim.s
data.d g.data data.a data.y
```

**Output-1**

```
data.a
dim.s
dump1
dump4
graph
log.13
log.net
meta.cfg

```

**Input-2**

```
meta.cfg dump1 dump4 log.13 log.net graph dim.s
dz.dup dump.d
```

**Output-2**

```
dim.s
dump.d
dump1
dump4
graph
log.13
log.net
meta.cfg

```

#### Private

**Input-1**

```
meta.cfg dump log.13 log.net graph dim.s log.net.1 graph.43
data.d g.data data.y data.aa
```

**Output-1**

```
data.aa
dim.s
dump
graph
graph.43
log.13
log.net
log.net.1
meta.cfg

```

**Input-2**

```
current input main.sh network.log.0  network.log.3 network.log.4 output_out prices1
prices input.txt network.log.1 network.log.2
```

**Output-2**

```
current
input
input.txt
main.sh
network.log.0
network.log.3
network.log.4
output_out
prices1

```

----

## Problem 4 [20 marks]

Consider the network log file named `network.log.0` located in the current working directory, in which all the incoming logs will be appended.
This file can grow in size easily so we want to rotate these log files if the size of the files increases beyond a limit.
Write a **Bash script** that rotates the log file `network.log.0` if its size is greater than 200 bytes as described below.

- If the size is greater than 200 bytes, then

  - Rename the file to `network.log.1`, if `network.log.1` already exists in the current working directory then rename the file to `network.log.2`, if `network.log.2` also exists then rename the file to `network.log.3` and so on.

  - Create a new empty file named `network.log.0` to be used for new incoming logs.

  - And print `ROTATED` on stdin.

- If the size is less than or equal to 200 bytes print the size of the log file `network.log.0` to stdout.
  E.g. if the size of file in bytes is '124' then output should just be a number `124'.

Note: The log files are always rotated using your Bash script, so the rotation will always be in sequence.
i.e. if `network.log.3` exists, then `network.log.1`. `network.log.2` and `network.log.3` will always exist in the current working directory.
You need to find the highest numbered log file and rotate the log based on that.

Hint 1: Bash command `du -b <fileName>` will give the size of the file `<fileName>` in bytes.
The output will contain tab-separated values, the first value will be size in bytes second value will be a filename.
Also, note that the `cut` command's default delimiter is tab character.

Hint 2: If required use the command `sort -n` for numerical sorting.

Example `du` output

```bash
$ du -b network_log
167 network_log
```

**Test case description:** First line of the input contains numbers used by evaluation script.
Your script does not need to read any input.
Output is the output printed by your script if the task is accomplished successfully.

### Prefix

```bash
script() {
```

### Solution

```bash
MAX=200
filename=network.log
size=`du -b $filename.0 | tr -s '\t' ' ' | cut -d' ' -f1`
if [ $size -gt $MAX ]
then
    # The below logic will work only if log files are less than 10
    # count=`ls $filename* | tail -1 | cut -d'.' -f3`

    # So.
    count=`ls $filename* | cut -d'.' -f3 | sort -n | tail -1`

    count=$((count+1))
    mv $filename.0 $filename.$count
    touch $filename.0
    echo "ROTATED"
else
    echo "$size"
fi
```

### Suffix

```bash
}
```

### Invisible Code

```bash
dir=$RANDOM
while [ -a $dir ]; do dir=$RANDOM; done
mkdir $dir
cd $dir

# calculate number of lines
read var
arr=(${var})
PUBLIC=${arr[0]}
times=$(( ${arr[1]} * (${arr[2]}%7) ))

# create file
touch network.log.0
for ((i=0; i<$times; i++));
do
  echo $i >>network.log.0
done

# Created files based on number of times log is rotated.
rno=$(( ${arr[4]} + ${arr[3]} ))
for ((i=1; i<=$rno; i++));
do
  touch network.log.$i
done

# Check if rotation required or not
MAX=200
size=`du -b network.log.0 | tr -s '\t' ' ' | cut -d' ' -f1`
if [ $size -gt $MAX ]; then
  rotate=1
fi

# Run script
script 2>&1

if [[ $rotate -eq 1 ]]; then
  # Check if new log file is created and is empty
  if [[ ! -f network.log.0 ]];then
    echo "1: network.log.0 does not exist."
  fi

  if [[ `wc -c <network.log.0` -gt 0 ]]; then
    echo "2: network.log.0 is not empty."
  fi

  # Check if rotated successfully
  rno=$((rno+1))
  if [[ ! -f network.log.$rno ]]; then
    echo "3: log file not rotated or renamed incorrectly"
    echo "3: Expected network.log.$rno"
  fi
fi
```

### Test cases

#### Public

**Input-1**

```
0 33 2 2 1

```

**Output-1**

```
188

```

**Input-2**

```
0 28 41 0 0

```

**Output-2**

```
ROTATED

```

**Input-3**

```
0 36 5 2 1

```

**Output-3**

```
ROTATED

```

**Input-4**

```
0 82 23 10 1

```

**Output-4**

```
ROTATED

```

#### Private

**Input-1**

```
1 56 6 0 0

```

**Output-1**

```
ROTATED

```

**Input-2**

```
1 8 2 4 2

```

**Output-2**

```
38

```

**Input-3**

```
1 89 16 7 5

```

**Output-3**

```
ROTATED

```

**Input-4**

```
1 35 41 0 0

```

**Output-4**

```
ROTATED

```

----
