# OverTheWire **Bandit** Game Walk‑through — Levels 0  ➡  8

![image](https://0xffd700.com/bl-content/uploads/pages/235dd5a1a58e7e86a12bce71f51c34c5/cover-bandit.png)

> Bandit is a game designed to practice your ability to work with the Linux terminal. Each level presents unique tasks, requiring you to navigate directories, manipulate files, and leverage various commands to uncover hidden passwords and progress to the next stage.

> Here we'll have speed run of the first 8 levels before we get into the nitty gritty of the more difficult L8-20.

> Don't let the first couple levels fool you, it starts to pick up reeeall quick!

---

## 💡 Prereqs

* Any Unix‑like shell (Linux, macOS, WSL, or a remote VM)
* SSH client

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
# default password: bandit0
```

---

## Level 0 ➡ 1 — Reading the obvious

The only file in the home directory is `readme`. Simple cat to open the file.

```bash
ls          # -> readme
cat readme  # ZjLjTmM6FvvyRnrB2rfNWOZOTa6ip5
```
![image](https://github.com/user-attachments/assets/61837c66-2e4e-4043-a77d-e6374135cab6)

---

## Level 1 ➡ 2 — A file literally called “‑”

The filename is a single dash. Treat it as a *normal* file by prefixing `./`.

```bash
ls       # -> -
cat ./-  # 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
```
![image](https://github.com/user-attachments/assets/6e7cc25e-2799-47a9-8006-94dfa25fcd05)

---

## Level 2 ➡ 3 — Spaces in *this* filename

Escape spaces (or quote the name) to access the file.

```bash
ls                                 # -> "spaces in this filename"
cat spaces\ in\ this\ filename     # MNk8KNH3Usitio41PRUEoDFPqfxLPlSmx
```
![image](https://github.com/user-attachments/assets/1297545f-4a68-4133-a149-aa7bd5a138e4)

---

## Level 3 ➡ 4 — Hidden…really hidden

A directory `inhere` contains a hidden triple‑dotted filename. Using tab shortcut speeds everything up!

```bash
cd inhere
ls -al                 # reveals ...Hiding-From-You
cat ...Hiding-From-You # 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```
![image](https://github.com/user-attachments/assets/cb230926-5890-490b-9de8-47078b12eec1)

---

## Level 4 ➡ 5 — Nine mystery files

Only one of the ten files is human‑readable. Used `file` to scan all files in directory using ./* to find ASCII text.

```bash
cd inhere
file ./*      # -file07 -> "ASCII text"
cat ./-file07 # 4oQYVPkxZOOEO5pTW81FB8j8lxXGUQw
```
![image](https://github.com/user-attachments/assets/a156a9c8-0ab1-46dc-ad73-c78e0b5ffb1c)
---

## Level 5 ➡ 6 — Finder’s keepers

Passwords sits inside a file that is **exactly** 1033 bytes. Let `find` do the leg‑work using -size and -type to pinpoint the exact file.

```bash
cd inhere
find . -type f -size 1033c        # ./maybehhere07/.file2
cat ./maybehhere07/.file2         # HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```
![image](https://github.com/user-attachments/assets/e9fa0583-a7d1-4892-919b-0367a742aa53)

---

## Level 6 ➡ 7 — System‑wide Easter egg

The file is somewhere on the whole server, owned by *bandit7*, group *bandit6*, and 33 bytes long. Using 2>/dev/null elimates all the denied permissions to find the singular file.

```bash
find / -size 33c -user bandit7 -group bandit6 2>/dev/null
# -> /var/lib/dpkg/info/bandit7.password
cat /var/lib/dpkg/info/bandit7.password  # morbNTDKSW6jIUc0ymOdMaLn0LFVAaj
```
![image](https://github.com/user-attachments/assets/01b4c787-8b20-466a-a10c-4a4e660f6874)

---

## Level 7 ➡ 8 — Grepping the millionth row

A single line in `data.txt` contains the word *millionth*, perfect use of grep.

```bash
grep "millionth" data.txt  # dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```
![image](https://github.com/user-attachments/assets/ff6c8859-3d96-4088-aad1-d973ee1ce688)
---

## Level 8 ➡ 9 — Unique needle in a haystack

`data.txt` holds many duplicate strings; we need the **only** unique one. Stumped me at first with the double usage of uniq and -u, always relate back to man pages!

```bash
sort data.txt | uniq -u  # 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
```
![image](https://github.com/user-attachments/assets/15942896-fc23-48ea-85df-3c61d151966d)
---
