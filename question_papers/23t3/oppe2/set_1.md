# System Commands Sep 2023 OPPE 2
## Problem 1
In a markdown file, the level of heading is decided by the number of `#` at the beginning of the line. For example, `#` at the beginning of the line indicates a level 1 heading, `##` indicates a level 2 heading and so on. There is a space between `#` and heading text. The sample input shown below conveys the simplicity of the test cases.

Write a SED script 'script.sed'
- To reduce the level of heading by 1, for example `#` to `##` and `##` to `###`
- Add "# Text editors in Linux" as the first line

**Sample Input**
```
# Line Editors
## Ed
---
# Modal Editors
## Vi
## Vim
## Neovim
---
# Non-modal Editors
## Nano
## Emacs
```

**Sample Output**
```
# Text editors in Linux
## Line Editors
### Ed
---
## Modal Editors
### Vi
### Vim
### Neovim
---
## Non-modal Editors
### Nano
### Emacs
```

### Solution
```sed
/^#/ s/^/#/
1 i # Text editors in Linux
```

## Problem 2
A student named Pankaj found the output of the `diff` command confusing. He found two lines that looked the same but were marked as different. He presumed that it could be due to the presence of tab spaces present in the file. He wants to see the line end and tab characters. He decided to replace the tab spaces with "^I" and mark the end of the line with "$" in the files.

Write a **sed script** 'script.sed' to visualize the line end and tab characters by replacing them with `$` and `^I`, respectively.

**Example:**
```bash
$ cat file_a
abcd
efgh

$ cat file_b
efgh
ijkl

$ diff -u file_a file_b
--- file_a	2023-11-27 14:29:47.230882094 +0530
+++ file_b	2023-11-27 14:29:53.640882534 +0530
@@ -1,3 +1,3 @@
 abcd
-efgh
+efgh 
 ijkl
 
$ diff -u file_a file_b | ./script.sed
--- file_a^I2023-11-27 14:29:47.230882094 +0530$
+++ file_b^I2023-11-27 14:29:53.640882534 +0530$
@@ -1,3 +1,3 @@$
 abcd$
-efgh$
+efgh $
 ijkl$
```

### Prefix
```
cat > script.sed << EOF
```

### Solution
```sed
s/$/$/
s/\t/^I/
```

### Suffix
```
EOF
sed -f script.sed
```

### Test Cases

#### Public
##### Test Case 1
**Input**
```
ab	 
```

**Output**
```
ab^I 
```

##### Test Case 2
**Input**
```diff
--- file_a	2023-11-27 14:29:47.230882094 +0530
+++ file_b	2023-11-27 14:29:53.640882534 +0530
@@ -1,3 +1,3 @@
 abcd
-efgh
+efgh 
 ijkl
```

**Output**
```diff
--- file_a^I2023-11-27 14:29:47.230882094 +0530$
+++ file_b^I2023-11-27 14:29:53.640882534 +0530$
@@ -1,3 +1,3 @@$
 abcd$
-efgh$
+efgh $
 ijkl$
```

### Private
```

```

---

## Problem 3
Programmers are used to tag comments in the code with TODO, REVIEW, NOTE, HACK, FIXME, and DEPRECATED keywords. 

Write an **AWK script** 'script.awk' to find all the occurrences in files and print only the filename and line number in the format "<filename>:<line number>".

### Solution
```awk
/TODO|REVIEW|NOTE|HACK|FIXME|DEPRECATED/ {
    print FILENAME":"FNR
}
```


## Problem 4

Docker is a containerization platform that is used to run applications in an isolated environment. Each instance is called a container. We can run multiple containers in a single machine.

Here is a sample output from `docker ps -a` command, which lists all the containers in the machine.

**Sample Input**
```
CONTAINER ID   IMAGE                          COMMAND                  CREATED       STATUS                     PORTS                                       NAMES
fa9130a84431   mongo-express                  "/sbin/tini -- /dock…"   5 days ago    Exited (143) 6 hours ago                                               stock-analyser-mongo-express-1
830b9ccaa6c8   mongo                          "docker-entrypoint.s…"   5 days ago    Exited (0) 6 hours ago                                                 stock-analyser-mongo-1
db00571f20eb   redis                          "docker-entrypoint.s…"   12 days ago   Up 6 hours                 0.0.0.0:6379->6379/tcp, :::6379->6379/tcp   jovial_pasteur
```

Write a **bash script** 'script.sh' to extract the container id, image name, status and name from the output similar to the above and print it in a CSV format such that

- If the string in the STATUS column has the "Up" word in it, then the whole string in the column is replaced with "RUNNING" otherwise "STOPPED".

Note:

- The output from `docker ps -a` will be given as standard input

