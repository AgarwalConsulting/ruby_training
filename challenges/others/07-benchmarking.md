# Benchmarking Exercises

## 🧪 **Exercise: Compare I/O and Data Processing Techniques**

### 📂 **Context**

You are given a large text file (`data.txt`, \~50–100 MB) with lines like:

```
123,John Doe,42,Engineer
124,Jane Roe,35,Manager
...
```

Your task is to extract and count the number of engineers (`job_title == "Engineer"`) using different I/O and processing techniques.

---

## 📌 **Techniques to Compare**

### 🔢 1. **Read Whole File into Memory**

```ruby
lines = File.read("data.txt").lines
count = lines.count { |line| line.split(',')[3].chomp == "Engineer" }
```

* ✅ Fast processing
* ❌ High memory usage

---

### 🧵 2. **Line-by-Line Processing**

```ruby
count = 0
File.foreach("data.txt") do |line|
  count += 1 if line.split(',')[3].chomp == "Engineer"
end
```

* ✅ Lower memory usage
* ⚖️ Slightly higher CPU if not optimized

---

### 🪢 3. **Use Enumerator Pipeline**

```ruby
lines = Enumerator.new do |yielder|
  File.foreach("data.txt") { |line| yielder << line }
end

count = lines.lazy.map { |l| l.split(',')[3].chomp }
              .count { |job| job == "Engineer" }
```

* ✅ Composable
* ⚖️ May trade CPU for memory efficiency
* ✅ GC-friendly in streaming contexts

---

### ⚡ 4. **Memory-Mapped I/O (if available)**

```ruby
# Only on Unix-like systems with `mmap` support
require 'mmap'

count = 0
Mmap.open("data.txt", "r") do |mm|
  mm.each_line do |line|
    count += 1 if line.split(',')[3].chomp == "Engineer"
  end
end
```

* ⚠️ Platform-dependent
* ✅ Fastest for huge files
* ❌ Not stdlib

---

## 🧰 **Measurements to Collect**

For each method:

1. ⏱ **Benchmark Time**

   ```ruby
   require 'benchmark'
   puts Benchmark.measure { method_call }
   ```

2. 💾 **Memory Usage**

   ```ruby
   puts `grep VmRSS /proc/#{$$}/status`
   ```

3. 🧹 **GC Stats**

   ```ruby
   GC.start
   before = GC.stat
   method_call
   after = GC.stat

   puts "Objects Allocated: #{after[:total_allocated_objects] - before[:total_allocated_objects]}"
   ```

---

## 📈 **Output Format Example**

```
== Whole File ==
Time: 0.231s
Mem: 85 MB
Objects: 980_000

== Line-by-Line ==
Time: 0.317s
Mem: 12 MB
Objects: 130_000

== Enumerator.lazy ==
Time: 0.423s
Mem: 10 MB
Objects: 100_000
```

---

## 📦 Bonus: Use Binary I/O for CSV parsing

Compare parsing via:

* `String#split(',')`
* CSV parsing via `CSV.foreach` (uses more memory, but handles quoted values)
* Binary read with regex for minimal memory use (advanced)

---

## Script to generate data

```ruby
require 'zlib'
require 'securerandom'

# === Config ===
OUTPUT_FILE = 'data.txt.gz'
TARGET_SIZE_MB = 100
LINE_TEMPLATE = "%d,%s,%d,%s\n"
JOBS = %w[Engineer Manager Technician Clerk Analyst Developer Designer]
NAMES = -> { SecureRandom.hex(4).capitalize }  # 8-char pseudo name
AGES = 20..65

# === Size Estimation ===
AVG_LINE_SIZE = 50  # estimated average bytes per line
TOTAL_LINES = (TARGET_SIZE_MB * 1024 * 1024) / AVG_LINE_SIZE

puts "Generating #{TOTAL_LINES} lines (~#{TARGET_SIZE_MB} MB uncompressed)..."

Zlib::GzipWriter.open(OUTPUT_FILE) do |gz|
  TOTAL_LINES.times do |i|
    line = LINE_TEMPLATE % [
      i + 1,
      NAMES.call,
      rand(AGES),
      JOBS.sample
    ]
    gz.write(line)
    puts "Wrote #{i + 1} lines" if (i + 1) % 250_000 == 0
  end
end

puts "Done! Output: #{OUTPUT_FILE}"
```
