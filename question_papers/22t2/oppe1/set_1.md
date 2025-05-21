# OPPE 1

## Problem 1 A

Create a file structure as shown below and the commands should not output anything.

```text
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

**Note:** Submit the assignment to get partial marks based on the above tasks done.

### Solution

```bash
#!/usr/bin/bash

mkdir -p /potato_recipes/{french_fries,potato_wedges}
touch /potato_recipes/{french_fries,potato_wedges}/procedure.txt
touch /potato_recipes/french_fries/ingredients.txt
ln /potato_recipes/french_fries/ingredients.txt /potato_recipes/potato_wedges/ingredients.txt
ln -s /potato_recipes/french_fries /potato_recipes/frites
```

### Invisible code

```bash
read line
eval "$line"
```

### Test cases

**Public**

**Input**

```bash
ls -R /potato_recipes
```

**Output**

```text
/potato_recipes:
french_fries
frites
potato_wedges

/potato_recipes/french_fries:
ingredients.txt
procedure.txt

/potato_recipes/potato_wedges:
ingredients.txt
procedure.txt
```

**Private**

| Input                                                                                                    | Output |
| -------------------------------------------------------------------------------------------------------- | ------ |
| test "-d /potato_recipes" && echo 0                                                                      | 0      |
| test "-d /potato_recipes/french_fries" && echo 0                                                         | 0      |
| test "-d /potato_recipes/potato_wedges" && echo 0                                                        | 0      |
| test "-f /potato_recipes/french_fries/procedure.txt" && echo 0                                           | 0      |
| test "-f /potato_recipes/potato_wedges/procedure.txt" && echo 0                                          | 0      |
| touch /potato_recipes/french_fries/sample.txt; test "-a /potato_recipes/frites/sample.txt" && echo 0     | 0      |
| echo 0 > /potato_recipes/french_fries/ingredients.txt; cat /potato_recipes/potato_wedges/ingredients.txt | 0      |

---

## Problem 2

Create a link `/data` to the file `mydata` present in the current directory such that the file `mydata` will be often deleted and recreated with the same name and in the same location.

### Solution

```bash
script() {
    ln -s $PWD/mydata /data
}
```

### Invisible code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do; DIR=$RANDOM; done
mkdir $DIR; cd $DIR


echo mysecretdata > mydata
script
rm mydata
echo Passed > mydata
cat /data
```

### Test cases

|         | Input | Output |
| ------- | ----- | ------ |
| Public  |       | Passed |
| Private |       | Passed |

---

## Problem 3 A

The file `dpkg.log` present in the current directory contains the log of installed packages. Find and print the day (YYYY-MM-DD) in which the zsh is installed.

**Hint:**

`YYYY-MM-DD HH:MM:SS status installed <pkg> <installed-version>` indicates the status installed for the package `<pkg>`

### Solution

```bash
script() {
    grep zsh-common dpkg.log \
    | grep installed \
    | tail -1 \
    | cut -d " " -f 1
}
```

### Invisible code

```bash
while read line && [[ $line != "" ]]; do
    echo $line
done > dpkg.log

script
```

### Test cases

**Public**

**Input**

```text
2022-05-26 10:23:44 upgrade gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status half-installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 startup packages configure
2022-05-26 10:23:44 configure gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:50 startup archives unpack
2022-05-26 10:23:51 upgrade accountsservice:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status half-installed accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status triggers-pending dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 startup packages configure
2022-05-26 10:23:51 configure accountsservice:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 status installed accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 trigproc dbus:amd64 1.12.20-2ubuntu4 <none>
2022-05-26 10:23:53 status half-configured dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:53 status installed dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:24:01 startup archives unpack
2022-05-26 10:24:02 upgrade gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:02 status half-configured gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status half-installed gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 upgrade gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status half-installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 startup packages configure
2022-05-26 10:24:04 configure gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 configure gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:09 startup archives unpack
2022-05-26 10:24:09 upgrade orca:all 42.0-1ubuntu1 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status half-installed orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status triggers-pending hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:09 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 startup packages configure
2022-05-26 10:24:09 configure orca:all 42.0-1ubuntu2 <none>
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 status installed orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 10:24:10 status half-configured man-db:amd64 2.10.2-1
2022-05-26 10:24:10 status installed man-db:amd64 2.10.2-1
2022-05-26 10:24:10 trigproc hicolor-icon-theme:all 0.17-2 <none>
2022-05-26 10:24:10 status half-configured hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:11 status installed hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:14 startup archives unpack
2022-05-26 10:24:16 startup packages configure
2022-05-26 12:38:06 startup archives unpack
2022-05-26 12:38:07 upgrade google-chrome-stable:amd64 101.0.4951.64-1 102.0.5005.61-1
2022-05-26 12:38:07 status half-configured google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status unpacked google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status half-installed google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:17 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:17 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:17 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:17 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:17 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 12:38:17 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:17 upgrade microsoft-edge-beta:amd64 102.0.1245.14-1 102.0.1245.22-1
2022-05-26 12:38:17 status half-configured microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status unpacked microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status half-installed microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:31 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:32 upgrade xdg-desktop-portal:amd64 1.14.3-0ubuntu2 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status half-installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 startup packages configure
2022-05-26 12:38:32 configure google-chrome-stable:amd64 102.0.5005.61-1 <none>
2022-05-26 12:38:32 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status half-configured google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status installed google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 configure xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1 <none>
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 status installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 configure microsoft-edge-beta:amd64 102.0.1245.22-1 <none>
2022-05-26 12:38:33 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status half-configured microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status installed microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-26 12:38:33 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 12:38:33 status half-configured man-db:amd64 2.10.2-1
2022-05-26 12:38:34 status installed man-db:amd64 2.10.2-1
2022-05-26 12:38:34 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-26 12:38:34 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:34 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-26 13:26:07 startup archives unpack
2022-05-26 13:26:08 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 startup packages configure
2022-05-26 13:26:08 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:08 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:09 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:28 startup packages remove
2022-05-26 13:26:28 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:28 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status not-installed nodejs:amd64 <none>
2022-05-26 13:26:28 startup packages configure
2022-05-26 13:26:28 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:28 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:29 startup packages configure
2022-05-26 13:26:40 startup packages remove
2022-05-26 13:26:40 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:40 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status not-installed nodejs-doc:all <none>
2022-05-26 13:26:40 startup packages configure
2022-05-26 13:27:01 startup archives unpack
2022-05-26 13:27:02 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 startup packages configure
2022-05-26 13:27:02 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:27:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:27:03 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:34 startup packages remove
2022-05-26 13:39:34 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:39:35 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status not-installed nodejs:amd64 <none>
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:39:35 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:39:35 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:40:31 startup packages remove
2022-05-26 13:40:31 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:31 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status not-installed nodejs-doc:all <none>
2022-05-26 13:40:31 startup packages configure
2022-05-26 13:40:42 startup archives unpack
2022-05-26 13:40:43 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 startup packages configure
2022-05-26 13:40:43 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:40:43 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status installed man-db:amd64 2.10.2-1
2022-05-26 13:45:02 startup archives unpack
2022-05-26 13:45:02 install zsh-common:all <none> 5.8.1-1
2022-05-26 13:45:02 status half-installed zsh-common:all 5.8.1-1
2022-05-26 13:45:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:45:02 status unpacked zsh-common:all 5.8.1-1
2022-05-26 13:45:02 install zsh:amd64 <none> 5.8.1-1
2022-05-26 13:45:02 status half-installed zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-26 13:45:03 startup packages configure
2022-05-26 13:45:03 configure zsh-common:all 5.8.1-1 <none>
2022-05-26 13:45:03 status unpacked zsh-common:all 5.8.1-1
2022-05-26 13:45:03 status half-configured zsh-common:all 5.8.1-1
2022-05-26 13:45:03 status installed zsh-common:all 5.8.1-1
2022-05-26 13:45:03 configure zsh:amd64 5.8.1-1 <none>
2022-05-26 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status half-configured zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status installed zsh:amd64 5.8.1-1
2022-05-26 13:45:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:45:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:45:03 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:20 startup archives unpack
2022-05-27 11:13:20 upgrade dpkg:amd64 1.21.1ubuntu2 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status half-installed dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 startup packages configure
2022-05-27 11:13:20 configure dpkg:amd64 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 status installed dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 startup packages configure
2022-05-27 11:13:21 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:21 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:21 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:25 startup archives unpack
2022-05-27 11:13:25 upgrade logrotate:amd64 3.19.0-1ubuntu1 3.19.0-1ubuntu1.1
2022-05-27 11:13:25 status half-configured logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status unpacked logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status half-installed logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 startup packages configure
2022-05-27 11:13:26 configure logrotate:amd64 3.19.0-1ubuntu1.1 <none>
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status half-configured logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status installed logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:26 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:30 startup archives unpack
2022-05-27 11:13:31 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:31 startup packages configure
2022-05-27 11:13:31 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:31 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:32 status installed man-db:amd64 2.10.2-1
```