**Sample Output**
```
CONTAINER ID,IMAGE,STATUS,NAMES
fa9130a84431,mongo-express,STOPPED,stock-analyser-mongo-express-1
830b9ccaa6c8,mongo,STOPPED,stock-analyser-mongo-1
db00571f20eb,redis,RUNNING,jovial_pasteur
```


### Prefix
```
script() {
```

### Solution
```bash
sed 's/    */   /g' |
awk '
    BEGIN {
        FS="[   ]{3}[ ]*"; OFS=","
    } 
    NR == 1 {
        print "CONTAINER ID", "IMAGE", "STATUS", "NAMES"
    }
    $5 ~ "Up" {
        print $1, $2, "RUNNING", $NF
    }
    $5 ~ "Exited" {
        print $1, $2, "STOPPED", $NF
    }
'

# Alternate solution
awk '
    BEGIN {
        OFS=","
    } 
    NR == 1 {
        print "CONTAINER ID", "IMAGE", "STATUS", "NAMES"
    }
    $0 ~ "Up" {
        print $1, $2, "RUNNING", $NF
    }
    $0 ~ "Exited" {
        print $1, $2, "STOPPED", $NF
    }
'
```

### Suffix
```
}
```

### Invisible Code
```

```

### Test Cases
```

```

#### Public
```

```

#### Private

```

```

---

## Problem 5
There are two files `file_a` and `file_b` which contain a list of hash values. 
Write a **bash script** 'script.sh' to find the hash values with the order of their occurrence that are present in either of the files but not in both (eXclusive OR).

**Sample Input**
```bash
$ cat file_a
e5fa44f2
7448d879
a3db5c13
9c6b057a
$ cat file_b
a3db5c13
9c6b057a
5d9474c0
ccf271b7
```

**Sample Output**
```bash
e5fa44f2
7448d879
5d9474c0
ccf271b7
```

### Prefix
```
script() {
cat > script.awk << EOF
```

### Solution
```awk
NR == FNR {
    a[$0] = 1
    next
}
{
    if ($0 in a) {
        delete a[$0]
    } else {
        a[$0] = 1
    }
}
END {
    for (i in a) {
        print i
    }
}

: '
# Another Solution
{flag = 1}
NR == FNR && !a[$0] {a[$0] = 1}
NR != FNR && !a[$0] {a[$0] = 1; flag = 0}
NR != FNR && a[$0] && flag {a[$0] = 0}
END {for (i in a) if (a[i] == 1) print i}
'
```

### Suffix
```
EOF
awk -f script.awk file_a file_b
}
```

### Invisible Code
``` bash
while read -r line; do
    [[ "$line" == EOF ]] && cat > file_2 && break
    echo "$line"
done > file_1 < file_a
\cat file_2 file_1

script 2>&1
```

### Test Cases
```

```

#### Public
```

```

#### Private

```

```

---

## Problem 6

Write a script `script.sh` to analyse the logs given in the file auth.log provided as standard input to print all the usernames to which user student switched to using `su` command.

Note:

- switching back to the previous user should not be accounted.
- A sample auth.log file is provided /opt/se2001/oppe2.1_section_2_problem_2/auth.log

The sample contents of auth.log (stdin) are given below.

