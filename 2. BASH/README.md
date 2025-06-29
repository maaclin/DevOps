# 🧠 Bash Scripting Practice Tasks

This folder contains a set of beginner-level Bash scripts I've written while learning the basics of Linux shell scripting. Each script focuses on a different skill like arithmetic, file handling, conditionals, and backups. These were completed as part of the BASH module.

---

### 1️⃣ Basic Arithmetic – `1_basic.sh`

**Assignment:**  
Write a script that takes two numbers as input from the user and performs basic arithmetic operations (addition, subtraction, multiplication, and division). Display the results in the terminal.

**How to use:**  

``./1_basic.sh``

<img width="345" alt="Screenshot 2025-06-29 at 02 12 15" src="https://github.com/user-attachments/assets/49a2197e-2951-4b3c-837a-5a1715b2a06c" />

``You'll be prompted to enter two numbers. The script will then show the sum, difference, product, and quotient.``

---

### 2️⃣ File Operations – `2_file.sh`

**Assignment:**
Write a script that creates a directory, navigates into it, creates a file inside it, writes some text to the file and then displays the contents of the file.

How to use:

``2_file.sh``

<img width="356" alt="Screenshot 2025-06-29 at 02 12 28" src="https://github.com/user-attachments/assets/f152800f-0a23-46b0-9062-6efcf04d11b0" />

``The script will make a folder called Testing, create a file inside, add some text, and print it to the screen.``

---

### 3️⃣ Conditional File Check – `3_conditional.sh`
**Assignment:**
Write a script that checks if a file exists and prints a message. If it exists, check if it's readable, writable, or executable.

How to use:

``3_conditional.sh``

<img width="571" alt="Screenshot 2025-06-29 at 02 13 14" src="https://github.com/user-attachments/assets/b0ec6791-ac7c-46ac-a55d-0e620abde945" />

``You'll be asked to enter a filename. The script will tell you if the file exists in the directory and what permissions you have on it or if it has no permissions.``

---

### 4️⃣ Backup Script – `4_backup.sh`
**Assignment:**
Create a script that copies all .txt files from a specified directory to a backup directory. If the backup folder doesn't exist, the script should create it first.

How to use:

``4_backup.sh``

<img width="434" alt="Screenshot 2025-06-29 at 02 13 37" src="https://github.com/user-attachments/assets/f2166236-b973-48e2-b744-62a807e2214d" />

``You'll enter the path to a folder, if it exists the script will look for .txt files and copy them to a Backup folder and if it the directory or file does not exist it will fail and exit. We use ${..}[0] to prevent errors by making sure at least one file exists before copying. ``

---