**Output**

```text
2022-05-26
```

**Private**

**Input**

```text
2022-05-26 10:23:44 upgrade gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status half-installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 startup packages configure
2022-05-26 10:23:44 configure gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:50 startup archives unpack
2022-05-26 10:23:51 upgrade accountsservice:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status half-installed accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status triggers-pending dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 startup packages configure
2022-05-26 10:23:51 configure accountsservice:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 status installed accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 trigproc dbus:amd64 1.12.20-2ubuntu4 <none>
2022-05-26 10:23:53 status half-configured dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:53 status installed dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:24:01 startup archives unpack
2022-05-26 10:24:02 upgrade gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:02 status half-configured gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status half-installed gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 upgrade gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status half-installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 startup packages configure
2022-05-26 10:24:04 configure gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 configure gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:09 startup archives unpack
2022-05-26 10:24:09 upgrade orca:all 42.0-1ubuntu1 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status half-installed orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status triggers-pending hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:09 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 startup packages configure
2022-05-26 10:24:09 configure orca:all 42.0-1ubuntu2 <none>
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 status installed orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 10:24:10 status half-configured man-db:amd64 2.10.2-1
2022-05-26 10:24:10 status installed man-db:amd64 2.10.2-1
2022-05-26 10:24:10 trigproc hicolor-icon-theme:all 0.17-2 <none>
2022-05-26 10:24:10 status half-configured hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:11 status installed hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:14 startup archives unpack
2022-05-26 10:24:16 startup packages configure
2022-05-26 12:38:06 startup archives unpack
2022-05-26 12:38:07 upgrade google-chrome-stable:amd64 101.0.4951.64-1 102.0.5005.61-1
2022-05-26 12:38:07 status half-configured google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status unpacked google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status half-installed google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:17 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:17 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:17 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:17 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:17 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 12:38:17 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:17 upgrade microsoft-edge-beta:amd64 102.0.1245.14-1 102.0.1245.22-1
2022-05-26 12:38:17 status half-configured microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status unpacked microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status half-installed microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:31 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:32 upgrade xdg-desktop-portal:amd64 1.14.3-0ubuntu2 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status half-installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 startup packages configure
2022-05-26 12:38:32 configure google-chrome-stable:amd64 102.0.5005.61-1 <none>
2022-05-26 12:38:32 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status half-configured google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status installed google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 configure xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1 <none>
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 status installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 configure microsoft-edge-beta:amd64 102.0.1245.22-1 <none>
2022-05-26 12:38:33 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status half-configured microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status installed microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-26 12:38:33 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 12:38:33 status half-configured man-db:amd64 2.10.2-1
2022-05-26 12:38:34 status installed man-db:amd64 2.10.2-1
2022-05-26 12:38:34 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-26 12:38:34 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:34 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-26 13:26:07 startup archives unpack
2022-05-26 13:26:08 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 startup packages configure
2022-05-26 13:26:08 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:08 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:09 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:28 startup packages remove
2022-05-26 13:26:28 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:28 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status not-installed nodejs:amd64 <none>
2022-05-26 13:26:28 startup packages configure
2022-05-26 13:26:28 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:28 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:29 startup packages configure
2022-05-26 13:26:40 startup packages remove
2022-05-26 13:26:40 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:40 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status not-installed nodejs-doc:all <none>
2022-05-26 13:26:40 startup packages configure
2022-05-26 13:27:01 startup archives unpack
2022-05-26 13:27:02 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 startup packages configure
2022-05-26 13:27:02 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:27:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:27:03 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:34 startup packages remove
2022-05-26 13:39:34 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:39:35 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status not-installed nodejs:amd64 <none>
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:39:35 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:39:35 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:40:31 startup packages remove
2022-05-26 13:40:31 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:31 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status not-installed nodejs-doc:all <none>
2022-05-26 13:40:31 startup packages configure
2022-05-26 13:40:42 startup archives unpack
2022-05-26 13:40:43 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 startup packages configure
2022-05-26 13:40:43 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:40:43 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status installed man-db:amd64 2.10.2-1
2022-05-27 13:45:02 startup archives unpack
2022-05-27 13:45:02 install zsh-common:all <none> 5.8.1-1
2022-05-27 13:45:02 status half-installed zsh-common:all 5.8.1-1
2022-05-27 13:45:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 13:45:02 status unpacked zsh-common:all 5.8.1-1
2022-05-27 13:45:02 install zsh:amd64 <none> 5.8.1-1
2022-05-27 13:45:02 status half-installed zsh:amd64 5.8.1-1
2022-05-27 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-27 13:45:03 startup packages configure
2022-05-27 13:45:03 configure zsh-common:all 5.8.1-1 <none>
2022-05-27 13:45:03 status unpacked zsh-common:all 5.8.1-1
2022-05-27 13:45:03 status half-configured zsh-common:all 5.8.1-1
2022-05-27 13:45:03 status installed zsh-common:all 5.8.1-1
2022-05-27 13:45:03 configure zsh:amd64 5.8.1-1 <none>
2022-05-27 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-27 13:45:03 status half-configured zsh:amd64 5.8.1-1
2022-05-27 13:45:03 status installed zsh:amd64 5.8.1-1
2022-05-27 13:45:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 13:45:03 status half-configured man-db:amd64 2.10.2-1
2022-05-27 13:45:03 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:20 startup archives unpack
2022-05-27 11:13:20 upgrade dpkg:amd64 1.21.1ubuntu2 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status half-installed dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 startup packages configure
2022-05-27 11:13:20 configure dpkg:amd64 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 status installed dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 startup packages configure
2022-05-27 11:13:21 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:21 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:21 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:25 startup archives unpack
2022-05-27 11:13:25 upgrade logrotate:amd64 3.19.0-1ubuntu1 3.19.0-1ubuntu1.1
2022-05-27 11:13:25 status half-configured logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status unpacked logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status half-installed logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 startup packages configure
2022-05-27 11:13:26 configure logrotate:amd64 3.19.0-1ubuntu1.1 <none>
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status half-configured logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status installed logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:26 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:30 startup archives unpack
2022-05-27 11:13:31 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:31 startup packages configure
2022-05-27 11:13:31 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:31 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:32 status installed man-db:amd64 2.10.2-1
```

