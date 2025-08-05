# 🧪 Exercise: Compare Ruby GC Performance on Two Systems

## 🧰 **Goal:**

Measure GC **pause time**, **frequency**, and **heap growth** under simulated load.

---

## 🧱 Step 1: Create a Benchmark Script

Create a file: `gc_benchmark.rb`

```ruby
require 'benchmark'
require 'gc'

GC::Profiler.enable

def generate_garbage(count)
  Array.new(count) { "string" * rand(100..200) }
end

def run_test(name, iterations: 50_000, gc_trigger_every: 5_000)
  puts "\n== Test: #{name} =="

  Benchmark.bm do |x|
    x.report("Allocating objects") do
      iterations.times do |i|
        generate_garbage(10)
        GC.start if i % gc_trigger_every == 0
      end
    end
  end

  puts "\nGC Stats:"
  stats = GC.stat
  puts "  Minor GCs: #{stats[:minor_gc_count]}"
  puts "  Major GCs: #{stats[:major_gc_count]}"
  puts "  Total Allocated Objects: #{stats[:total_allocated_objects]}"
  puts "  Heap Used: #{stats[:heap_live_slots] * 40 / 1024 / 1024.0} MB"
  puts "  GC Time (ms):"
  puts GC::Profiler.report
end

run_test("Default GC Settings")
```

---

## 🧪 Step 2: Create a Latency-Constrained GC Profile

Create `gc_constrained_env.sh`:

```bash
#!/bin/bash

# Simulates constrained/embedded GC tuning
export RUBY_GC_HEAP_INIT_SLOTS=20000
export RUBY_GC_HEAP_GROWTH_FACTOR=1.1
export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=10000
export RUBY_GC_MALLOC_LIMIT=8000000
export RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR=1.1
export RUBY_GC_OLDOBJECT_LIMIT_FACTOR=1.0
export RUBY_GC_COMPACT=false

ruby gc_benchmark.rb
```

---

## 🖥️ Step 3: Full System (Default Settings)

Run:

```bash
ruby gc_benchmark.rb
```

---

## 📱 Step 4: Constrained System (Simulated)

Run:

```bash
bash gc_constrained_env.sh
```

---

## 📊 Step 5: Compare Results

Look at and compare:

| Metric                 | Expectation                                            |
| ---------------------- | ------------------------------------------------------ |
| **Total GC Time**      | Higher on constrained system (due to more frequent GC) |
| **GC Pause Duration**  | Lower per GC on constrained system                     |
| **Major GC Frequency** | May be higher if `OLDOBJECT_LIMIT_FACTOR` is low       |
| **Memory Usage**       | Lower in constrained system                            |

---

## 🧠 Analysis Prompts

1. How does **heap size** compare?
2. Are **GCs more frequent** on constrained setup?
3. How does **total execution time** compare?
4. Would compacting GC help in reducing memory fragmentation?

---

## 🧩 Optional Variants

* Add a **`GC::Profiler.clear`** and run multiple `run_test(...)` with different iteration counts.
* Run on **actual embedded system** (e.g., Yocto or Buildroot image with MRI Ruby).
* Compare **performance with vs without compaction** (`RUBY_GC_COMPACT=true`).

---

Would you like:

* A version of this script that **logs to CSV**?
* Or a **side-by-side shell runner** that compares both profiles automatically?

Let me know how deep you want to go.
