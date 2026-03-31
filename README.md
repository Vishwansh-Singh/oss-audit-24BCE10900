# oss-audit-24BCE10900

**Student Name:** Vishwansh Singh  
**Registration Number:** 24BCE10900  
**Course:** Open Source Software (OSS NGMC)  
**Chosen Software:** Linux Kernel  
**Slot:** A24

---

## What This Project Is

This is my capstone project for the Open Source Software course. I picked the Linux Kernel as my subject because it has one of the most interesting origin stories in software history — a student who just wanted a free OS ended up changing the entire world of computing.

The project has two parts:
- A written report covering the history, licence, ethics, Linux footprint, ecosystem, and a comparison with proprietary alternatives
- Five shell scripts that demonstrate practical Linux command-line skills

---

## Chosen Software — Linux Kernel

The Linux Kernel is the core of the Linux operating system. It was created by Linus Torvalds in 1991 and is licensed under the **GNU General Public License version 2 (GPL v2)**. It currently powers most of the world's web servers, every Android device, and the top 500 supercomputers on the planet.

---

## Shell Scripts

There are 5 scripts in this repo. Here's what each one does:

### script1_system_identity.sh
Prints a welcome screen with basic system information — kernel version, distro name, logged-in user, home directory, uptime, and current date/time. Also mentions the GPL v2 licence that covers the OS.

**Concepts used:** variables, command substitution `$()`, `echo`, `uname`, `whoami`, `date`

---

### script2_package_inspector.sh
Checks if a given package is installed on the system using `rpm -q`. If it is, shows the version, licence, and summary. Uses a `case` statement to print a short note about the open-source philosophy behind each package.

**Concepts used:** `if-then-else`, `case` statement, `rpm -qi`, pipes with `grep`

---

### script3_disk_auditor.sh
Loops through a list of important Linux directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/boot`) and prints the permissions, owner, group, and size of each one. Also checks the running kernel's module directory specifically.

**Concepts used:** `for` loop, arrays, `if [ -d ]`, `ls -ld`, `du -sh`, `awk`, `cut`

---

### script4_log_analyzer.sh
Reads a log file line by line and counts how many lines contain a given keyword. Defaults to searching for "error" if no keyword is provided. Prints the total count and shows the last 5 matching lines.

**Concepts used:** `while IFS= read -r`, `if-then` inside loop, counter with `$(( ))`, command-line arguments `$1 $2`, `grep -i`, `tail`

---

### script5_manifesto.sh
Asks the user 3 questions interactively, then writes a short personal open-source philosophy statement using their answers and saves it to a `.txt` file. Displays the result at the end.

**Concepts used:** `read -p`, string building with variables, writing to file with `>` and `>>`, `date`, `cat`, alias concept shown in comments

---

## How to Run the Scripts

### Step 1 — Clone the repo

```bash
git clone https://github.com/Vishwansh-Singh/oss-audit-24BCE10900.git
cd oss-audit-24BCE10900
```

### Step 2 — Give execute permission to the scripts

```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto.sh
```

### Step 3 — Run each script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**  
Pass a package name as argument. Defaults to `kernel` if nothing is given.
```bash
./script2_package_inspector.sh kernel
./script2_package_inspector.sh git
./script2_package_inspector.sh vlc
```

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_auditor.sh
```

**Script 4 — Log File Analyzer**  
Pass a log file path. Optionally pass a keyword (defaults to `error`).
```bash
./script4_log_analyzer.sh /var/log/messages
./script4_log_analyzer.sh /var/log/messages warning
```
> Note: You may need `sudo` to read some log files depending on your system.

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto.sh
```
It will ask you 3 questions and save your manifesto to `manifesto_[yourusername].txt`.

---

## Dependencies

All scripts use standard tools available on any Linux system by default:

| Tool | Purpose |
|------|---------|
| `bash` | Shell interpreter — needed to run all scripts |
| `uname` | Getting kernel and system info |
| `whoami` | Getting current username |
| `uptime` | System uptime |
| `date` | Current date and time |
| `rpm` | Package info (RPM-based systems like Fedora/RHEL) |
| `ls`, `du` | Directory permissions and disk usage |
| `grep`, `awk`, `cut` | Text filtering and field extraction |

> If you are on a **Debian/Ubuntu** system, Script 2 uses `rpm -q` which may not be available. Replace it with `dpkg -l $PACKAGE` and `dpkg -s $PACKAGE` for equivalent output.

---

## Project Report

The full written report (`Linux_OSS_Capstone_Report.docx`) is submitted separately on the VITyarthi portal. It covers:

- Origin story of the Linux Kernel
- GPL v2 licence analysis and the four freedoms
- Ethics of open source software
- Linux footprint — directories, permissions, update model
- FOSS ecosystem — Android, Docker, LAMP stack, community governance
- Comparison table: Linux vs Windows / macOS
- All 5 scripts with code, screenshots, and explanations

---

## Notes

- All scripts have been tested on Fedora Linux
- Scripts are kept simple and readable — every non-obvious line has a comment explaining what it does