**Output**

```text
2022-05-27
```

---

## Problem 3 B

The file `dpkg.log` present in the current directory contains the log of installed packages. Print all packages installed on 26th of May 2022.

Hint: `command | sort | uniq` to print distinct values in sorted order.

### Solution

```bash
script() {
    grep 2022-05-26 dpkg.log \
    | grep " installed " \
    | cut -d " " -f5 \
    | cut -d ":" -f 1 \
    | sort | uniq
}
```

### Invisible code

```bash
while read line && [[ $line != "" ]]; do
    echo $line
done > dpkg.log

script
```

### Test cases

**Public**

**Input**

```text
2022-05-26 10:23:44 upgrade gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status half-installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 startup packages configure
2022-05-26 10:23:44 configure gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:50 startup archives unpack
2022-05-26 10:23:51 upgrade accountsservice:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status half-installed accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status triggers-pending dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 startup packages configure
2022-05-26 10:23:51 configure accountsservice:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 status installed accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 trigproc dbus:amd64 1.12.20-2ubuntu4 <none>
2022-05-26 10:23:53 status half-configured dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:53 status installed dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:24:01 startup archives unpack
2022-05-26 10:24:02 upgrade gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:02 status half-configured gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status half-installed gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 upgrade gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status half-installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 startup packages configure
2022-05-26 10:24:04 configure gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 configure gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:09 startup archives unpack
2022-05-26 10:24:09 upgrade orca:all 42.0-1ubuntu1 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status half-installed orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status triggers-pending hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:09 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 startup packages configure
2022-05-26 10:24:09 configure orca:all 42.0-1ubuntu2 <none>
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 status installed orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 10:24:10 status half-configured man-db:amd64 2.10.2-1
2022-05-26 10:24:10 status installed man-db:amd64 2.10.2-1
2022-05-26 10:24:10 trigproc hicolor-icon-theme:all 0.17-2 <none>
2022-05-26 10:24:10 status half-configured hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:11 status installed hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:14 startup archives unpack
2022-05-26 10:24:16 startup packages configure
2022-05-26 12:38:06 startup archives unpack
2022-05-26 12:38:07 upgrade google-chrome-stable:amd64 101.0.4951.64-1 102.0.5005.61-1
2022-05-26 12:38:07 status half-configured google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status unpacked google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status half-installed google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:17 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:17 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:17 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:17 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:17 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 12:38:17 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:17 upgrade microsoft-edge-beta:amd64 102.0.1245.14-1 102.0.1245.22-1
2022-05-26 12:38:17 status half-configured microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status unpacked microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status half-installed microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:31 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:32 upgrade xdg-desktop-portal:amd64 1.14.3-0ubuntu2 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status half-installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 startup packages configure
2022-05-26 12:38:32 configure google-chrome-stable:amd64 102.0.5005.61-1 <none>
2022-05-26 12:38:32 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status half-configured google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status installed google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 configure xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1 <none>
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 status installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 configure microsoft-edge-beta:amd64 102.0.1245.22-1 <none>
2022-05-26 12:38:33 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status half-configured microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status installed microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-26 12:38:33 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 12:38:33 status half-configured man-db:amd64 2.10.2-1
2022-05-26 12:38:34 status installed man-db:amd64 2.10.2-1
2022-05-26 12:38:34 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-26 12:38:34 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:34 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-26 13:26:07 startup archives unpack
2022-05-26 13:26:08 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 startup packages configure
2022-05-26 13:26:08 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:08 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:09 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:28 startup packages remove
2022-05-26 13:26:28 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:28 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status not-installed nodejs:amd64 <none>
2022-05-26 13:26:28 startup packages configure
2022-05-26 13:26:28 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:28 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:29 startup packages configure
2022-05-26 13:26:40 startup packages remove
2022-05-26 13:26:40 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:40 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status not-installed nodejs-doc:all <none>
2022-05-26 13:26:40 startup packages configure
2022-05-26 13:27:01 startup archives unpack
2022-05-26 13:27:02 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 startup packages configure
2022-05-26 13:27:02 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:27:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:27:03 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:34 startup packages remove
2022-05-26 13:39:34 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:39:35 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status not-installed nodejs:amd64 <none>
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:39:35 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:39:35 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:40:31 startup packages remove
2022-05-26 13:40:31 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:31 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status not-installed nodejs-doc:all <none>
2022-05-26 13:40:31 startup packages configure
2022-05-26 13:40:42 startup archives unpack
2022-05-26 13:40:43 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 startup packages configure
2022-05-26 13:40:43 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:40:43 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status installed man-db:amd64 2.10.2-1
2022-05-26 13:45:02 startup archives unpack
2022-05-26 13:45:02 install zsh-common:all <none> 5.8.1-1
2022-05-26 13:45:02 status half-installed zsh-common:all 5.8.1-1
2022-05-26 13:45:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:45:02 status unpacked zsh-common:all 5.8.1-1
2022-05-26 13:45:02 install zsh:amd64 <none> 5.8.1-1
2022-05-26 13:45:02 status half-installed zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-26 13:45:03 startup packages configure
2022-05-26 13:45:03 configure zsh-common:all 5.8.1-1 <none>
2022-05-26 13:45:03 status unpacked zsh-common:all 5.8.1-1
2022-05-26 13:45:03 status half-configured zsh-common:all 5.8.1-1
2022-05-26 13:45:03 status installed zsh-common:all 5.8.1-1
2022-05-26 13:45:03 configure zsh:amd64 5.8.1-1 <none>
2022-05-26 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status half-configured zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status installed zsh:amd64 5.8.1-1
2022-05-26 13:45:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:45:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:45:03 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:20 startup archives unpack
2022-05-27 11:13:20 upgrade dpkg:amd64 1.21.1ubuntu2 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status half-installed dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 startup packages configure
2022-05-27 11:13:20 configure dpkg:amd64 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 status installed dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 startup packages configure
2022-05-27 11:13:21 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:21 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:21 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:25 startup archives unpack
2022-05-27 11:13:25 upgrade logrotate:amd64 3.19.0-1ubuntu1 3.19.0-1ubuntu1.1
2022-05-27 11:13:25 status half-configured logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status unpacked logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status half-installed logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 startup packages configure
2022-05-27 11:13:26 configure logrotate:amd64 3.19.0-1ubuntu1.1 <none>
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status half-configured logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status installed logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:26 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:30 startup archives unpack
2022-05-27 11:13:31 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:31 startup packages configure
2022-05-27 11:13:31 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:31 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:32 status installed man-db:amd64 2.10.2-1
```

