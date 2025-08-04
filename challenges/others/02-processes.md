# Process exercises

## 🧪 Exercise 1: Print from Child and Parent Using `fork`

### ✅ Goal:

Use `fork` to create a child process that prints its PID. The parent should wait and print its own PID.

```ruby
# Output (example):
# Child PID: 12345
# Parent PID: 12340
```

### 🔧 Tasks:

* Use `fork` to run a block.
* In child: `puts "Child PID: #{Process.pid}"`
* In parent: `puts "Parent PID: #{Process.pid}"` after `Process.wait`.

---

## 🧪 Exercise 2: Use `exec` to Replace a Process

### ✅ Goal:

Fork a child process that runs `ls -l` using `exec`. The child should **not return**.

```ruby
# Output: Listing of current directory from child
```

### 🔧 Tasks:

* In the child block: `exec("ls", "-l")`
* Add `puts` statements before and after `exec` to prove it never returns.

---

## 🧪 Exercise 3: Run a Background Command Using `spawn`

### ✅ Goal:

Use `spawn` to launch a command (`sleep 3`) and immediately print the PID.

```ruby
# Output: Spawned sleep with PID 12345
```

### 🔧 Tasks:

* Use `spawn("sleep", "3")`
* Print PID and use `Process.wait` to wait for completion.

---

## 🧪 Exercise 4: Use Backticks to Capture Command Output

### ✅ Goal:

Run a shell command (`uptime` or `whoami`) and print the output string.

```ruby
# Output: Current user is gaurav
```

### 🔧 Tasks:

* Use backticks: `` output = `whoami` ``
* `puts "Current user is #{output.strip}"`

---

## 🧪 Exercise 5: Combine `fork` + `exec` to Run `ping`

### ✅ Goal:

Fork a process that `exec`s `ping -c 2 google.com`. The parent waits.

```ruby
# Output: 2 ping responses from child process
```

---

## 🧪 Exercise 6: Spawn Multiple Commands in Parallel

### ✅ Goal:

Use `spawn` to run 3 `sleep` commands in parallel and wait for all of them.

```ruby
# Output: All done after 3 seconds
```

### 🔧 Tasks:

* Spawn `sleep 3` three times.
* Store PIDs in an array.
* Wait for each using `Process.wait(pid)`.

---

## 🧪 Exercise 7: Pipe Output Using Shell and Backticks

### ✅ Goal:

Use backticks to get the number of running `ruby` processes.

```ruby
# Output: 2 Ruby processes running
```

### 🔧 Tasks:

* Use shell pipe: ``count = `ps aux | grep ruby | grep -v grep | wc -l`.to_i``

---

## 🧪 Exercise 8: Error Handling for `spawn` Failure

### ✅ Goal:

Try spawning a non-existent command (`foobarbaz`), catch the error, and print a message.

```ruby
# Output: Failed to run command: No such file or directory
```

### 🔧 Tasks:

* Wrap `spawn("foobarbaz")` in `begin ... rescue => e`

---

## 🧪 Exercise 9: Capture Output of Long Command and Save to File

### ✅ Goal:

Capture `ls -lR /` output using backticks and write to `/tmp/ls_output.txt`.

---

## 🧪 Exercise 10: Demonstrate `exec` Ends Process

### ✅ Goal:

Show that code after `exec` is not executed.

```ruby
puts "Before exec"
exec("echo Hello")
puts "After exec" # should never run
```
