# System Commands Sep-2024 Quiz-1 Set-1

## Question 1 [6]

```bash
mkdir -p site/public; touch site/public/index.html
touch site/public/style.css
mkdir site/private site/static; touch site/static/image.png
rmkdir site/static
```

Select the output from the above script. [MCQ]

**Hint**

```bash
MKDIR(1)                                                           User                                                           MKDIR(1)

NAME
       mkdir - **make** directories

SYNOPSIS
       mkdir [OPTION]... DIRECTORY...

DESCRIPTION
       Create the DIRECTORY(ies), **if** they **do** not already exist.

       ...
       -p, --parents
              no error **if** existing, **make** parent directories as needed
       ...
```

(a) Remove directory `static`

(b) Remove directory `site` and `static`

(c) Remove files from `static`

(d) Exit with error code

### Answer

(d)

## Question 2 [6]

What will be the output of the following command? [MCQ]

```bash
echo {1..3}-file_{A..C}
```

(a) `1-file_A 1-file_B 1-file_C 2-file_A 2-file_B 2-file_C 3-file_A 3-file_B 3-file_C`

(b) `1 2 3 - file A B C`

(c) `{1..3}-file_{A..C}`

(d) `1..3-file_A..C`

### Answer

(a)

## Question 3 [6]

Which of the following actions will delete the 7th line and save and exit in a `vi` editor or `emacs` editor? [MCQ]

(a)

```bash
$ vi filename.txt
:7 # all following commands in vi editor
dd # delete the line
:wq

$ emacs filename.txt
M-g g 7 # go to the 7th line
C-k # delete the line
C-x C-s # save the file
C-x C-c # exit Emacs
```

(b)

```bash
$ vi filename.txt
7 # all following commands in vi editor
D # delete the line
:wq

$ emacs filename.txt
C-x 7 # go to the 7th line
C-k # delete the line
C-x C-s # save the file
C-x C-c # exit Emacs
```

(c)

```bash
$ vi filename.txt
:7 # all following commands in vi editor
D # delete the line
:wq!

$ emacs filename.txt
M-7 # go to the 7th line
C-d # delete the line
C-x C-s # save the file
C-x C-c # exit Emacs
```

(d)

```bash
$ vi filename.txt
:7 # all following commands in vi editor
dd # delete the line
:w

$ emacs filename.txt
M-g g 7 # go to the 7th line
C-d # delete the line
C-x C-s # save the file
C-x C-c # exit Emacs
```

### Answer

(a)

## Question 4 [8]

Which of the following command sequences will ensure that both stdout and stderr are written to `output.log` and also displayed in the terminal? [MCQ]

(a) `command 2>&1 | tee output.log`

(b) `command | tee output.log 2>&1`

(c) `command &> output.log | tee output.log`

(d) `command > output.log 2>&1 | tee output.log`

### Answer

(a)

## Question 5 [8]

You receive a **"Host key verification failed"** error when trying to SSH into a remote VM. Which `ssh-keygen` command would you use to remove the old host key? [MCQ]

### Hint

**Excerpts from MAN page of `ssh-keygen` command**