**Output**

```text
2022-05-26
```

**Private**

**Input**

```text
2022-05-26 10:23:44 upgrade gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status half-installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 startup packages configure
2022-05-26 10:23:44 configure gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:44 status unpacked gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status half-configured gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:44 status installed gir1.2-accountsservice-1.0:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:50 startup archives unpack
2022-05-26 10:23:51 upgrade accountsservice:amd64 22.07.5-2ubuntu1 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status half-installed accountsservice:amd64 22.07.5-2ubuntu1
2022-05-26 10:23:51 status triggers-pending dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 startup packages configure
2022-05-26 10:23:51 configure accountsservice:amd64 22.07.5-2ubuntu1.3 <none>
2022-05-26 10:23:51 status unpacked accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:51 status half-configured accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 status installed accountsservice:amd64 22.07.5-2ubuntu1.3
2022-05-26 10:23:53 trigproc dbus:amd64 1.12.20-2ubuntu4 <none>
2022-05-26 10:23:53 status half-configured dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:23:53 status installed dbus:amd64 1.12.20-2ubuntu4
2022-05-26 10:24:01 startup archives unpack
2022-05-26 10:24:02 upgrade gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:02 status half-configured gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status half-installed gir1.2-webkit2-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:02 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 upgrade gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:03 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status half-installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.0-2ubuntu1
2022-05-26 10:24:03 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 startup packages configure
2022-05-26 10:24:04 configure gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-javascriptcoregtk-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 configure gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1 <none>
2022-05-26 10:24:04 status unpacked gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status half-configured gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:04 status installed gir1.2-webkit2-4.0:amd64 2.36.2-0ubuntu0.22.04.1
2022-05-26 10:24:09 startup archives unpack
2022-05-26 10:24:09 upgrade orca:all 42.0-1ubuntu1 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status half-installed orca:all 42.0-1ubuntu1
2022-05-26 10:24:09 status triggers-pending hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:09 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 startup packages configure
2022-05-26 10:24:09 configure orca:all 42.0-1ubuntu2 <none>
2022-05-26 10:24:09 status unpacked orca:all 42.0-1ubuntu2
2022-05-26 10:24:09 status half-configured orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 status installed orca:all 42.0-1ubuntu2
2022-05-26 10:24:10 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 10:24:10 status half-configured man-db:amd64 2.10.2-1
2022-05-26 10:24:10 status installed man-db:amd64 2.10.2-1
2022-05-26 10:24:10 trigproc hicolor-icon-theme:all 0.17-2 <none>
2022-05-26 10:24:10 status half-configured hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:11 status installed hicolor-icon-theme:all 0.17-2
2022-05-26 10:24:14 startup archives unpack
2022-05-26 10:24:16 startup packages configure
2022-05-26 12:38:06 startup archives unpack
2022-05-26 12:38:07 upgrade google-chrome-stable:amd64 101.0.4951.64-1 102.0.5005.61-1
2022-05-26 12:38:07 status half-configured google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status unpacked google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:07 status half-installed google-chrome-stable:amd64 101.0.4951.64-1
2022-05-26 12:38:17 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:17 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:17 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:17 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:17 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 12:38:17 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:17 upgrade microsoft-edge-beta:amd64 102.0.1245.14-1 102.0.1245.22-1
2022-05-26 12:38:17 status half-configured microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status unpacked microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:17 status half-installed microsoft-edge-beta:amd64 102.0.1245.14-1
2022-05-26 12:38:31 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:32 upgrade xdg-desktop-portal:amd64 1.14.3-0ubuntu2 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status half-installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 startup packages configure
2022-05-26 12:38:32 configure google-chrome-stable:amd64 102.0.5005.61-1 <none>
2022-05-26 12:38:32 status unpacked google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status half-configured google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 status installed google-chrome-stable:amd64 102.0.5005.61-1
2022-05-26 12:38:32 configure xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1 <none>
2022-05-26 12:38:32 status unpacked xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:32 status half-configured xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 status installed xdg-desktop-portal:amd64 1.14.3-0ubuntu2.22.04.1
2022-05-26 12:38:33 configure microsoft-edge-beta:amd64 102.0.1245.22-1 <none>
2022-05-26 12:38:33 status unpacked microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status half-configured microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 status installed microsoft-edge-beta:amd64 102.0.1245.22-1
2022-05-26 12:38:33 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-26 12:38:33 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-26 12:38:33 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-26 12:38:33 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-26 12:38:33 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-26 12:38:33 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 12:38:33 status half-configured man-db:amd64 2.10.2-1
2022-05-26 12:38:34 status installed man-db:amd64 2.10.2-1
2022-05-26 12:38:34 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-26 12:38:34 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-26 12:38:34 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-26 13:26:07 startup archives unpack
2022-05-26 13:26:08 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 startup packages configure
2022-05-26 13:26:08 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:08 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:08 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:08 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:09 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:28 startup packages remove
2022-05-26 13:26:28 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:28 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:28 status not-installed nodejs:amd64 <none>
2022-05-26 13:26:28 startup packages configure
2022-05-26 13:26:28 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:26:28 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:26:28 status installed man-db:amd64 2.10.2-1
2022-05-26 13:26:29 startup packages configure
2022-05-26 13:26:40 startup packages remove
2022-05-26 13:26:40 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:26:40 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:26:40 status not-installed nodejs-doc:all <none>
2022-05-26 13:26:40 startup packages configure
2022-05-26 13:27:01 startup archives unpack
2022-05-26 13:27:02 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 startup packages configure
2022-05-26 13:27:02 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:27:02 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:02 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:27:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:27:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:27:03 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:34 startup packages remove
2022-05-26 13:39:34 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 remove nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:39:35 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status config-files nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:39:35 status not-installed nodejs:amd64 <none>
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:39:35 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:39:35 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:39:35 status installed man-db:amd64 2.10.2-1
2022-05-26 13:39:35 startup packages configure
2022-05-26 13:40:31 startup packages remove
2022-05-26 13:40:31 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 remove nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:31 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status config-files nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:31 status not-installed nodejs-doc:all <none>
2022-05-26 13:40:31 startup packages configure
2022-05-26 13:40:42 startup archives unpack
2022-05-26 13:40:43 install nodejs-doc:all <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 install nodejs:amd64 <none> 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 startup packages configure
2022-05-26 13:40:43 configure nodejs:amd64 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs:amd64 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 configure nodejs-doc:all 12.22.9~dfsg-1ubuntu3 <none>
2022-05-26 13:40:43 status unpacked nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status half-configured nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 status installed nodejs-doc:all 12.22.9~dfsg-1ubuntu3
2022-05-26 13:40:43 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:40:43 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:40:43 status installed man-db:amd64 2.10.2-1
2022-05-26 13:45:02 startup archives unpack
2022-05-26 13:45:02 install zsh-common:all <none> 5.8.1-1
2022-05-26 13:45:02 status half-installed zsh-common:all 5.8.1-1
2022-05-26 13:45:02 status triggers-pending man-db:amd64 2.10.2-1
2022-05-26 13:45:02 status unpacked zsh-common:all 5.8.1-1
2022-05-26 13:45:02 install zsh:amd64 <none> 5.8.1-1
2022-05-26 13:45:02 status half-installed zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-26 13:45:03 startup packages configure
2022-05-26 13:45:03 configure zsh-common:all 5.8.1-1 <none>
2022-05-26 13:45:03 status unpacked zsh-common:all 5.8.1-1
2022-05-26 13:45:03 status half-configured zsh-common:all 5.8.1-1
2022-05-26 13:45:03 status installed zsh-common:all 5.8.1-1
2022-05-26 13:45:03 configure zsh:amd64 5.8.1-1 <none>
2022-05-26 13:45:03 status unpacked zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status half-configured zsh:amd64 5.8.1-1
2022-05-26 13:45:03 status installed zsh:amd64 5.8.1-1
2022-05-26 13:45:03 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-26 13:45:03 status half-configured man-db:amd64 2.10.2-1
2022-05-26 13:45:03 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:20 startup archives unpack
2022-05-27 11:13:20 upgrade dpkg:amd64 1.21.1ubuntu2 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status half-installed dpkg:amd64 1.21.1ubuntu2
2022-05-27 11:13:20 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 startup packages configure
2022-05-27 11:13:20 configure dpkg:amd64 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:20 status unpacked dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:20 status half-configured dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 status installed dpkg:amd64 1.21.1ubuntu2.1
2022-05-27 11:13:21 startup packages configure
2022-05-27 11:13:21 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:21 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:21 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:25 startup archives unpack
2022-05-27 11:13:25 upgrade logrotate:amd64 3.19.0-1ubuntu1 3.19.0-1ubuntu1.1
2022-05-27 11:13:25 status half-configured logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status unpacked logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status half-installed logrotate:amd64 3.19.0-1ubuntu1
2022-05-27 11:13:25 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 startup packages configure
2022-05-27 11:13:26 configure logrotate:amd64 3.19.0-1ubuntu1.1 <none>
2022-05-27 11:13:26 status unpacked logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status half-configured logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 status installed logrotate:amd64 3.19.0-1ubuntu1.1
2022-05-27 11:13:26 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:26 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:26 status installed man-db:amd64 2.10.2-1
2022-05-27 11:13:30 startup archives unpack
2022-05-27 11:13:31 status triggers-pending man-db:amd64 2.10.2-1
2022-05-27 11:13:31 startup packages configure
2022-05-27 11:13:31 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:31 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:32 status installed man-db:amd64 2.10.2-1
```

