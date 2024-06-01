# Programming Practice Assignment - Week 5 - Question 8

## Problem Statement

Mine the logs given in the file `myauth.log` present in the current working directory to print all the usernames to which user `student` switched to using `su` command.

Note: switching back to the previous user should not be accounted.

Hint: Basically you have to grep all the lines where `su` command is run successfully and fetch the **username** to which the user `student` switched to.

Contents of `myauth.log` is given below.

## Sample Input

```text
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

## Instructions

Write your script in the file `su.sh`.
Your script will not receive any input from the standard input or command line arguments.
Your script should output to the standard output.


## Sample Output

```bash
guest
guest2
guest
student
root
guest2
guest2
guest
```
