# System Commands OPPE 1 Set 1

**Pattern**
Best 3(15) from Problem 1 to 4
Best 3(20) from Problem 5 to 8
Total marks 105

---

## Problem 1 [15 marks]

Create a link named `todo` in the current directory that its source is `/todo.txt` such that the link should work after deleting and creating the file `/todo.txt`

### Prefix

```bash
script() {
```

### Solution

```bash
ln -s /todo.txt todo
```

### Suffix

```bash
}
```

### Invisible code

```bash
RANDOM_NUMER=$RANDOM
echo $RANDOM_NUMBER > /todo.txt
mkdir $RANDOM_NUMBER
cd $RANDOM_NUMBER
script 2>&1
rm /todo.txt
touch /todo.txt
VALUE_GOT=$(cat todo)
read line
[[ "$VALUE_GOT" != "$RANDOM_NUMBER" ]] && echo $line || echo Invalid link
```

### Test cases

#### Public

**Input 1**

```
12947
```

**Output 1**

```
12947
```

#### Private

**Input 1**

```
8914292
```

**Output 1**

```
8914292
```

---

## Problem 2 [15 marks]

Write a command to move the file (not directory) that has the extension `.jpg` or `.jpeg` in the current working directory to the directory named `photos` present in the current working directory. Create `photos` directory if it is not present in the current directory.

### Prefix

```bash
script() {
```

### Solution

```bash
[ -d photos ] || mkdir photos
mv *.jpg photos
mv *.jpeg photos
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

while read f; do touch $f; done
[ -f h.mp3 ] && mkdir photos
[ -f 8.mp3 ] && mkdir photos
script 2>&1
ls photos 2>&1
```

### Test cases

#### Public

**Input 1**

```
a.jpg
b.jpg
c.jpg
d.jpeg
e.jpeg
f.mp4
g.j
h.mp3
```

**Output 1**

```
a.jpg
b.jpg
c.jpg
d.jpeg
e.jpeg
```

**Input 2**

```
a.jpg
b.jpgg
c.jppg
d.jpeg
e.jpeg
f.mp4
g.j
h.mp3
i.jkl
```

**Output 2**

```
a.jpg
d.jpeg
e.jpeg
```

#### Private

**Input 1**

```
1.jpg
2.jpg
3.jpg
4.jpeg
5.jpeg
6.mp4
7.j
8.mp3
```

**Output 1**

```
1.jpg
2.jpg
3.jpg
4.jpeg
5.jpeg
```

**Input 2**

```
1.jpg
2.jpgg
3.jppg
4.jpeg
5.jpeg
6.mp4
7.j
8.mp3
9.jkl
```

**Output 2**

```
1.jpg
4.jpeg
5.jpeg
```

**Input 3**

```
a.jpg
b.jpgg
c.jppg
e.jpeg
f.mp4
g.j
```

**Output 3**

```
a.jpg
e.jpeg
```

---

## Problem 3 [15 marks]

Write a script to read an integer from standard input and check for the divisibility of 7 and print `YES <number> <remainder>` if it is divisible else print `NO <number> <remainder>`
Replace the `<number>` with integer read from stdin and `<remainder>` with remainder when divided by 7.

### Prefix

```bash
script() {
```

### Solution

```bash
read n
r=$((n%7))
[[ $r -eq 0 ]] &&
    echo YES $n $r ||
    echo NO $n $r
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
77
```

**Output 1**

```
YES 77 0
```

**Input 2**

```
32
```

**Output 2**

```
NO 32 4
```

#### Private

**Input 1**

```
1
```

**Output 1**

```
NO 1 1
```

**Input 2**

```
9
```

**Output 2**

```
NO 9 2
```

**Input 3**

```
10
```

**Output 3**

```
NO 10 3
```

**Input 4**

```
42
```

**Output 4**

```
YES 42 0
```

**Input 5**

```
41
```

**Output 5**

```
NO 41 6
```

**Input 6**

```
140
```

**Output 6**

```
YES 140 0
```

---

## Problem 4 [15 marks]

Write a bash function `adiff` takes two integers and prints the absolute difference of them.

### Prefix