**Output**

```text
2022-05-27
```

---

## Problem 3 C

The file `dpkg.log` present in the current directory contains the log of package install/update/remove information. `pkg` is the variable that stores the package name. Write a script to print `"installed"` if the package stored in the variable `pkg` is installed else print `"not-installed"`.

**Hint:**

1. `YYYY-MM-DD HH:MM:SS status installed <pkg> <installed-version>` indicates the status installed for the package `<pkg>`

2. `YYYY-MM-DD HH:MM:SS status not-installed <pkg> <installed-version>` indicates the status not installed (an attempt is made before and/or uninstalled) for the package `<pkg>`

### Solution

```bash
script() {
    egrep "status (not-)?installed $pkg" dpkg.log \
    | tail -1 \
    | cut -d " " -f 4
}
```

### Invisible code

```bash
read pkg
while read line && [[ $line != "" ]]; do
    echo $line
done > dpkg.log

script
```

### Test cases

#### Public

#### Test case 1

##### Input

```text
cmatrix
2022-05-27 11:13:31 status unpacked libdpkg-perl:all 1.21.1ubuntu2
2022-05-27 11:13:31 status half-installed libdpkg-perl:all 1.21.1ubuntu2
2022-05-27 11:13:31 status unpacked libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 startup packages configure
2022-05-27 11:13:31 configure libdpkg-perl:all 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:31 status unpacked libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status half-configured libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status installed libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 configure dpkg-dev:all 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:31 status unpacked dpkg-dev:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status half-configured dpkg-dev:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status installed dpkg-dev:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:31 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:32 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:32 startup packages remove
2022-05-30 17:51:32 status installed cmatrix:amd64 2.0-3
2022-05-30 17:51:32 remove cmatrix:amd64 2.0-3 <none>
2022-05-30 17:51:32 status half-configured cmatrix:amd64 2.0-3
2022-05-30 17:51:32 status half-installed cmatrix:amd64 2.0-3
2022-05-30 17:51:32 status triggers-pending man-db:amd64 2.10.2-1
2022-05-30 17:51:32 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:32 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:32 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:32 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:32 status config-files cmatrix:amd64 2.0-3
2022-05-30 17:51:32 status not-installed cmatrix:amd64 <none>
2022-05-30 17:51:32 startup packages configure
2022-05-30 17:51:32 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-30 17:51:32 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:33 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:33 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-30 17:51:33 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:33 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:33 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-30 17:51:33 status half-configured man-db:amd64 2.10.2-1
2022-05-30 17:51:33 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:33 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-30 17:51:33 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:33 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:33 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-30 17:51:33 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:33 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:44 startup archives unpack
2022-05-30 17:51:44 install cmatrix:amd64 <none> 2.0-3
2022-05-30 17:51:44 status half-installed cmatrix:amd64 2.0-3
2022-05-30 17:51:44 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:44 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:44 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:44 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:44 status triggers-pending man-db:amd64 2.10.2-1
2022-05-30 17:51:44 status unpacked cmatrix:amd64 2.0-3
2022-05-30 17:51:44 startup packages configure
2022-05-30 17:51:44 configure cmatrix:amd64 2.0-3 <none>
2022-05-30 17:51:44 status unpacked cmatrix:amd64 2.0-3
2022-05-30 17:51:44 status half-configured cmatrix:amd64 2.0-3
2022-05-30 17:51:44 status installed cmatrix:amd64 2.0-3
2022-05-30 17:51:44 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-30 17:51:44 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:44 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:44 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-30 17:51:44 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:45 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:45 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-30 17:51:45 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:45 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:45 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-30 17:51:45 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:45 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:45 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-30 17:51:45 status half-configured man-db:amd64 2.10.2-1
2022-05-30 17:51:45 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:51 startup packages remove
2022-05-30 17:51:51 status installed cmatrix:amd64 2.0-3
2022-05-30 17:51:51 remove cmatrix:amd64 2.0-3 <none>
2022-05-30 17:51:51 status half-configured cmatrix:amd64 2.0-3
2022-05-30 17:51:51 status half-installed cmatrix:amd64 2.0-3
2022-05-30 17:51:51 status triggers-pending man-db:amd64 2.10.2-1
2022-05-30 17:51:51 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:51 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:51 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:51 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:51 status config-files cmatrix:amd64 2.0-3
2022-05-30 17:51:51 status not-installed cmatrix:amd64 <none>
2022-05-30 17:51:51 startup packages configure
2022-05-30 17:51:51 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-30 17:51:51 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:51 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:51 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-30 17:51:51 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:51 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:51 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-30 17:51:51 status half-configured man-db:amd64 2.10.2-1
2022-05-30 17:51:52 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:52 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-30 17:51:52 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:52 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:52 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-30 17:51:52 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:52 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
```

