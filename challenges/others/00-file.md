# File exercises

## 🧩 SECTION 1: **Reading from `/proc`**

### 🟢 **Exercise 1: Current Process Info**

**Task**: Read and print info from `/proc/self/status`

```ruby
# Output format:
# Name: ruby
# State: R (running)
# Threads: 5
```

**Bonus**: Use a method to return a hash like:

```ruby
{ "Name" => "ruby", "State" => "R (running)", "Threads" => "5" }
```

---

### 🟡 **Exercise 2: List Running PIDs**

**Task**: Print all numeric directories in `/proc` (i.e., running PIDs)

```ruby
# Output:
# 1
# 123
# 4567
```

**Bonus**: For each PID, print its command name from `/proc/<pid>/comm`

---

### 🟡 **Exercise 3: Top 5 Memory-Hungry Processes**

**Task**:

* Read all `/proc/[pid]/status` files
* Extract `VmRSS` (Resident Set Size)
* Show top 5 processes by memory

```bash
# Sample Output
1234 - ruby - 8424 kB
2456 - postgres - 7652 kB
```

---

### 🔴 **Exercise 4: Detect Zombie Processes**

**Task**: Identify and list all processes where `State` starts with `Z` (Zombie)

```bash
# Output:
Zombie processes:
1234 - defunct
```

---

## 🧩 SECTION 2: **File Utilities**

### 🟢 **Exercise 5: Safe File Writer**

**Task**:

* Accept a file path and string content
* Write to file, creating parent directories if needed
* Backup old file if exists: rename to `.bak`

```ruby
write_file_safe("logs/output.txt", "hello world")
```

---

### 🟡 **Exercise 6: Directory Cleaner**

**Task**:

* Delete all `.log` files older than 7 days in a given directory
* Ask for confirmation unless `--force` is passed

---

### 🔴 **Exercise 7: File Monitor Tool**

**Task**:

* Watch a file for changes every 2 seconds (use `File.mtime`)
* Print “File changed!” when updated

**Bonus**:

* Log changes to a separate audit file
* Watch multiple files in parallel (with threads or fibers)

---

## 🧩 SECTION 3: **Combined Mini-Project**

### 🔴🔴 **Exercise 8: `/proc` Diagnostic Logger**

**Task**:

* Every 5 seconds:

  * Capture:

    * Total memory used (`/proc/meminfo`)
    * Top 3 processes by CPU and memory
    * Number of threads across all processes
* Write to log file with timestamp

```bash
# Output:
[2025-08-03 22:10:01]
Total Mem: 8023400 kB
Top Memory Processes:
  123 ruby     8120 kB
  456 chrome   7156 kB
Threads: 412
```