```text
DESCRIPTION
     ssh-keygen generates, manages and converts authentication keys for
     ssh(1).  ssh-keygen can create keys for use by SSH protocol version
     2.

     The type of key to be generated is specified with the -t option. If
     invoked without any arguments, ssh-keygen will generate an RSA
     key.

     ssh-keygen is also used to generate groups for use in Diffie-Hellman
     group exchange (DH-GEX).  See the MODULI GENERATION section for
     details.

     Finally, ssh-keygen can be used to generate and update Key Revocation
     Lists, and to test whether given keys have been revoked by one.
     See the KEY REVOCATION LISTS section for details.

     Normally each user wishing to use SSH with public key authentication
     runs this once to create the authentication key in ~/.ssh/id_dsa,
     ~/.ssh/id_ecdsa, ~/.ssh/id_ecdsa_sk, ~/.ssh/id_ed25519,
     ~/.ssh/id_ed25519_sk or ~/.ssh/id_rsa. Additionally, the system
     administrator may use this to generate host keys.

     Normally this program generates keys and asks for a file in which to
     store the private key. The public key is stored in a file with the
     same name but ‘.pub’ appended. The program also asks for a
     passphrase.  The passphrase may be empty to indicate no passphrase
     (host keys must have an empty passphrase), or it may be a string of
     arbitrary length. A passphrase is similar to a password, except it
     can be a phrase with a series of words, punctuation, numbers,
     whitespace, or any string of characters you want. Good passphrases are
     10–30 characters long, are not simple sentences or otherwise easily
     guessable (English prose has only 1–2 bits of entropy per character,
     and provides very bad passphrases), and contain a mix of upper and
     lowercase letters, numbers, and non-alphanumeric characters.

     The passphrase can be changed later by using the -p option.

     There is no way to recover a lost passphrase. If the passphrase is
     lost or forgotten, a new key must be generated and the corresponding
     public key copied to other machines.

     ssh-keygen will by default write keys in an OpenSSH-specific format.
     This format is preferred as it offers better protection for keys
     at rest as well as allowing storage of key comments within the private
     key file itself. The key comment may be useful to help identify the
     key. The comment is initialized to "user@host" when the key is
     created, but can be changed using the -c option.

     It is still possible for ssh-keygen to write the previously-used PEM
     format private keys using the -m option (see below).  These
     format strings are also used to specify the key format when saving
     certificates and are also accepted when parsing certificate files.

     When ssh-keygen is run without arguments, it will ask where the keys should be
     placed:

         Enter file in which to save the key (/home/user/.ssh/id_rsa):

     The possible key types are “dsa”, “ecdsa”, “ecdsa-sk”, “ed25519”, “ed25519-sk” |
     and “rsa”.  The default is “rsa”.

     Example: ssh-keygen -t ed25519 -C "your_email@example.com"

     The -b option requests a specific key length.  The possible values are
     defined for each key type.  For RSA, the minimum size is 512 bits and
     the default is 3072 bits.  Generally, 3072 bits is considered secure.

     ECDSA supports only three lengths: 256, 384 and 521 bits. ECDSA keys
     using other lengths will be ignored. For ECDSA keys, specifying
     -b will only work with those three valid lengths.

     ...
     -f filename
             Specifies the filename of the key file.

     -R hostname | [hostname]:port
                  Removes all keys belonging to the specified hostname (with optional
                  port number) from a known_hosts file.  This option is useful to
                  delete hashed hosts (see the -H option above).
...
```

(a) `ssh-keygen -R remote-vm`

(b) `ssh-keygen -t rsa -b 4096`

(c) `ssh-keygen -f ~/.ssh/id_rsa -y`

(d) `ssh-keygen -L remote-vm`

### Answer

(a)

## Question 6 [7]

Select the **Regular Expression** (ERE) to match the complete string of "address" (e.g. `"address": "326-2072 Sagittis Road"`) from the below JSON file named `addresses.json`. [MSQ]

```json
[
  {
    "name": "Chadwick Cummings",
    "email": "nulla.dignissim.maecenas@hotmail.org",
    "address": "326-2072 Sagittis Road",
    "numberrange": 9,
    "alphanumeric": "ESM17JCJ7NR"
  },
  {
    "name": "Isaac Whitaker",
    "email": "vitae.semper.egestas@icloud.ca",
    "address": "589-9277 Vivamus St.",
    "numberrange": 3,
    "alphanumeric": "CTI05YDP7BX"
  },
  {
    "name": "Bethany Potter",
    "email": "enim.gravida@protonmail.com",
    "address": "P.O. Box 807, 2790 Ut, Ave",
    "numberrange": 7,
    "alphanumeric": "VOE77ZLE00J"
  }
]
```

(a) `"address": "([^"]+)"`

(b) `"address": \["(.+)"\]`

(c) `"address"[[:space:]]_:[[:space:]]_"([^"]+)"`

(d) `"address"[[:space:]]+:[[:space:]]+"([^"]\*)"`

### Answer

(a), (c)

## Question 7 [8]

Which of the following command sequences will run two commands in the background and print their PIDs? [MSQ]

(a) `command1 & PID1=$!; command2 & PID2=$!; echo $PID1 $PID2`