##### Output

```text
not-installed
```

#### Test case 2

##### Input

```text
gnome-menus
```

##### Output

```text
not-installed
```

#### Private

#### Test case 1

##### Input

```text
gnome-menus
2022-05-27 11:13:31 status unpacked libdpkg-perl:all 1.21.1ubuntu2
2022-05-27 11:13:31 status half-installed libdpkg-perl:all 1.21.1ubuntu2
2022-05-27 11:13:31 status unpacked libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 startup packages configure
2022-05-27 11:13:31 configure libdpkg-perl:all 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:31 status unpacked libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status half-configured libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status installed libdpkg-perl:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 configure dpkg-dev:all 1.21.1ubuntu2.1 <none>
2022-05-27 11:13:31 status unpacked dpkg-dev:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status half-configured dpkg-dev:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 status installed dpkg-dev:all 1.21.1ubuntu2.1
2022-05-27 11:13:31 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-27 11:13:31 status half-configured man-db:amd64 2.10.2-1
2022-05-27 11:13:32 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:32 startup packages remove
2022-05-30 17:51:32 status installed cmatrix:amd64 2.0-3
2022-05-30 17:51:32 remove cmatrix:amd64 2.0-3 <none>
2022-05-30 17:51:32 status half-configured cmatrix:amd64 2.0-3
2022-05-30 17:51:32 status half-installed cmatrix:amd64 2.0-3
2022-05-30 17:51:32 status triggers-pending man-db:amd64 2.10.2-1
2022-05-30 17:51:32 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:32 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:32 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:32 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:32 status config-files cmatrix:amd64 2.0-3
2022-05-30 17:51:32 status not-installed cmatrix:amd64 <none>
2022-05-30 17:51:32 startup packages configure
2022-05-30 17:51:32 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-30 17:51:32 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:33 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:33 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-30 17:51:33 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:33 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:33 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-30 17:51:33 status half-configured man-db:amd64 2.10.2-1
2022-05-30 17:51:33 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:33 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-30 17:51:33 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:33 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:33 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-30 17:51:33 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:33 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:44 startup archives unpack
2022-05-30 17:51:44 install cmatrix:amd64 <none> 2.0-3
2022-05-30 17:51:44 status half-installed cmatrix:amd64 2.0-3
2022-05-30 17:51:44 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:44 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:44 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:44 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:44 status triggers-pending man-db:amd64 2.10.2-1
2022-05-30 17:51:44 status unpacked cmatrix:amd64 2.0-3
2022-05-30 17:51:44 startup packages configure
2022-05-30 17:51:44 configure cmatrix:amd64 2.0-3 <none>
2022-05-30 17:51:44 status unpacked cmatrix:amd64 2.0-3
2022-05-30 17:51:44 status half-configured cmatrix:amd64 2.0-3
2022-05-30 17:51:44 status installed cmatrix:amd64 2.0-3
2022-05-30 17:51:44 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-30 17:51:44 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:44 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:44 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-30 17:51:44 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:45 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:45 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-30 17:51:45 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:45 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:45 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-30 17:51:45 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:45 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:45 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-30 17:51:45 status half-configured man-db:amd64 2.10.2-1
2022-05-30 17:51:45 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:51 startup packages remove
2022-05-30 17:51:51 status installed cmatrix:amd64 2.0-3
2022-05-30 17:51:51 remove cmatrix:amd64 2.0-3 <none>
2022-05-30 17:51:51 status half-configured cmatrix:amd64 2.0-3
2022-05-30 17:51:51 status half-installed cmatrix:amd64 2.0-3
2022-05-30 17:51:51 status triggers-pending man-db:amd64 2.10.2-1
2022-05-30 17:51:51 status triggers-pending bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:51 status triggers-pending gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:51 status triggers-pending desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:51 status triggers-pending mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:51 status config-files cmatrix:amd64 2.0-3
2022-05-30 17:51:51 status not-installed cmatrix:amd64 <none>
2022-05-30 17:51:51 startup packages configure
2022-05-30 17:51:51 trigproc desktop-file-utils:amd64 0.26-1ubuntu3 <none>
2022-05-30 17:51:51 status half-configured desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:51 status installed desktop-file-utils:amd64 0.26-1ubuntu3
2022-05-30 17:51:51 trigproc gnome-menus:amd64 3.36.0-1ubuntu3 <none>
2022-05-30 17:51:51 status half-configured gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:51 status installed gnome-menus:amd64 3.36.0-1ubuntu3
2022-05-30 17:51:51 trigproc man-db:amd64 2.10.2-1 <none>
2022-05-30 17:51:51 status half-configured man-db:amd64 2.10.2-1
2022-05-30 17:51:52 status installed man-db:amd64 2.10.2-1
2022-05-30 17:51:52 trigproc mailcap:all 3.70+nmu1ubuntu1 <none>
2022-05-30 17:51:52 status half-configured mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:52 status installed mailcap:all 3.70+nmu1ubuntu1
2022-05-30 17:51:52 trigproc bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1 <none>
2022-05-30 17:51:52 status half-configured bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
2022-05-30 17:51:52 status installed bamfdaemon:amd64 0.5.6+22.04.20220217-0ubuntu1
```

