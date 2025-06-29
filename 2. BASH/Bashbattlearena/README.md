# 🛡️ Bash Battle Arena – Levels 1 to 10

This is my progress through the first 10 levels of the **Bash Battle Arena** – a gamified way to learn Bash scripting basics and beyond. Each level introduced a new concept or combined previously learned skills into challenges.

Below is a breakdown of each level, what it taught me, and how to use the script.

---

### ⚔️ Level 1: The Basics – `level1.sh`

**Task:**  
Create a folder called `Arena` and add three text files: `warrior.txt`, `mage.txt`, and `archer.txt`.

**What I learned:**  
Basic commands like `mkdir`, `touch`, and `ls`.

**Run it:**  
``./level1.sh``

---

### 🔁 Level 2: Variables and Loops – `level2.sh`

**Task:**  
Output the numbers 1 to 10 using a loop.

**What I learned:**  
How to use `for` loops and variables.

**Run it:**  
``./level2.sh``

---

### ❓ Level 3: Conditional Statements – `level3.sh`

**Task:**  
Check if a file called `hero.txt` exists in the `Arena` folder.

**What I learned:**  
How to use `if` statements and file checks (`-f`).

**Run it:**  
``./level3.sh``

---

### 📁 Level 4: File Manipulation – `level4.sh`

**Task:**  
Copy all `.txt` files from `Arena` to a folder called `Backup`.

**What I learned:**  
How to use `cp`, wildcards, and `mkdir -p`.

**Run it:**  
``./level4.sh``

---

### 🧪 Level 5: Boss Battle 1 – `level5.sh`

**Task:**  
Combine skills: create a folder, create files, move one file if it exists, and list contents.

**What I learned:**  
Working with folders, files, conditions, and output all together.

**Run it:**  
``./level5.sh``

---

### 📥 Level 6: Argument Parsing – `level6.sh`

**Task:**  
Write a script that takes a filename as an argument and prints how many lines it has.

**What I learned:**  
Using `$1` to get input, validating arguments, and counting lines with `wc -l`.

**Run it:**  
```level6.sh filename.txt```

---

### 📊 Level 7: File Sorting Script – `level7.sh`

**Task:**  
Sort `.txt` files by size from smallest to largest.

**What I learned:**  
Using `find`, `ls -lh`, `sort`, and `awk`.

**Run it:**  
``./level7.sh``

---

### 🔍 Level 8: Multi-File Searcher – `level8.sh`

**Task:**  
Search all `.log` files in a directory for a specific word and list matching files.

**What I learned:**  
Using `grep -l` to search multiple files.

**Run it:**  
``./level8.sh``

---

### 🕵️ Level 9: Monitor Directory Changes – `level9.sh`

**Task:**  
Watch a folder and log when files are added, deleted, or changed.

**What I learned:**  
Using `fswatch`, `while read`, timestamps, and logging file events.

**Run it:**  
``./level9.sh``

> Note: You must have `fswatch` installed. On macOS: `brew install fswatch`.

---

### 🧠 Level 10: Boss Battle 2 – `level10.sh`

**Task:**  
Create files with random content, sort by size, and move any file that contains "Victory" to a special folder.

**What I learned:**  
Combining loops, random numbers, file writing, searching, and moving files together.

**Run it:**  
``./level10.sh``

---

### 🧑‍🎓 About This Series

These first 10 levels were designed to build a strong foundation in Bash scripting. Each task layered on top of the last — moving from simple commands to combining logic, arguments, conditions, loops, and automation. All scripts were tested locally on macOS.

More levels to come 💥
