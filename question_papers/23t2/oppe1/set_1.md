# System Commands OPPE Set 1

## Problem 1

Write a bash script which calculates the size of the current working directory by adding the size each file. Assume that the directory contains only files and no subdirectories.

Hint: Use `ls -l` get the file size information

### Solution

```bash
#!/bin/bash
ls -l | sed 1d | tr -s ' ' | cut -d ' ' -f 5 | paste -s -d '+' | bc
```

### Explanation

- `ls -l` lists the files in the current directory in long format.
- `sed 1d` removes the first line which does not contain file information.
- `tr -s ' '` squeezes multiple spaces into a single space.
- `cut -d ' ' -f 5` extracts the 5th field which is the file size.
- `paste -s -d '+'` concatenates the file sizes with a `+` delimiter.
- `bc` calculates the sum of the file sizes.

## Problem 2

An authlog is copied from the `/var/log/` directory to the current working directory. Generate a report from the authlog file which reports the failed logins, successful logins, invalid users and sudo access attempts.

**Sample data:**

```
Jul 16 14:13:13 vm212 sshd[444802]: Connection closed by authenticating user 2******* 194.***.***.*** port 59232 [preauth]
Jul 16 14:13:19 vm212 sshd[445097]: Accepted password for 2******* from 194.***.***.*** port 33668 ssh2
Jul 16 14:13:19 vm212 sshd[445097]: pam_unix(sshd:session): session opened for user 2*******(uid=3339) by (uid=0)
Jul 16 14:49:51 vm212 sshd[452702]: Invalid user  from 194.***.***.*** port 48804
Jul 16 14:49:54 vm212 sshd[452702]: Connection closed by invalid user  194.***.***.*** port 48804 [preauth]
Jul 16 14:58:00 vm212 sshd[454221]: Invalid user web from 194.***.***.*** port 44484
Jul 16 14:58:00 vm212 sshd[454221]: pam_unix(sshd:auth): check pass; user unknown
Jul 16 14:58:00 vm212 sshd[454221]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=194.***.***.*** 
Jul 16 14:58:02 vm212 sshd[454221]: Failed password for invalid user web from 194.***.***.*** port 44484 ssh2
Jul 16 14:58:02 vm212 sshd[454221]: Received disconnect from 194.***.***.*** port 44484:11: Bye Bye [preauth]
Jul 19 11:12:52 vm212 sudo: pam_unix(sudo:auth): authentication failure; logname=ubuntu uid=3141 euid=0 tty=/dev/pts/3 ruser=ubuntu rhost=  user=ubuntu
```

### Solution

```bash
#!/bin/bash
auth_log="auth.log"
failed_logins=$(grep "Failed password" "$auth_log" -c)
successful_logins=$(grep "Accepted password" "$auth_log" -c)
invalid_users=$(grep "Invalid user" "$auth_log" -c)
sudo_access=$(grep "sudo:" "$auth_log" -c)
echo "Failed Logins: $failed_logins"
echo "Successful Logins: $successful_logins"
echo "Invalid Users: $invalid_users"
echo "Sudo Access Attempts: $sudo_access"
```

## Problem 3

The current directory contains multiple files(no directories) with different extensions like `.txt`, `.py`, `.m`, etc.,. Write a bash script to organize the files into folders according to their file extensions. The directory names should be same as the file extensions(case sensitive). Example:`file.C` will be moved to the directory named `C`.  Do not print anything from your script.

### Solution

```bash
#!/usr/bin/bash
list_ext=`ls | grep -o "\..*" | sort | uniq | sed "s/\.//"`
for i in $list_ext
do
  mkdir -p $i
  mv *.$i $i
done
```

### Explanation

- `ls | grep -o "\..*"` lists all the files in the current directory and extracts the file extension.
- `sort | uniq` sorts and removes duplicates from the list of file extensions.
- `sed "s/\.//"` removes the `.` from the file extension.
- `mkdir -p $i` creates a directory with the name of the file extension.
- `mv *.$i $i` moves all files with the file extension to the corresponding directory.