##### Output

```text
installed
```

#### Test case 2

##### Input

```text
cmatrix
```

##### Output

```text
not-installed
```

---

## Problem 4 A

Write a script that reads two numbers `a` and `b` from first and second line respectively and print `special` if

- `a` and `b` are divisible by 3
- `a` is greater than `b`
- The remainder of `a` divided by `b` is divisible by 3

If any of the above condition is not satisfied then print `not-special`

### Solution

```bash
script() {
    read a
    read b
    [[ $a -gt $b \
    && $((a%3)) -eq 0 \
    && $((b%3)) -eq 0 \
    && $(( (a%b)%3 )) -eq 0 ]] && echo special
}
```

### Test cases

### Public Test Cases

#### Input 1

```text
15
7
```

#### Output 1

```text
not-special
```

#### Input 2

```text
15
6
```

#### Output 2

```text
special
```

### Private Test Cases

#### Input 1

```text
30
12
```

#### Output 1

```text
special
```

#### Input 2

```text
60
41
```

#### Output 2

```text
not-special
```

---

## Problem 4 B

Write a script that reads two numbers `a` and `b` from first and second line respectively and print `special` if

- `a` and `b` are divisible by 3
- `a` is lesser than `b`
- The remainder of `b` divided by `a` is divisible by 3

If any of the above condition is not satisfied then print `not-special`

### Solution

```bash
script() {
    read a
    read b
    [[ $a -lt $b \
    && $(( a%3 )) -eq 0 \
    && $(( b%3 )) -eq 0 \
    && $(( (b%a)%3 )) -eq 0 ]] && echo special
}
```

### Public Test Cases

#### Input 1

```text
7
15
```

#### Output 1

```text
not-special
```

#### Input 2

```text
6
15
```

#### Output 2

```text
special
```

### Private Test Cases

#### Input 1

```text
12
30
```

#### Output 1

```text
special
```

#### Input 2

```text
41
60
```

#### Output 2

```text
not-special
```

---

## Problem 5 A

Write a script to print numbers that are divisible by both 7 and 11 between `a` and `b` (ends inclusive) where `a` and `b` are integer variables and `a` is lesser than `b`.

**Hint:**Use `seq` command to generate a sequence of values.

Ex: `seq 0 4` will give

```text
0
1
2
3
4
```

### Solution

```bash
script() {
    read a
    read b
    for i in $(seq $a $b); do
        [[ $((i%77)) -eq 0 ]] && echo $i
    done
}
```

### Public Test Cases

#### Input 1

```text
1
100
```

#### Output 1

```text
77
```

#### Input 2

```text
1
770
```

#### Output 2

```text
77
154
231
308
385
462
539
616
693
770
```

### Private Test Cases

#### Input 1

```text
1200
3000
```

#### Output 1

```text
1232
1309
1386
1463
1540
1617
1694
1771
1848
1925
2002
2079
2156
2233
2310
2387
2464
2541
2618
2695
2772
2849
2926
```

#### Input 2

```text
924
5929
```

#### Output 2

```text
924
1001
1078
1155
1232
1309
1386
1463
1540
1617
1694
1771
1848
1925
2002
2079
2156
2233
2310
2387
2464
2541
2618
2695
2772
2849
2926
3003
3080
3157
3234
3311
3388
3465
3542
3619
3696
3773
3850
3927
4004
4081
4158
4235
4312
4389
4466
4543
4620
4697
4774
4851
4928
5005
5082
5159
5236
5313
5390
5467
5544
5621
5698
5775
5852
5929
```

---

## Problem 6

Write a function named `touchmod` which takes multiple arguments.

The script should create files for all the filenames provided as the arguments.
The first argument is the permission in octal form (e.g., 755, 644, 777, etc.) and the rest of the arguments are the filenames.

Example: `touchmod 755 abc def ghi` will create three empty files `abc`, `def` and `ghi` if these are not present in the current working directory else change the modified time, and permissions of the files `abc`, `def` and `ghi` to `rwxr-xr-x` (755).

### Solution

```bash
touchmod() {
  for file in "${@:2:$#}"; do
    touch "$file"
    chmod $1 "$file"
  done
}
```

### Invisible code

```bash
read line
touchmod $line | sed -n '1! p' | awk '{print $1,$9}'
```

### Public Test Cases

#### Input 1

```text
touchmod 755 abc def ghi
```

#### Output 1

```text
-rwxr-xr-x abc
-rwxr-xr-x def
-rwxr-xr-x ghi
```

#### Input 2

```text
touchmod 777 a b c d e f g h i
```

#### Output 2

```text
-rwxrwxrwx a
-rwxrwxrwx b
-rwxrwxrwx c
-rwxrwxrwx d
-rwxrwxrwx e
-rwxrwxrwx f
-rwxrwxrwx g
-rwxrwxrwx h
-rwxrwxrwx i
```

### Private Test Cases

#### Input 1

```text
touchmod 444 a b c d e f g h i
```

#### Output 1

