# OverTheWire **Bandit** Walk‑through — Levels 0 ➡ 8

> Speed run of the first 8 levels before we get into the nitty gritty of the more difficult L8-20.
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

---

## Level 1 ➡ 2 — A file literally called “‑”

The filename is a single dash. Treat it as a *normal* file by prefixing `./`.

```bash
ls       # -> -
cat ./-  # 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
```

---

## Level 2 ➡ 3 — Spaces in *this* filename

Escape spaces (or quote the name) to access the file.

```bash
ls                                 # -> "spaces in this filename"
cat spaces\ in\ this\ filename     # MNk8KNH3Usitio41PRUEoDFPqfxLPlSmx
```

---

## Level 3 ➡ 4 — Hidden…really hidden

A directory `inhere` contains a hidden triple‑dotted filename. Using tab shortcut speeds everything up!

```bash
cd inhere
ls -al                 # reveals ...Hiding-From-You
cat ...Hiding-From-You # 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```

---

## Level 4 ➡ 5 — Nine mystery files

Only one of the ten files is human‑readable. Used `file` to scan all files in directory using ./* to find ASCII text.

```bash
cd inhere
file ./*      # -file07 -> "ASCII text"
cat ./-file07 # 4oQYVPkxZOOEO5pTW81FB8j8lxXGUQw
```

---

## Level 5 ➡ 6 — Finder’s keepers

Passwords sits inside a file that is **exactly** 1033 bytes. Let `find` do the leg‑work using -size and -type to pinpoint the exact file.

```bash
cd inhere
find . -type f -size 1033c        # ./maybehhere07/.file2
cat ./maybehhere07/.file2         # HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```

---

## Level 6 ➡ 7 — System‑wide Easter egg

The file is somewhere on the whole server, owned by *bandit7*, group *bandit6*, and 33 bytes long. Using 2>/dev/null elimates all the denied permissions to find the singular file.

```bash
find / -size 33c -user bandit7 -group bandit6 2>/dev/null
# -> /var/lib/dpkg/info/bandit7.password
cat /var/lib/dpkg/info/bandit7.password  # morbNTDKSW6jIUc0ymOdMaLn0LFVAaj
```

---

## Level 7 ➡ 8 — Grepping the millionth row

A single line in `data.txt` contains the word *millionth*, perfect use of grep.

```bash
grep "millionth" data.txt  # dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```

---

## Level 8 ➡ 9 — Unique needle in a haystack

`data.txt` holds many duplicate strings; we need the **only** unique one. Stumped me at first with the double usage of uniq and -u, always relate back to man pages!

```bash
sort data.txt | uniq -u  # 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
```

---