```
Jan 21 20:32:17 IITMBSC polkitd(authority=local): Unregistered Authentication Agent for unix-session:c2 (system bus name :1.525, object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8) (disconnected from bus)
Jan 21 20:32:32 IITMBSC login[119373]: pam_unix(login:session): session opened for user guest by LOGIN(uid=0)
Jan 21 20:32:32 IITMBSC systemd-logind[966]: New session 31 of user guest.
Jan 21 20:32:32 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user guest by (uid=0)
Jan 21 20:32:41 IITMBSC login[119373]: pam_unix(login:session): session closed for user guest
Jan 21 20:32:41 IITMBSC systemd-logind[966]: Session 31 logged out. Waiting for processes to exit.
Jan 21 20:32:41 IITMBSC systemd-logind[966]: Removed session 31.
Jan 21 20:32:52 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:32:52 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:32:54 IITMBSC gnome-keyring-daemon[1856]: asked to register item /org/freedesktop/secrets/collection/login/1, but it's already registered
Jan 21 20:32:56 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:32:56 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:33:00 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:33:00 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:33:03 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:33:03 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:34:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 20:34:21 IITMBSC pkexec[128737]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 20:43:12 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:43:12 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:43:16 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:43:16 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:43:19 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 20:43:19 IITMBSC pkexec[130745]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 20:43:19 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:43:19 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:46:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 20:46:21 IITMBSC pkexec[131794]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 20:48:44 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:48:44 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:49:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 20:49:21 IITMBSC pkexec[132770]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 21:03:32 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:03:32 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:03:36 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:03:36 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:03:40 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:03:40 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:03:43 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:03:43 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:04:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 21:04:21 IITMBSC pkexec[136923]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 21:08:53 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:08:53 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:08:57 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:08:57 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:09:00 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:09:00 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:09:07 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:09:07 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:10:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 21:10:21 IITMBSC pkexec[140512]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 21:17:01 IITMBSC CRON[140600]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 21 21:17:01 IITMBSC CRON[140601]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 21 21:17:01 IITMBSC CRON[140600]: pam_unix(cron:session): session closed for user root
Jan 21 21:17:01 IITMBSC CRON[140601]: pam_unix(cron:session): session closed for user root
Jan 21 21:29:12 IITMBSC gdm-password]: gkr-pam: unlocked login keyring
Jan 21 21:30:01 IITMBSC CRON[140874]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 21 21:30:01 IITMBSC CRON[140874]: pam_unix(cron:session): session closed for user root
Jan 21 21:46:13 IITMBSC su: (to guest) student on pts/4
Jan 21 21:46:13 IITMBSC su: pam_unix(su:session): session opened for user guest by student(uid=1000)
Jan 21 21:46:19 IITMBSC su: (to guest2) student on pts/4
Jan 21 21:46:19 IITMBSC su: pam_unix(su:session): session opened for user guest2 by student(uid=1001)
Jan 21 21:46:27 IITMBSC su: (to guest) student on pts/4
Jan 21 21:46:27 IITMBSC su: pam_unix(su:session): session opened for user guest by student(uid=1002)
Jan 21 21:46:37 IITMBSC sudo:   guest : user NOT in sudoers ; TTY=pts/4 ; PWD=/home/student ; USER=root ; COMMAND=/usr/bin/su
Jan 21 21:46:49 IITMBSC su: (to student) student on pts/4
Jan 21 21:46:49 IITMBSC su: pam_unix(su:session): session opened for user student by student(uid=1001)
Jan 21 21:46:56 IITMBSC sudo: student : TTY=pts/4 ; PWD=/home/student ; USER=root ; COMMAND=/usr/bin/su
Jan 21 21:46:56 IITMBSC sudo: pam_unix(sudo:session): session opened for user root by student(uid=0)
Jan 21 21:46:56 IITMBSC su: (to root) student on pts/4
Jan 21 21:46:56 IITMBSC su: pam_unix(su:session): session opened for user root by student(uid=0)
Jan 21 21:47:05 IITMBSC su: (to guest2) student on pts/4
Jan 21 21:47:05 IITMBSC su: pam_unix(su:session): session opened for user guest2 by student(uid=0)
Jan 21 21:47:31 IITMBSC su: pam_unix(su:session): session closed for user guest2
Jan 21 21:47:31 IITMBSC su: pam_unix(su:session): session closed for user root
Jan 21 21:47:31 IITMBSC sudo: pam_unix(sudo:session): session closed for user root
Jan 21 21:47:31 IITMBSC su: pam_unix(su:session): session closed for user student
Jan 21 21:47:31 IITMBSC su: pam_unix(su:session): session closed for user guest
Jan 21 21:47:32 IITMBSC su: pam_unix(su:session): session closed for user guest2
Jan 21 21:47:32 IITMBSC su: pam_unix(su:session): session closed for user guest
Jan 21 21:47:38 IITMBSC gnome-keyring-daemon[1856]: asked to register item /org/freedesktop/secrets/collection/login/1, but it's already registered
Jan 21 21:47:43 IITMBSC su: (to guest2) student on pts/4
Jan 21 21:47:43 IITMBSC su: pam_unix(su:session): session opened for user guest2 by student(uid=1000)
Jan 21 21:47:48 IITMBSC su: (to guest) student on pts/4
Jan 21 21:47:48 IITMBSC su: pam_unix(su:session): session opened for user guest by student(uid=1002)
Jan 21 21:47:49 IITMBSC su: pam_unix(su:session): session closed for user guest
Jan 21 21:47:49 IITMBSC su: pam_unix(su:session): session closed for user guest2
Jan 21 21:48:44 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:48:44 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:49:14 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:49:14 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:49:17 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:49:17 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:49:20 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:49:20 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:49:23 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 21:49:23 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 21:52:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 21:52:21 IITMBSC pkexec[146922]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
```
### Prefix
```

```

### Solution
```bash
egrep "\bsu\b" myauth.log |
    grep -v FAILED |
    egrep "\(to .*\)" -o |
    egrep "\b\w*\b" -o |
    grep -v to

# Alternate Solution
awk -F'[ )]' '/\bsu\b/ && $0 !~ /FAILED/ {print $7}'
```

### Suffix
```

```

### Invisible Code
```

```

### Test Cases
```

```

#### Public
```

```

### Private
```

```

--- 

    