```text
-r--r--r-- a
-r--r--r-- b
-r--r--r-- c
-r--r--r-- d
-r--r--r-- e
-r--r--r-- f
-r--r--r-- g
-r--r--r-- h
-r--r--r-- i
```

#### Input 2

```text
touchmod 644 a b c d 1 2 3
```

#### Output 2

```text
-rw-r--r-- a
-rw-r--r-- b
-rw-r--r-- c
-rw-r--r-- d
-rw-r--r-- 1
-rw-r--r-- 2
-rw-r--r-- 3
```

---

## Problem 7

The current directory contains different types of files.
Write a script to move all files in the current directory to the respective directory in the current folder.

| Directory | Extensions                                                      |
| --------- | --------------------------------------------------------------- |
| Image     | `jpg`, `png`, `gif`, `tiff`                                     |
| Video     | `mov`, `mp4`, `mkv`, `avi`                                      |
| Program   | `sh`, `fish`, `py`, `c`, `cpp`, `java`, `perl`, `js`            |
| Other     | No extension or any other extension that is not specified above |

### Solution

```bash
script() {
    for file in *; do
        [ -d "$file" ] && continue
        case "${file##*.}" in
            jpg|png|gif|tiff)
                mv $file Image
                ;;
            mov|mp4|mkv|avi)
                mv $file Video
                ;;
            sh|fish|py|c|cpp|java|perl|js)
                mv $file Program
                ;;
            *)
                mv $file Other
                ;;
        esac
    done
}
```

### Invisible code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do; DIR=$RANDOM; done
mkdir $DIR; cd $DIR

mkdir -p Image Video Program Other
while read line && [[ $line != "" ]]; do
    touch $line
done

script
ls -R
```

### Public Test Cases

#### Input 1

```text
1.jpg
2.gif
3.mov
4.py
5.ui
```

#### Output 1

```text
.:
Image Other Program Video

./Image:
1.jpg 2.gif

./Other:
5.ui

./Program:
4.py

./Video:
3.mov
```

#### Input 2

```text
10064.jpg
1236.gif
30389.png
649.tiff
30198.ts
32314.ui
6265.xorg
14656.fish
18918.perl
23645.js
27576.sh
3605.java
481.py
5148.c
8890.cpp
12893.mov
21804.mp4
30998.mkv
31277.avi
```

#### Output 2

```text
.:
Image Other Program Video

./Image:
10064.jpg 1236.gif 30389.png 649.tiff

./Other:
30198.ts 32314.ui 6265.xorg

./Program:
14656.fish 23645.js 3605.java 5148.c
18918.perl 27576.sh 481.py 8890.cpp

./Video:
12893.mov 21804.mp4 30998.mkv 31277.avi
```

### Private Test Cases

#### Input 1

```text
10064.jpg
1236.gif
30389.png
649.tiff
30198.ts
32314.ui
6265.xorg
14656.fish
18918.perl
23645.js
27576.sh
3605.java
481.py
5148.c
8890.cpp
12893.mov
21804.mp4
30998.mkv
31277.avi
```

#### Output 1

```text
.:
Image Other Program Video

./Image:
10064.jpg 1236.gif 30389.png 649.tiff

./Other:
30198.ts 32314.ui 6265.xorg

./Program:
14656.fish 23645.js 3605.java 5148.c
18918.perl 27576.sh 481.py 8890.cpp

./Video:
12893.mov 21804.mp4 30998.mkv 31277.avi
```

#### Input 2

```text
10064.jpg
1236.gif
30389.png
649.tiff
30198.ts
32314.ui
6265.xorg
14656.fish
18918.perl
23645.js
27576.sh
3605.java
481.py
5148.c
8890.cpp
12893.mov
21804.mp4
30998.mkv
31207.avi
```

#### Output 2

```text
.:
Image Other Program Video

./Image:
10064.jpg 1236.gif 30389.png 649.tiff

./Other:
30198.ts 32314.ui 6265.xorg

./Program:
14656.fish 23645.js 3605.java 5148.c
18918.perl 27576.sh 481.py 8890.cpp

./Video:
12893.mov 21804.mp4 30998.mkv 31207.avi
```

---

## Problem 8 A

Write a script that reads two inputs from the stdin.

- The first line is a directory name present in the current directory.
- The second line is a filename.

Print `present` if the file is present in the directory else print `absent`

### Solution

```bash
script() {
    read dir
    read file
    if [[ -f "$dir/$file" ]] ; then
        echo present
    else
        echo absent
    fi
}
```

### Invisible code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do; DIR=$RANDOM; done
mkdir $DIR; cd $DIR

mkdir -p season tree flower
touch season/summer season/winter season/monsoon \
      season/autumn season/spring \
      tree/sandal tree/oak tree/bamboo \
      flower/lily flower/lotus flower/hibiscus
```

### Public Test Cases

#### Input 1

```text
season
summer
```

#### Output 1

```text
present
```

#### Input 2

```text
tree
banyan
```

#### Output 2

```text
absent
```

### Private Test Cases

#### Input 1

```text
season
winter
```

#### Output 1

```text
present
```

#### Input 2

```text
tree
oak
```

#### Output 2

```text
present
```

#### Input 3

```text
flower
waterlily
```

#### Output 3

```text
absent
```

#### Input 4

```text
tree
tamarind
```

#### Output 4

```text
absent
```

---

## Problem 8 B

Write a script that reads two inputs from the stdin.

- The first line is a directory name present in the current directory.
- The second line is the number of files present in the directory given in the first line.

Print `true` if the number of files in the directory is equal to the number given in the second line else print `false`

### Solution

```bash
script() {
    read dir
    read num
    if [[ $num -eq `ls $dir | wc -l` ]] ; then
        echo true
    else
        echo false
    fi
}
```

### Invisible code

```bash
DIR=$RANDOM
while [[ -a $DIR ]]; do; DIR=$RANDOM; done
mkdir $DIR; cd $DIR

mkdir -p season tree flower
touch season/summer season/winter season/monsoon \
      season/autumn season/spring \
      tree/sandal tree/oak tree/bamboo \
      flower/lily flower/lotus flower/hibiscus
```

### Public Test Cases

#### Input 1

```text
season
5
```

#### Output 1

```text
true
```

#### Input 2

```text
tree
1
```

#### Output 2

```text
false
```

### Private Test Cases

#### Input 1

```text
season
5
```

#### Output 1

```text
true
```

#### Input 2

```text
tree
1
```

#### Output 2

```text
false
```

#### Input 3

```text
flower
3
```

#### Output 3

```text
true
```

#### Input 4

```text
tree
4
```

#### Output 4

```text
false
```

---