## Problem 4

Find and kill all the background sleep processes.

#### Solution

```bash
ps | grep 'sleep' | while read -r pid rest; do kill $pid; done
```

### Explanation

- `ps` lists all the processes.
- `grep 'sleep'` filters the processes with the name `sleep`.
- `while read -r pid rest` reads the process id and the rest of the line.
- `kill $pid` kills the process with the process id.

Alternate Solution #1:

```bash
ps | grep sleep | cut -d ' ' -f2 | xargs kill
```

Alternate Solution #2:

```bash
pkill sleep
```

## Problem 5

You have downloaded a file from the internet. In order to verify the integrity, the website provided a SHA256 checksum for the file. You have to write a function `get-checksum` that takes filename as first argument and will return only the SHA256 checksum of the file.

Hint: `sha256sum` can be used to get SHA256 checksum

### Solution

```bash
get-checksum() {
	sha256sum $1 | cut -d' ' -f1
}
```

## Problem 6

A html file `index.html` is present in your current working directory as shown below. Extract the hex code and corresponding color name present. Part of the relevant html code is as shown below.

Hint: Decide a delimiting character(s) that helps extract desired fields
Note: The color name and color code are on the same line

The output should be formatted as the following.

```html
<pre
  class="language-javascript"
><code class="javascript"><span class="punctuation">{</span>
  <span class="color-name">"aliceblue"</span><span class="punctuation">:</span> <span class="color-code">"#f0f8ff"</span><span class="punctuation">,</span>
  <span class="color-name">"antiquewhite"</span><span class="punctuation">:</span> <span class="color-code">"#faebd7"</span><span class="punctuation">,</span>
  <span class="color-name">"aqua"</span><span class="punctuation">:</span> <span class="color-code">"#00ffff"</span><span class="punctuation">,</span>
  <span class="color-name">"aquamarine"</span><span class="punctuation">:</span> <span class="color-code">"#7fffd4"</span><span class="punctuation">,</span>
  <span class="color-name">"azure"</span><span class="punctuation">:</span> <span class="color-code">"#f0ffff"</span><span class="punctuation">,</span>
  <span class="color-name">"beige"</span><span class="punctuation">:</span> <span class="color-code">"#f5f5dc"</span><span class="punctuation">,</span>
  <span class="color-name">"bisque"</span><span class="punctuation">:</span> <span class="color-code">"#ffe4c4"</span><span class="punctuation">,</span>
  <span class="color-name">"black"</span><span class="punctuation">:</span> <span class="color-code">"#000000"</span><span class="punctuation">,</span>
  <span class="color-name">"blanchedalmond"</span><span class="punctuation">:</span> <span class="color-code">"#ffebcd"</span><span class="punctuation">,</span>
  <span class="color-name">"blue"</span><span class="punctuation">:</span> <span class="color-code">"#0000ff"</span><span class="punctuation">,</span>
  <span class="color-name">"blueviolet"</span><span class="punctuation">:</span> <span class="color-code">"#8a2be2"</span><span class="punctuation">,</span>
  <span class="color-name">"brown"</span><span class="punctuation">:</span> <span class="color-code">"#a52a2a"</span><span class="punctuation">,</span>
<span class="punctuation">}</span>
</code></pre>
```

#### Desired Output

```shell
aliceblue:#f0f8ff
antiquewhite:#faebd7
aqua:#00ffff
aquamarine:#7fffd4
azure:#f0ffff
beige:#f5f5dc
bisque:#ffe4c4
black:#000000
blanchedalmond:#ffebcd
blue:#0000ff
blueviolet:#8a2be2
brown:#a52a2a
```

### Solution

```bash
grep -E '"#[[:alnum:]]{6}"</span><span' index.html|cut -d ">" -f2,6|cut -d'"' -f2,4|tr '"' ':'
```