```bash
adiff() {
```

### Solution

```bash
diff=$(($1-$2))
echo ${diff/-}
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

read a
read b
adiff $a $b 2>&1
```

### Test cases

#### Public

**Input 1**

```
2
1
```

**Output 1**

```
1
```

**Input 2**

```
1
9
```

**Output 2**

```
8
```

#### Private

**Input 1**

```
0
1
```

**Output 1**

```
1
```

**Input 2**

```
0
0
```

**Output 2**

```
0
```

**Input 3**

```
-1
-1
```

**Output 3**

```
0
```

**Input 4**

```
-89
+89
```

**Output 4**

```
178
```

---

## Problem 5 [20 marks]

Write script to move the files from directory `a` to directory `b` if the file in `a` is not present in the directory `b`. Both directory `a` and `b` is present the current working directory.

### Prefix

```bash
script() {
```

### Solution

```bash
cd a
for i in *; do
    [ -f ../b/$i ] || mv $i ../b
done
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

while read fa; do
    [[ $fa == "" ]] && break
    touch $fa
done
while read fb; do
    [[ $fb == "" ]] && break
    touch $fb
done

script 2>&1

echo --files in a--
ls a
echo --files in b--
ls b
```

### Test cases

#### Public

**Input 1**

```
a
b
c
d

1
2
a
b

```

**Output 1**

```
--files in a--
a
b
--files in b--
1
2
a
b
c
d
```

**Input 2**

```
file1
file2

file3

```

**Output 2**

```
--files in a--
--files in b--
file1
file2
file3
```

#### Private

**Input 1**

```
1
2

3
1

```

**Output 1**

```
--files in a--
1
--files in b--
1
2
3
```

**Input 2**

```
a
b

f
g
h

```

**Output 2**

```
--files in a--
--files in b--
a
b
f
g
h
```

**Input 3**

```
1
2

1
2
3

```

**Output 3**

```
--files in a--
1
2
--files in b--
1
2
3
```

**Input 4**

```
1
2
3

1
2
3
a
b
c

```

**Output 4**

```
--files in a--
1
2
3
--files in b--
1
2
3
a
b
c
```

---

## Problem 6 [20 marks]

Extract and print the parent to parent directory of the given file in the variable `MYFILE`. Example: If `MYFILE` had the value `/home/raheem/c-project/main.c` then the parent to parent directory is `/home/raheem/`

Note:

1. The given value is always a file, and it has a parent to parent directory.

### Prefix

```bash
script() {
```

### Solution

```bash
PARENT="${MYFILE%\/*}"
PARENT_TO_PARENT="${PARENT%\/*}"
[ -z "$PARENT_TO_PARENT" ] &&
    echo "/" ||
    echo "$PARENT_TO_PARENT"
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

read MYFILE
script
```

### Test cases

#### Public

**Input 1**

```
/home/raheem/c-project/main.c
```

**Output 1**

```
/home/raheem/
```

**Input 2**

```
/etc/passwd
```

**Output 2**

```
/
```

#### Private

**Input 1**

```
/a/b/c/d/e/f/g/h
```

**Output 1**

```
/a/b/c/d/e/f
```

**Input 2**

```
/a/b/c/d/e/f/g
```

**Output 2**

```
/a/b/c/d/e
```

**Input 3**

```
/etc/ssh/ssh_config
```

**Output 3**

```
/etc
```

**Input 4**

```
/dev/null
```

**Output 4**

```
/
```

---

## Problem 7 [20 marks]

Write a script to read a number from standard input and print the remainder if it is divided by 3.
Hint:

1. If the sum of the digits are divisible by 3 then the number itself divisible by 3.
2. Use `${variable:index:1}` to get the character from the string based on index

### Prefix

```bash
script() {
```

### Solution

```bash
read number
while [[ ${#number} -ne 1 ]]; do
    s=0
    for i in $(seq 0 $((${#number}-1))); do
        n=${number:$i:1}
        s=$((s+n))
    done
    number=$s
done
echo $((number%3))
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
12921
```

**Output 1**

```
0
```

**Input 2**