(b) `command1 & command2 & echo $!`

(c) `command1 & PID1=$! && command2 & PID2=$! && echo $PID1 $PID2`

(d) `command1 &; PID1=$!; command2 &; PID2=$!; echo $PID1 $PID2`

### Answer

(a), (c)

## Question 8 [8]

You have a large log file `server.log` and you want to count the number of lines containing the word "ERROR" in the file. Which of the following command sequences will accomplish this? [MSQ]

### Hint

- For command `grep`  
  `-c, --count`  
  Suppress normal output; instead print a count of matching lines for each input file. With the `-v`, --invert-match option (see below), count non-matching lines.

- In command `wc`  
  `-l, --lines`  
  print the newline counts

(a) `grep "ERROR" server.log | wc -l`

(b) `echo server.log | grep "ERROR" | wc -l`

(c) `wc -l server.log | grep "ERROR"`

(d) `grep -c "ERROR" server.log`

### Answer

(a), (d)

## Question 9 [8]

You try to SSH into a remote VM using the command `ssh user@remote-vm` and receive the following error:

```text
Host key verification failed.
```

What are the possible reasons for this error? [MSQ]

(a) The remote VM's IP address has changed.

(b) The remote VM's SSH host key has changed.

(c) The local SSH configuration file is corrupted.

(d) The SSH client is not installed.

### Answer

(a), (b)

## Question 10 [8]

You try to SSH into a remote VM using the command `ssh user@remote-vm` and receive the following error:

```text
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
```

Which of the following option(s) are likely the cause? [MSQ]

(a) The remote VM's SSH host key has changed.

(b) The remote VM's IP address has changed and is now associated with a different host key.

(c) The local `~/.ssh/known_hosts` file is corrupted.

(d) The remote VM's SSH server is down.

### Answer

(a), (b)

## Question 11 [6]

Which command will display the inode number of the file `myfile`? [MSQ]

(a) `ls -i myfile`

(b) `ls -l myfile`

(c) `stat myfile`

(d) `file myfile`

### Answer

(a), (c)

## Question 12 [6]

Which command will create a directory `data` with a subdirectory `backup` and set the permissions so that the owner has full control, the group can read and execute, and others have no permissions, then verify the permissions? [MSQ]

## Hint

```text
CHMOD(1)                           User Commands                          CHMOD(1)

NAME
       chmod - change file mode bits

SYNOPSIS
       chmod [OPTION]... MODE[,MODE]... FILE...
       chmod [OPTION]... OCTAL-MODE FILE...
       chmod [OPTION]... --reference=RFILE FILE...

DESCRIPTION
       This  manual  page  documents  the GNU version of chmod.  chmod changes the
       file mode bits of each given file according to mode, which can be either  a
       symbolic representation of changes to make, or an octal number representing
       the bit pattern for the new mode bits.

       The format of a symbolic mode is [ugoa...][[-+=][perms...]...], where perms
       is either zero or more letters from the set rwxXst, or a single letter from
       the set ugo.  Multiple symbolic modes can be given, separated by commas.

       A combination of the letters ugoa controls which users' access to the  file
       will  be changed: the user who owns it (u), other users in the file's group
       (g), other users not in the file's group (o), or all users (a).  If none of
       these  are given, the effect is as if (a) were given, but bits that are set
       in the umask are not affected.

       The operator + causes the selected file mode bits to be added to the exist‐
       ing  file mode bits of each file; - causes them to be removed; and = causes
       them to be added and causes unmentioned bits to be removed  except  that  a
       directory's unmentioned set user and group ID bits are not affected.

       The  letters rwxXst select file mode bits for the affected users: read (r),
       write (w), execute (or search for directories) (x), execute/search only  if
       the  file  is  a  directory or already has execute permission for some user
       (X), set user or group ID on execution (s),  restricted  deletion  flag  or
       sticky  bit  (t).  Instead of one or more of these letters, you can specify
       exactly one of the letters ugo: the permissions granted  to  the  user  who
       owns  the  file (u), the permissions granted to other users who are members
       of the file's group (g), and the permissions granted to users that  are  in
       neither of the two preceding categories (o).

       A numeric mode is from one to four octal digits (0-7), derived by adding up
       the bits with values 4, 2, and 1.  Omitted digits are assumed to be leading
       zeros.   The  first  digit selects the set user ID (4) and set group ID (2)
       and restricted deletion or sticky (1) attributes.  The second digit selects
       permissions  for  the user who owns the file: read (4), write (2), and exe‐
       cute (1); the third selects permissions  for  other  users  in  the  file's
       group,  with  the  same  values;  and the fourth for other users not in the
       file's group, with the same values.

       chmod never changes the permissions of symbolic  links;  the  chmod  system
       call cannot change their permissions.  This is not a problem since the per‐
       missions of symbolic links are never used.  However, for each symbolic link
       listed on the command line, chmod changes the permissions of the pointed-to
       file.  In contrast, chmod ignores symbolic links encountered during  recur‐
       sive directory traversals.
```

