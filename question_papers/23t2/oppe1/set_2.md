# System Commands OPPE Set 2

## Problem 1

Write a bash script that adds the total size of only PDF files present in a directory. Assume that the directory only contains files and no subdirectories.

Hint: Use `ls -l` to get the file size information

### Solution

```bash
#!/bin/bash
ls -l *.pdf | tr -s ' ' | cut -d ' ' -f 5 | paste -sd+ | bc
```

### Explanation

- `ls -l *.pdf` lists all the pdf files in the current directory with their size information.
- `tr -s ' '` compresses multiple spaces into a single space.
- `cut -d ' ' -f 5` extracts the size of the file.
- `paste -sd+` concatenates the sizes with a `+` sign.
- `bc` is used to calculate the sum of the sizes.

## Problem 2

A dpkg.log file contains a record of applications installed, removed, upgrade and purge over a period of time. Write a shell script to report the total number of instances when packages are installed, removed, upgraded and purged. A sample of the log file is as follows.
Note: Use Installed, update, remove and purge as the keywords for pattern matching.

```bash
2022-05-05 15:55:14 startup packages remove
2022-05-05 15:55:14 status installed linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 remove linux-virtual:amd64 4.15.0.176.165 <none>
2022-05-05 15:55:14 status half-configured linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status half-installed linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status config-files linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status config-files linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status config-files linux-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status not-installed linux-virtual:amd64 <none>
2022-05-05 15:55:14 status installed linux-headers-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 remove linux-headers-virtual:amd64 4.15.0.176.165 <none>
2022-05-05 15:55:14 status half-configured linux-headers-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:14 status half-installed linux-headers-virtual:amd64 4.15.0.176.165
2022-05-05 15:55:15 status config-files linux-image-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 status config-files linux-image-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 status installed linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 remove linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185 <none>
2022-05-05 15:55:15 status half-configured linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 status half-installed linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 status config-files linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 status config-files linux-modules-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 startup packages configure
2022-05-05 15:55:15 startup packages purge
2022-05-05 15:55:15 purge linux-image-4.15.0-176-generic:amd64 4.15.0-176.185 <none>
2022-05-05 15:55:15 status config-files linux-image-4.15.0-176-generic:amd64 4.15.0-176.185
2022-05-05 15:55:15 status config-files linux-image-4.15.0-176-generic:amd64 4.15.0-176.18
2022-05-05 15:55:17 startup packages remove
2022-05-05 15:55:17 status installed grub-pc:amd64 2.02-2ubuntu8.23
2022-05-05 15:55:17 status installed grub-gfxpayload-lists:amd64 0.7
2022-05-05 15:55:17 status installed grub2-common:amd64 2.02-2ubuntu8.23
2022-05-05 15:55:17 status installed grub-pc-bin:amd64 2.02-2ubuntu8.23
2022-05-05 15:55:17 status installed grub-common:amd64 2.02-2ubuntu8.23
2022-05-05 15:55:17 status installed grub-legacy-ec2:all 1:1
2022-05-05 15:55:17 remove grub-legacy-ec2:all 1:1 <none>
2022-05-05 15:55:17 status half-configured grub-legacy-ec2:all 1:1
```

### Solution

```bash
#!/bin/bash
dpkg_log="dpkg.log"
installed_pkg=$(grep "\b installed\b" "$dpkg_log" -c)
removed_pkg=$(grep -E "[[:digit:]]{2} remove" "$dpkg_log" -c)
purged_pkg=$(grep -E "[[:digit:]]{2} purge" "$dpkg_log" -c)
updated_pkg=$(grep -E "[[:digit:]]{2} update" "$dpkg_log" -c)
echo "Installed packages: $installed_pkg"
echo "Removed packges: $removed_pkg"
echo "Purged packages: $purged_pkg"
echo "Updated packages: $updated_pkg"

```

## Problem 3

Create a file structure as shown below; the commands should not output anything.

```
/potato_recipes/
├── french_fries
│   ├── ingredients.txt
│   └── procedure.txt
├── frites -> french_fries/
└── potato_wedges
    ├── ingredients.txt
    └── procedure.txt
```

- `potato_recipes` is a directory present in the root directory `/`.