```
1237814923750237568923465783245923434567899767564532567897665432567789978654356789921351823718293618273512787361298372819754281678497921947821674872180946127841294821947127462184126409876543212345678908754212345678908712345678901234567890123456789012345678902345678901234567890103825761230580123561203571238956123890507132805800321085907312058732186578239157012935782105738256392857803257320856312785917230571203571238057230189753281573102895732805713205713208572813075831205712038570213573128056321085731257
```

**Output 2**

```
1
```

#### Private

**Input 1**

```
4
```

**Output 1**

```
1
```

**Input 2**

```
1237814923750237568923465783245923434567899767564532567897665432567789978654356789921351823718293618273512787361298372819754281678497921947821674872180946127841294821947127462184126409876543212345678908754212345678908712345678901234567890123456789012345678902345678901234567890103825761230580123561203571238956123890507132805800321085907312058732186578239157012935782105738256392857803257320856312785917230571203571238057230189753281573102895732805713205713208572813075831205712038570213573128056321085731256
```

**Output 2**

```
0
```

**Input 3**

```
1237814923750237568923465783245923434567899767564532567897665432567789978654356789921351823718293618273512787361298372819754281678497921947821674872180946127841294821947127462184126409876543212345678908754212345678908712345678901234567890123456789012345678902345678901234567890103825761230580123561203571238956123890507132805800321085907312058732186578239157012935782105738256392857803257320856312785917230571203571238057230189753281573102895732805713205713208572813075831205712038570213573128056321085731256345677
```

**Output 3**

```
2
```

---

## Problem 8 [20 marks]

Write a script to extract and print the link of all anchor tag present in the file index.html
Assume all `a` tags start and end in the same line.
Example: In the text

```
<a href="https://onlinedegree.iitm.ac.in/">IITM BS Degree Programme</a>
```

`https://onlinedegree.iitm.ac.in/` is the link to the site.
Note: Assume the starting a tag and href attribute value will be on the same line.

### Prefix

```bash
script() {
```

### Solution

```bash
grep '<a.*>' index.html | grep -o 'href="[^"]\+"' | cut -d '"' -f2
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

while read line; do
    echo $line
done > index.html

script 2>&1
```

### Test cases

#### Public

**Input 1**

```
<h1>Welcome</h1>
<a href="https://diploma.iitm.ac.in/">IITM Diploma Programme</a>
<a href="https://onlinedegree.iitm.ac.in/">IITM BS Degree Programme</a>
```

**Output 1**

```
https://diploma.iitm.ac.in/
https://onlinedegree.iitm.ac.in/
```

**Input 2**

```
<div>
    <p class="text-primary font-weight-600 pt-0 pb-0 mb-0">
        DEGREE PROGRAM
    </p>
    <h5 class="text-dark mt-0 pt-0">BS in Data Science and Applications</h5>
    <p>Content taught by experienced IIT Madras faculty and industry experts that can be accessed by learners from anywhere with options to exit earlier.</p>

    <a href="https://app.onlinedegree.iitm.ac.in/auth/login?apply_qualifier=true" target="_blank">
        <button class="btn btn-outline-dark p-1" style="font-size: 12px;letter-spacing: 0px;">
            APPLY NOW
        </button>
    </a>

    <hr style="margin-top: 25px;">
    <p class="font-weight-600 pb-0 mb-0" style="color: rgb(15, 108, 164); margin-top: -12px; --darkreader-inline-color:#34a7ec;" data-darkreader-inline-color="">
        DIPLOMA PROGRAM
    </p>
    <h5 class="text-dark mt-0 pt-0">Diploma in Programming / Diploma in Data Science</h5>
    <p>Open to anyone who has completed any UG or at least two years of any UG education.</p>
    <a href="https://diploma.iitm.ac.in/" target="_blank">
        <button class="btn btn-outline-dark p-1" style="font-size: 12px;letter-spacing: 0px;">
            GO TO DIPLOMA WEBSITE
        </button>
    </a>

</div>
```

**Output 2**

```
https://app.onlinedegree.iitm.ac.in/auth/login?apply_qualifier=true
https://diploma.iitm.ac.in/
```

#### Private

**Input 1**

