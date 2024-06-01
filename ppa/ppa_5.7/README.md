# Programming Practice Assignment - Week 5 - Question 7

## Problem Statement

Print the previous login time of the user `guest` in the format `MMM DD HH:MM:SS`.
Where `MMM`, `DD`, `HH`, `MM` and `SS` corresponds to
**Month** (E.g. Nov), **Date**, **Hours**, **Minutes** and **Seconds** respectively.
Extract the information from the logs available in the file `myauth.log` in the current directory.

Sample log file below.

## Sample Input

```text
Jan 21 19:42:14 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:17 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:42:17 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:20 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:42:20 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:21 IITMBSC CRON[109145]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 21 19:42:21 IITMBSC CRON[109145]: pam_unix(cron:session): session closed for user root
Jan 21 19:42:23 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:42:23 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:27 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:42:27 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:30 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:42:30 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:34 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:42:34 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:43:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 19:43:21 IITMBSC pkexec[113702]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 19:47:07 IITMBSC gnome-keyring-daemon[1856]: asked to register item /org/freedesktop/secrets/collection/login/2, but it's already registered
Jan 21 19:48:44 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:48:44 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:49:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 19:49:21 IITMBSC pkexec[115006]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 19:51:56 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:51:56 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:51:59 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:51:59 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:52:02 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:52:02 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:52:06 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 19:52:06 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:52:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 19:52:21 IITMBSC pkexec[118590]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 20:07:21 IITMBSC gdm-password]: gkr-pam: unlocked login keyring
Jan 21 20:09:24 IITMBSC login[29203]: pam_unix(login:session): session closed for user guest
Jan 21 20:09:24 IITMBSC systemd-logind[966]: Session 16 logged out. Waiting for processes to exit.
Jan 21 20:09:24 IITMBSC systemd-logind[966]: Removed session 16.
Jan 21 20:09:28 IITMBSC login[119028]: pam_unix(login:session): session opened for user guest by LOGIN(uid=0)
Jan 21 20:09:28 IITMBSC systemd-logind[966]: New session 25 of user guest.
Jan 21 20:10:51 IITMBSC login[119028]: pam_unix(login:session): session closed for user guest
Jan 21 20:10:51 IITMBSC systemd-logind[966]: Session 25 logged out. Waiting for processes to exit.
Jan 21 20:10:51 IITMBSC systemd-logind[966]: Removed session 25.
Jan 21 20:10:54 IITMBSC login[119189]: pam_unix(login:session): session opened for user guest2 by LOGIN(uid=0)
Jan 21 20:10:54 IITMBSC systemd-logind[966]: New session 26 of user guest2.
Jan 21 20:10:54 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user guest2 by (uid=0)
Jan 21 20:11:06 IITMBSC login[119189]: pam_unix(login:session): session closed for user guest2
Jan 21 20:11:06 IITMBSC systemd-logind[966]: Session 26 logged out. Waiting for processes to exit.
Jan 21 20:11:06 IITMBSC systemd-logind[966]: Removed session 26.
Jan 21 20:12:17 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:12:17 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:12:20 IITMBSC su: pam_unix(su:auth): authentication failure; logname=student uid=1000 euid=0 tty=pts/7 ruser=student rhost= user=root
Jan 21 20:12:22 IITMBSC su: FAILED SU (to root) student on pts/7
Jan 21 20:12:23 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:12:23 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:12:30 IITMBSC su: (to guest) student on pts/7
Jan 21 20:12:30 IITMBSC su: pam_unix(su:session): session opened for user guest by student(uid=1000)
Jan 21 20:12:36 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:12:36 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:12:40 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
Jan 21 20:12:40 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 20:13:21 IITMBSC pkexec: pam_unix(polkit-1:session): session opened for user root by (uid=1000)
Jan 21 20:13:21 IITMBSC pkexec[123026]: student: Executing command [USER=root] [TTY=unknown] [CWD=/home/student] [COMMAND=/usr/lib/update-notifier/package-system-locked]
Jan 21 20:13:54 IITMBSC su: pam_unix(su:session): session closed for user guest
Jan 21 20:14:35 IITMBSC su: (to guest) student on pts/1
Jan 21 20:14:35 IITMBSC su: pam_unix(su:session): session opened for user guest by student(uid=1000)
Jan 21 20:15:50 IITMBSC su: pam_unix(su:auth): authentication failure; logname=student uid=1000 euid=0 tty=pts/4 ruser=student rhost= user=guest2
Jan 21 20:15:53 IITMBSC su: FAILED SU (to guest2) student on pts/4
Jan 21 20:15:56 IITMBSC su: (to guest2) student on pts/4
Jan 21 20:15:56 IITMBSC su: pam_unix(su:session): session opened for user guest2 by student(uid=1000)
Jan 21 20:17:01 IITMBSC CRON[123336]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 21 20:17:01 IITMBSC CRON[123336]: pam_unix(cron:session): session closed for user root
Jan 21 20:23:58 IITMBSC gnome-keyring-daemon[1856]: asked to register item /org/freedesktop/secrets/collection/login/2, but it's already registered
Jan 21 20:30:01 IITMBSC CRON[124399]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan 21 20:30:01 IITMBSC CRON[124399]: pam_unix(cron:session): session closed for user root
Jan 21 20:31:54 IITMBSC su: pam_unix(su:session): session closed for user guest
Jan 21 20:31:56 IITMBSC su: pam_unix(su:session): session closed for user guest2
Jan 21 20:32:04 IITMBSC gdm-launch-environment]: pam_unix(gdm-launch-environment:session): session opened for user gdm by (uid=0)
Jan 21 20:32:04 IITMBSC systemd-logind[966]: New session c2 of user gdm.
Jan 21 20:32:04 IITMBSC systemd: pam_unix(systemd-user:session): session opened for user gdm by (uid=0)
Jan 21 20:32:05 IITMBSC polkitd(authority=local): Registered Authentication Agent for unix-session:c2 (system bus name :1.525 [/usr/bin/gnome-shell], object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8)
Jan 21 20:32:17 IITMBSC gdm-launch-environment]: pam_unix(gdm-launch-environment:session): session closed for user gdm
Jan 21 20:32:17 IITMBSC systemd-logind[966]: Session c2 logged out. Waiting for processes to exit.
Jan 21 20:32:17 IITMBSC systemd-logind[966]: Removed session c2.
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
```

## Instructions

Write your script in the file `logintime.sh`.
Your script will not receive any input from the standard input or command line arguments.
Your script should output to the standard output.

## Sample Output

```bash
Jan 21 20:32:32
```
