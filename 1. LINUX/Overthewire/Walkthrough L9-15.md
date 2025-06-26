# OverTheWire **Bandit** Walk‑through — Levels 9 ➡ 15

Now it's starting to heat up!
---

### Level 9 ➡ 10 — Hidden string inside a binary 

We have a hidden string inside a binary so we extract strings and use grep to filter for "===".

```bash
strings data.txt | grep "==="     # FGUW5illVJrxX9kMYMnLN4MgbpfMiqey
```
![image](https://github.com/user-attachments/assets/22523032-f2d4-47cf-8688-8b76cf4779be)

### Level 10 ➡ 11 — Base64 decoded plain‑text

`data.txt` is Base64‑encoded so we decode using base64 --decode/-d.

```bash
cat data.txt 
base64 --decode data.txt           # The password is dTR173fZKb0RRsDFSGsg2RWnpNVj3qRr
```
![image](https://github.com/user-attachments/assets/923d2e30-6407-483a-9c0c-4aca06b399b9)

### Level 11 ➡ 12 — Classic ROT13

File is shifted by 13 characters so we use tr 'A-Za-z' 'N-ZA-Mn-za-m' to rotate all characters by 13. 

```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
# The password is 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```
![image](https://github.com/user-attachments/assets/22bbf870-c4c9-4f8b-bc24-1861f9536e9d)

### Level 12 ➡ 13 — Decompression

`data.txt` is wrapped in multiple compression formats.  A tedious loop of **file ➜ rename ➜ extract** does the job until we get to the final file with our next levels password:

```bash
# work outside $HOME to avoid write‑permission errors
tmp=/tmp/banditemp && mkdir -p "$tmp" && cd "$tmp"
cp ~/data.txt data

file data              # POSIX tar → rename + untar
mv data data.tar && tar xf data.tar && rm data.tar

file *                 # data8.bin → gzip
mv data8.bin data.gz && gzip -d data.gz

# repeat file → rename → extract until you get plain ASCII
file data              # ASCII text
cat data               # FO5dwFsc0cba1H0h8J2eUks2vdTDwAn
```

![image](https://github.com/user-attachments/assets/d65b0d60-c3d6-45dc-8391-bdf84da0ecdf)

### Level 13 ➡ 14 — SSH Keys

The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. We use the ssh key to log into the next level and then use cat to read the password at /bandit_pass/bandit14. 



```bash
ssh -i sshkey.private bandit14@localhost -p 2220
cat /etc/bandit_pass/bandit14     #MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
```


### Level 14 ➡ 15 — Using NC

The password for Bandit Level 15 was stored on a server listening on port 3000 of localhost. We use netstat to connect to port 30000 and enter our previous password to give us the new password.

```bash
nc localhost 30000
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS    #8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
```

<img width="721" alt="Screenshot 2025-06-25 at 16 53 29" src="https://github.com/user-attachments/assets/5ec586cc-3b30-4545-95ab-2910a4ecbcde" /> 

### Level 15 ➡ 16 — Encrypted Connection over SSL 

The next password can retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption. We will use openssl s_client -connect localhost:30001 to connect to the server at port 30001 and we will get the certification details and simply enter the password into the field to get the next one.

```bash

openssl s_client -connect localhost:30001

```

<img width="690" alt="Screenshot 2025-06-25 at 22 16 43" src="https://github.com/user-attachments/assets/31bc3005-d424-47e0-967f-1e3ffd414c5e" /> 