(a)

```bash
mkdir -p data/backup
chmod 750 data data/backup
ls -ld data data/backup
```

(b)

```bash
mkdir -p data/backup
chmod -R 750 data
ls -ld data data/backup
```

(c)

```bash
mkdir data data/backup
chmod -R 750 data
ls -ld data data/backup
```

(d)

```bash
mkdir -p data/backup
chmod 750 data/backup
ls -ld data data/backup
```

### Answer

(a), (b), (c)

## Question 13 [6]

Which of the following command sequences will create a SHA256 checksum for the file `data.bin` and later verify its integrity? [MSQ]

## Hint

```text
SHA256SUM(1)                       User Commands                      SHA256SUM(1)

NAME
       sha256sum - compute and check SHA256 message digest

SYNOPSIS
       sha256sum [OPTION]... [FILE]...

DESCRIPTION
       Print or check SHA256 (256-bit) checksums.

       With no FILE, or when FILE is -, read standard input.

       -b, --binary
              read in binary mode

       -c, --check
              read SHA256 sums from the FILEs and check them

       --tag  create a BSD-style checksum

       -t, --text
              read in text mode (default)

       -z, --zero
              end  each  output  line with NUL, not newline, and disable file name
              escaping
```

(a)

```bash
sha256sum data.bin > data.sha256
sha256sum -c data.sha256
```

(b)

```bash
sha256sum data.bin -o data.sha256
sha256sum -v data.sha256
```

(c)

```bash
sha256sum data.bin | tee data.sha256
sha256sum -c data.sha256
```

(d)

```bash
sha256sum -v data.bin > data.sha256
sha256sum -c data.sha256
```

### Answer

(a), (c)

## Question 14 [6]

A MAC (Media Access Control) address is a unique identifier assigned to network interfaces for communications on the physical network segment. A MAC address is typically represented in the format `00:1A:2B:3C:4D:5E`, where each pair of characters is a hexadecimal digit (0-9, A-F).

Which of the following regular expressions (Basic Regular Expression) will match a MAC address in the format `00:1A:2B:3C:4D:5E`? [MSQ]

(a) `\([0-9A-Fa-f]\{2\}:\)\{5\}[0-9A-Fa-f]\{2\}`

(b) `[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}`

(c) `[0-9A-F]\{2\}:[0-9A-F]\{2\}:[0-9A-F]\{2\}:[0-9A-F]\{2\}:[0-9A-F]\{2\}:[0-9A-F]\{2\}`

(d) `[0-9A-Fa-f]\{2\}-[0-9A-Fa-f]\{2\}-[0-9A-Fa-f]\{2\}-[0-9A-Fa-f]\{2\}-[0-9A-Fa-f]\{2\}-[0-9A-Fa-f]\{2\}`

(e) `\([0-9A-Fa-f]\{2\}:\)\{6\}`

### Answer

(a), (b)

## Question 15 [8]

Given the following contents of a file `websites.txt`, what will be the output of the command `cat websites.txt | cut -d: f1 | sort | uniq | tail -1`? [SA]

```text
https://www.example.com/page1 http://www.test.org/page2
https://sub.domain.net/page3 http://anotherexample.com/page4
https://www.site.co.uk/page5 http://example.org/page6
```

### Answer

```text
https
```