```
<a href="https://www.gnu.org/">GNU</a>

```

**Output 1**

```
https://www.gnu.org/
```

**Input 2**

```
<a href="https://en.wikipedia.org/wiki/GNU_Project">GNU Wiki</a>
```

**Output 2**

```
https://en.wikipedia.org/wiki/GNU_Project
```

**Input 3**

```
<footer id="footer" class="bg-primary py-3">
      <div class="container-fluid container-sm">
        <div class="h5 text-lighter">Contact Us</div>
        <div class="row pt-2 pb-2">
          <div class="col-sm-12 col-md-5 text-lighter">
            <div class="d-flex footer-text">
              <div style="flex-basis: 8%">
                <img style="width: 1rem" src="assets/img/homepage/Footer%20icon-location.svg">
              </div>
              <div style="flex-basis: 90%">
                IITM BS Degree Office, 3rd Floor, ICSR Building,<br>
                IIT Madras, Chennai - 600036
              </div>
            </div>
          </div>
        </div>
        <div class="row pt-2 pb-2">
          <div class="col-sm-12 col-md-5 text-lighter">
            <div class="d-flex footer-text">
              <div style="flex-basis: 8%">
                <img style="width: 1rem" src="assets/img/homepage/Footer%20icon-phone.svg">
              </div>
              <div style="flex-basis: 90%">
                8447748230 (Mon-Fri 9am-6pm)<br>
                support@onlinedegree.iitm.ac.in
              </div>
            </div>
          </div>
        </div>
        <div class="row pt-2 pb-4 border-bottom justify-content-between">
          <div class="col-sm-12 col-md-5 text-lighter">
            <!-- <div class="d-flex footer-text mt-3">
                        <div class="qr-image mr-3" style="height: 100px;width:100px;">
                            <img src="assets/img/homepage/whatsappQR.jpeg" style="height: auto;width:100%;" alt="">
                        </div>
                        <div class="qr-text" style="flex-basis: 40%;margin-right: auto;align-self: center;">
                            Scan QR code to chat
                            with our WhatsApp bot
                            +91 9840776800
                        </div>
                    </div> -->
          </div>
          <div class="d-none d-md-block col-md-6 text-lighter align-self-end">
            <div class="d-flex justify-content-end footer-text">
              View Site Map
            </div>
            <div class="d-flex justify-content-end">
              <small>© IIT Madras. All rights reserved.</small>
            </div>
          </div>
          <div class="d-md-none footer-hidden col-md-12 pt-4">
            <a class="text-decoration-none" href="https://www.facebook.com/iitmadrasbscdegree/" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-facebook.svg" alt="fb" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://instagram.com/iitmadras_bsc?utm_medium=copy_link" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-instagram.svg" alt="ig" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://twitter.com/iitm_bsc" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-twitter.svg" alt="tw" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://www.linkedin.com/company/iit-madras-online-degree-programme" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-linkedin.svg" alt="tw" style="width: 2rem">
            </a>

            <a class="text-decoration-none" href="https://wa.me/message/IVROM2UN7XIJL1" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer icon-whatsapp.svg" alt="tw" style="width: 2rem">
            </a>
          </div>
        </div>
        <div class="py-1 py-md-3 row justify-content-between">
          <div class="d-none d-md-block col-md-6 pt-2">
            <a class="text-decoration-none" href="https://www.facebook.com/iitmadrasbscdegree/" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-facebook.svg" alt="fb" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://instagram.com/iitmadras_bsc?utm_medium=copy_link" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-instagram.svg" alt="ig" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://twitter.com/iitm_bsc" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-twitter.svg" alt="tw" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://www.linkedin.com/company/iit-madras-online-degree-programme" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer%20icon-linkedin.svg" alt="tw" style="width: 2rem">
            </a>
            <a class="text-decoration-none" href="https://wa.me/message/IVROM2UN7XIJL1" target="_blank">
              <img class="mr-1" src="assets/img/homepage/Footer icon-whatsapp.svg" alt="tw" style="width: 2rem">
            </a>
          </div>
          <div class="col-sm-12 col-md-6 d-md-none footer-hidden footer-text-small text-lighter">
            <div class="d-flex justify-content-md-end footer-text">
              View Site Map
            </div>
            <div class="d-flex justify-content-md-end">
              <small>© IIT Madras. All rights reserved.</small>
            </div>
          </div>
          <div class="col-sm-12 col-md-6 d-flex justify-content-md-end">
            <div class="text-lighter">
              <span class="footerLinks footer-text" url="privacy_policy.html" style="cursor: pointer">Privacy Policy</span>
              |
              <span class="footerLinks footer-text" url="tos.html" style="cursor: pointer">Terms of Service</span>
            </div>
          </div>
        </div>
      </div>
    </footer>

```

