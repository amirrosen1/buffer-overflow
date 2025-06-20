# 🔐 Buffer Overflow Exploit – Exercise 1

This repository contains the solution for **Exercise 1 – Buffer Overflow** from the Cybersecurity Lab (67607) at the Hebrew University.

---

## 📚 Overview

The objective of this exercise is to exploit a **stack-based buffer overflow vulnerability** in a remote C server.  
The crafted payload overflows the buffer, overwrites the return address, and injects custom shellcode that executes the script `/tmp/success_script` with the submitter's ID.

---

## 🛠️ Files Included

| File              | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `ex1.c`           | Main C program – crafts and sends the buffer overflow payload               |
| `shellcode.s`     | Assembly source for the injected shellcode                                  |
| `explanation.txt` | Detailed explanation of the payload and assembly logic                      |
| `readme.txt`      | Submitter IDs in the format `id1,id2`                                       |
| `.gitignore`      | Ignores `.zip`, `.vmdk`, PDFs, and other irrelevant files                   |

---

## 🚀 How to Run

1. **Compile the attacker code** inside the *client container*:
   ```bash
   gcc -Wall -Wextra -Werror ex1.c -o attacker
