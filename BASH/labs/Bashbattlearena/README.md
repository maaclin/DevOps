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

<img width="498" alt="Screenshot 2025-06-29 at 02 38 55" src="https://github.com/user-attachments/assets/f9cd6852-dfc6-4138-b072-c2dc8e450b00" />

---

### 🔁 Level 2: Variables and Loops – `level2.sh`

**Task:**  
Output the numbers 1 to 10 using a loop.

**What I learned:**  
How to use `for` loops and variables.

**Run it:**  
``./level2.sh``

<img width="276" alt="Screenshot 2025-06-29 at 02 39 06" src="https://github.com/user-attachments/assets/7fb36252-6cde-49c9-bfb9-72a29068724b" />

---

### ❓ Level 3: Conditional Statements – `level3.sh`

**Task:**  
Check if a file called `hero.txt` exists in the `Arena` folder.

**What I learned:**  
How to use `if` statements and file checks (`-f`).

**Run it:**  
``./level3.sh``

<img width="324" alt="Screenshot 2025-06-29 at 02 39 18" src="https://github.com/user-attachments/assets/050f0f2f-2c88-445f-ab4a-9e0decfd51c4" />

---

### 📁 Level 4: File Manipulation – `level4.sh`

**Task:**  
Copy all `.txt` files from `Arena` to a folder called `Backup`.

**What I learned:**  
How to use `cp`, wildcards, and `mkdir -p`.

**Run it:**  
``./level4.sh``

<img width="291" alt="Screenshot 2025-06-29 at 02 39 30" src="https://github.com/user-attachments/assets/294e5d13-2811-46d4-9576-e3df5d057f3f" />

---

### 🧪 Level 5: Boss Battle 1 – `level5.sh`

**Task:**  
Combine skills: create a folder, create files, move one file if it exists, and list contents.

**What I learned:**  
Working with folders, files, conditions, and output all together.

**Run it:**  
``./level5.sh``

<img width="657" alt="Screenshot 2025-06-29 at 02 39 46" src="https://github.com/user-attachments/assets/fd5983aa-833e-4bec-af3b-c195620d4c34" />

---

### 📥 Level 6: Argument Parsing – `level6.sh`

**Task:**  
Write a script that takes a filename as an argument and prints how many lines it has.

**What I learned:**  
Using `$1` to get input, validating arguments, and counting lines with `wc -l`.

**Run it:**  
```level6.sh filename.txt```

<img width="426" alt="Screenshot 2025-06-29 at 02 39 59" src="https://github.com/user-attachments/assets/ac59e25c-3e57-471f-a63e-88c070b1d32c" />

---

### 📊 Level 7: File Sorting Script – `level7.sh`

**Task:**  
Sort `.txt` files by size from smallest to largest.

**What I learned:**  
Using `find`, `ls -lh`, `sort`, and `awk`.

**Run it:**  
``./level7.sh``

<img width="772" alt="Screenshot 2025-06-29 at 02 40 17" src="https://github.com/user-attachments/assets/abf14dd8-26a5-4f4e-a05f-692c5f2cd067" />

---

### 🔍 Level 8: Multi-File Searcher – `level8.sh`

**Task:**  
Search all `.log` files in a directory for a specific word and list matching files.

**What I learned:**  
Using `grep -l` to search multiple files.

**Run it:**  
``./level8.sh``

<img width="428" alt="Screenshot 2025-06-29 at 02 40 30" src="https://github.com/user-attachments/assets/83e0c5fe-b805-4671-b607-27cf2ae06b98" />


---

### 🕵️ Level 9: Monitor Directory Changes – `level9.sh`

**Task:**  
Watch a folder and log when files are added, deleted, or changed.

**What I learned:**  
Using `fswatch`, `while read`, timestamps, and logging file events.

**Run it:**  
``./level9.sh``

> Note: You must have `fswatch` installed. On macOS: `brew install fswatch`.

<img width="738" alt="Screenshot 2025-06-29 at 02 40 48" src="https://github.com/user-attachments/assets/a6da0dde-944b-4b9b-8d34-0a99485ff84e" />

---

### 🧠 Level 10: Boss Battle 2 – `level10.sh`

**Task:**  
Create files with random content, sort by size, and move any file that contains "Victory" to a special folder.

**What I learned:**  
Combining loops, random numbers, file writing, searching, and moving files together.

**Run it:**  
``./level10.sh``

<img width="899" alt="Screenshot 2025-06-29 at 02 41 14" src="https://github.com/user-attachments/assets/df389396-b65a-4987-bc04-8c29f934c1d1" />

---

### 🧑‍🎓 About This Series

These first 10 levels were designed to build a strong foundation in Bash scripting. Each task layered on top of the last — moving from simple commands to combining logic, arguments, conditions, loops, and automation. All scripts were tested locally on macOS.

More levels to come 💥