- `french_fries` and `potato_wedges` are the directories present inside the directory `potato_recipes`.

- `frites` is a symbolic link to the directory `french_fries`

- `ingredients.txt` inside the directory `potato_wedges` is a hard link to the file `ingredients.txt` inside the directory `french_fries`

- `procedure.txt` are the text file present inside `french_fries` and `potato_wedges`

### Solution

```bash
#!/usr/bin/bash

mkdir -p /potato_recipes/{french_fries,potato_wedges}
touch /potato_recipes/{french_fries,potato_wedges}/procedure.txt
touch /potato_recipes/french_fries/ingredients.txt
ln /potato_recipes/french_fries/ingredients.txt /potato_recipes/potato_wedges/ingredients.txt
ln -s /potato_recipes/french_fries /potato_recipes/frites
```

## Problem 4

Find and print the process ID (PID) of the `ps u` command after execution.
Note: The PID of the last `ps u` command is desired. One may run further processes after this command to get the `ps u` PID.
Hint: Write commands after the command `ps u |tee output.log`

### Solution

```bash
ps u |tee output.log|awk '/ps u$/{print $2}'
```

## Problem 5

Define a bash function `file_type` which uses the `file` command to identify the file type and prints it for all the files present in the current working directory. It is important to note that the `file` command prints the actual file type which can be different from the extension provided. An example usage of the function is shown below.

#### Example

```bash
#output of the file command
file index.txt
index.txt: HTML document, UTF-8 Unicode text, with very long lines

#output of the file_type function based on file command
file_type index.txt
index.txt: HTML document

file_type index.html
index.html: HTML document
```

### Solution

```bash

function file_type()
{
   f_type=$(file $1 |grep ":.*,")
   echo ${f_type%%,*}
}
```

## Problem 6

An HTML file `sample.html` is present in your current working directory. The relevant part of the html file is shown below. Extract the hex code and corresponding color name present such that the output is formatted as the following.

Hint: Decide a delimiting character(s) that helps extract desired fields

**relevant part of the HTML file**

```html
</code></pre>
<p>In the above example, you can see how much data we can provide about a particular color. Take note of the structure and the level of nesting used. You can also use a basic structure to store your data. Take a look at the following examples:</p>
<pre class="language-javascript"><code class="javascript language-javascript"><span class="token punctuation">{</span>
  <span class="token string">"aliceblue"</span><span class="token operator">:</span> <span class="token string">"#f0f8ff"</span><span class="token punctuation">,</span>
  <span class="token string">"antiquewhite"</span><span class="token operator">:</span> <span class="token string">"#faebd7"</span><span class="token punctuation">,</span>
  <span class="token string">"aqua"</span><span class="token operator">:</span> <span class="token string">"#00ffff"</span><span class="token punctuation">,</span>
  <span class="token string">"aquamarine"</span><span class="token operator">:</span> <span class="token string">"#7fffd4"</span><span class="token punctuation">,</span>
  <span class="token string">"azure"</span><span class="token operator">:</span> <span class="token string">"#f0ffff"</span><span class="token punctuation">,</span>
  <span class="token string">"beige"</span><span class="token operator">:</span> <span class="token string">"#f5f5dc"</span><span class="token punctuation">,</span>
  <span class="token string">"bisque"</span><span class="token operator">:</span> <span class="token string">"#ffe4c4"</span><span class="token punctuation">,</span>
  <span class="token string">"black"</span><span class="token operator">:</span> <span class="token string">"#000000"</span><span class="token punctuation">,</span>
  <span class="token string">"blanchedalmond"</span><span class="token operator">:</span> <span class="token string">"#ffebcd"</span><span class="token punctuation">,</span>
  <span class="token string">"blue"</span><span class="token operator">:</span> <span class="token string">"#0000ff"</span><span class="token punctuation">,</span>
  <span class="token string">"blueviolet"</span><span class="token operator">:</span> <span class="token string">"#8a2be2"</span><span class="token punctuation">,</span>
  <span class="token string">"brown"</span><span class="token operator">:</span> <span class="token string">"#a52a2a"</span><span class="token punctuation">,</span>
<span class="token punctuation">}</span>
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
