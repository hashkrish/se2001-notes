# Programming Practice Assignment - Week 5 - Question 6

## Problem Statement

Write a script to print the users(one on each line) who are logged in successfully.
Extract the information from the file named `myauth.log` located in the current working directory.
The output should contain usernames only and should be unique.

Hint: Use uniq command to get all distinct lines of the output.

Contents of myauth.log is given below

```
Jan 20 20:11:34 IITMBSC systemd-logind[897]: Session 27 logged out. Waiting for processes to exit.
Jan 20 20:11:34 IITMBSC systemd-logind[897]: Removed session 27.
Jan 20 20:17:01 IITMBSC CRON[70999]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 20 20:17:01 IITMBSC CRON[70999]: pam_unix(cron:session): session closed for user root
Jan 20 20:21:10 IITMBSC su: (to root) student on pts/4
Jan 20 20:21:10 IITMBSC su: pam_unix(su:session): session opened for user root by student(uid=0)
Jan 20 20:21:21 IITMBSC su: pam_unix(su:session): session closed for user root
Jan 20 20:21:21 IITMBSC sudo: pam_unix(sudo:session): session closed for user root
Jan 20 20:22:02 IITMBSC gdm-launch-environment]: pam_unix(gdm-launch-environment:session): session opened for user gdm by (uid=0)
Jan 20 20:22:02 IITMBSC systemd-logind[897]: New session c2 of user gdm.
Jan 20 20:22:02 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user gdm by (uid=0)
Jan 20 20:22:03 IITMBSC polkitd(authority=local): Registered Authentication Agent for unix-session:c2 (system bus name :1.357 [/usr/bin/gnome-shell], object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8)
Jan 20 20:22:21 IITMBSC gdm-launch-environment]: pam_unix(gdm-launch-environment:session): session closed for user gdm
Jan 20 20:22:21 IITMBSC systemd-logind[897]: Session c2 logged out. Waiting for processes to exit.
Jan 20 20:22:22 IITMBSC systemd-logind[897]: Removed session c2.
Jan 20 20:22:22 IITMBSC polkitd(authority=local): Unregistered Authentication Agent for unix-session:c2 (system bus name :1.357, object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8) (disconnected from bus)
Jan 20 20:22:53 IITMBSC login[70867]: pam_unix(login:auth): authentication failure; logname=LOGIN uid=0 euid=0 tty=/dev/tty3 ruser= rhost= user=guest
Jan 20 20:22:56 IITMBSC login[70867]: FAILED LOGIN (1) on '/dev/tty3' FOR 'guest', Authentication failure
Jan 20 20:23:01 IITMBSC login[70550]: pam_unix(login:session): session closed for user guest2
Jan 20 20:23:01 IITMBSC systemd-logind[897]: Session 25 logged out. Waiting for processes to exit.
Jan 20 20:23:01 IITMBSC systemd-logind[897]: Removed session 25.
Jan 20 20:23:18 IITMBSC login[71620]: pam_unix(login:auth): authentication failure; logname=LOGIN uid=0 euid=0 tty=/dev/tty4 ruser= rhost= user=guest2
Jan 20 20:23:20 IITMBSC login[71620]: FAILED LOGIN (1) on '/dev/tty4' FOR 'guest2', Authentication failure
Jan 20 20:23:27 IITMBSC login[71620]: pam_unix(login:auth): authentication failure; logname=LOGIN uid=0 euid=0 tty=/dev/tty4 ruser= rhost= user=root
Jan 20 20:23:30 IITMBSC login[71620]: FAILED LOGIN (2) on '/dev/tty4' FOR 'root', Authentication failure
Jan 20 20:23:39 IITMBSC login[71620]: pam_unix(login:auth): check pass; user unknown
Jan 20 20:23:39 IITMBSC login[71620]: pam_unix(login:auth): authentication failure; logname=LOGIN uid=0 euid=0 tty=/dev/tty4 ruser= rhost=
Jan 20 20:23:43 IITMBSC login[71620]: FAILED LOGIN (3) on '/dev/tty4' FOR 'UNKNOWN', Authentication failure
Jan 20 20:23:48 IITMBSC login[71620]: pam_unix(login:session): session opened for user guest by LOGIN(uid=0)
Jan 20 20:23:48 IITMBSC systemd-logind[897]: New session 30 of user guest.
Jan 20 20:23:48 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user guest by (uid=0)
Jan 20 20:23:51 IITMBSC login[71620]: pam_unix(login:session): session closed for user guest
Jan 20 20:23:51 IITMBSC systemd-logind[897]: Session 30 logged out. Waiting for processes to exit.
Jan 20 20:23:51 IITMBSC systemd-logind[897]: Removed session 30.
Jan 20 20:24:01 IITMBSC login[71803]: pam_unix(login:session): session opened for user student by LOGIN(uid=0)
Jan 20 20:24:01 IITMBSC systemd-logind[897]: New session 32 of user student.
Jan 20 20:24:02 IITMBSC login[71803]: pam_unix(login:session): session closed for user student
Jan 20 20:24:02 IITMBSC systemd-logind[897]: Session 32 logged out. Waiting for processes to exit.
Jan 20 20:24:02 IITMBSC systemd-logind[897]: Removed session 32.
Jan 20 20:24:06 IITMBSC login[71900]: pam_unix(login:auth): authentication failure; logname=LOGIN uid=0 euid=0 tty=/dev/tty4 ruser= rhost= user=root
Jan 20 20:24:09 IITMBSC login[71900]: FAILED LOGIN (1) on '/dev/tty4' FOR 'root', Authentication failure
Jan 20 20:24:16 IITMBSC login[71900]: pam_unix(login:session): session opened for user guest by LOGIN(uid=0)
Jan 20 20:24:16 IITMBSC systemd-logind[897]: New session 33 of user guest.
Jan 20 20:24:16 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user guest by (uid=0)
Jan 20 20:24:17 IITMBSC login[71900]: pam_unix(login:session): session closed for user guest
Jan 20 20:24:17 IITMBSC systemd-logind[897]: Session 33 logged out. Waiting for processes to exit.
Jan 20 20:24:17 IITMBSC systemd-logind[897]: Removed session 33.
Jan 20 20:24:22 IITMBSC login[72064]: pam_unix(login:session): session opened for user guest2 by LOGIN(uid=0)
Jan 20 20:24:22 IITMBSC systemd-logind[897]: New session 35 of user guest2.
Jan 20 20:24:22 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user guest2 by (uid=0)
Jan 20 20:24:24 IITMBSC login[72064]: pam_unix(login:session): session closed for user guest2
Jan 20 20:24:24 IITMBSC systemd-logind[897]: Session 35 logged out. Waiting for processes to exit.
Jan 20 20:24:24 IITMBSC systemd-logind[897]: Removed session 35.
Jan 20 20:24:27 IITMBSC agetty[72229]: tty4: invalid character 0x1b in login name
Jan 20 20:24:43 IITMBSC login[72242]: pam_unix(login:auth): authentication failure; logname=LOGIN uid=0 euid=0 tty=/dev/tty4 ruser= rhost= user=guest2
Jan 20 20:24:47 IITMBSC login[72242]: FAILED LOGIN (1) on '/dev/tty4' FOR 'guest2', Authentication failure
Jan 20 20:24:48 IITMBSC login[72242]: pam_nologin(login:auth): unexpected response from failed conversation function
Jan 20 20:24:48 IITMBSC login[72242]: pam_nologin(login:auth): cannot determine username
Jan 20 20:24:51 IITMBSC login[72242]: FAILED LOGIN (2) on '/dev/tty4' FOR 'UNKNOWN', User not known to the underlying authentication module
```

## Instructions

Write your command in the file `login.sh`.
Your script will not receive any input from the standard input or command line arguments.
Your script should output to the standard output.

## Sample Output

```bash
gdm
guest
guest2
student
```