**Output 3**

```
https://www.facebook.com/iitmadrasbscdegree/
https://instagram.com/iitmadras_bsc?utm_medium=copy_link
https://twitter.com/iitm_bsc
https://www.linkedin.com/company/iit-madras-online-degree-programme
https://wa.me/message/IVROM2UN7XIJL1
https://www.facebook.com/iitmadrasbscdegree/
https://instagram.com/iitmadras_bsc?utm_medium=copy_link
https://twitter.com/iitm_bsc
https://www.linkedin.com/company/iit-madras-online-degree-programme
https://wa.me/message/IVROM2UN7XIJL1
```

**Input 4**

```
<div class="container-fluid container-md mt-3 mb-5 pt-4">
        <h2 class="display-4 text-dark">Learn More Details</h2>
        <div class="row justify-content-lg-around justify-content-md-start">
            <div class="col-sm-12 col-md-6 col-lg-4 pt-1 pb-1">
                <a href="academics.html" class="text-decoration-none" style="cursor: pointer">
                    <div class="bg-light pt-2 pb-2 pr-2 pl-2">
                        <div class="d-flex flex-column justify-content-around">
                            <div class="d-flex justify-content-between mb-1 mt-1">
                                <div class="h4 mb-0 text-secondary font-weight-600">Academics</div>
                                <div class="expand" style="width: 1rem;">
                                    <img src="assets/img/homepage/arrows-right-gold.svg">
                                </div>
                            </div>
                            <div class="text-gray mb-1 mt-1 font-weight-500">
                                <small>Programs, Terms, Course Structure, Syllabus, Instructors, Exam Cities</small>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4 pt-1 pb-1">
                <a href="admissions.html" class="text-decoration-none" style="cursor: pointer">
                    <div class="bg-light pt-2 pb-2 pr-2 pl-2">
                        <div class="d-flex flex-column justify-content-around">
                            <div class="d-flex justify-content-between mb-1 mt-1">
                                <div class="h4 font-weight-600 mb-0 text-secondary">Admissions</div>
                                <div class="expand" style="width: 1rem;">
                                    <img src="assets/img/homepage/arrows-right-gold.svg">
                                </div>
                            </div>
                            <div class="text-gray mb-1 mt-1 font-weight-500">
                                <small>Eligibility, Qualification Process, Fees, Important Dates</small>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4 pt-1 pb-1">
                <div class="h-100 d-flex flex-column justify-content-between">
                    <div class="pb-1">
                        <a href="faq.html" class="text-decoration-none" style="cursor: pointer">
                            <div class="bg-light pt-1 pb-1 pr-2 pl-2">
                                <div class="d-flex justify-content-between mb-1 mt-1">
                                    <div class="h4 mb-0 text-secondary font-weight-600">FAQ</div>
                                    <div class="expand" style="width: 1rem;">
                                        <img src="assets/img/homepage/arrows-right-gold.svg">
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="pt-1">
                        <a href="aboutIITM.html" class="text-decoration-none" style="cursor: pointer">
                            <div class="bg-light pt-1 pb-1 pr-2 pl-2">
                                <div class="d-flex justify-content-between mb-1 mt-1">
                                    <div class="h4 mb-0 text-secondary font-weight-600">About IITM
                                    </div>
                                    <div class="expand" style="width: 1rem;">
                                        <img src="assets/img/homepage/arrows-right-gold.svg">
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
```

**Output 4**

```
academics.html
admissions.html
faq.html
aboutIITM.html
```

---
