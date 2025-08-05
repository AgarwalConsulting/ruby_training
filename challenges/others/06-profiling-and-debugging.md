# Profiling and debugging exercises

---

Write a Ruby script that:

1. Allocates lots of objects (e.g., strings or arrays).
2. Profiles with:

   * `memory_profiler` to spot retained objects.
   * `stackprof` in `:object` mode.
   * `ruby-prof` in `ALLOCATIONS` mode.
3. Fixes the leak by nullifying references and re-running the tools.

---

## 🧪 **Exercise: Profiling and Fixing a Memory-Intensive Ruby Script**

### 🧵 Step 1: The Problem Script (`leaky.rb`)

Save the following code as `leaky.rb`:

```ruby
# leaky.rb
class UserCache
  def initialize
    @cache = {}
  end

  def store_users(users)
    users.each do |user|
      @cache[user[:id]] = user
    end
  end
end

def generate_fake_users(n)
  Array.new(n) do |i|
    {
      id: i,
      name: "User #{i}",
      data: "x" * 1024 # 1 KB string
    }
  end
end

cache = UserCache.new

1000.times do |i|
  users = generate_fake_users(1000) # 1000 users * 1 KB = ~1 MB per iteration
  cache.store_users(users)
  puts "Stored batch #{i + 1}"
end

sleep 10
```

### 🔍 What’s Wrong?

* The cache never clears old users. It keeps growing forever.
* Each loop stores \~1 MB more => 1 GB after 1000 iterations.
* Retained memory grows linearly = memory leak.

---

## 🎯 Your Tasks

### ✅ 1. **Run It and Observe Memory**

```sh
ruby leaky.rb
```

Check memory in another terminal:

```sh
top -p $(pgrep -n ruby)
```

---

### ✅ 2. **Profile with `memory_profiler`**

Modify the script:

```ruby
require 'memory_profiler'
# (rest of leaky.rb code)

report = MemoryProfiler.report do
  100.times do |i|
    users = generate_fake_users(1000)
    cache.store_users(users)
  end
end

report.pretty_print
```

**Your Goal**: Identify which objects are retained and from where.

---

### ✅ 3. **Profile with `stackprof` in `:object` mode**

Install if needed:

```sh
gem install stackprof
```

Wrap code with `stackprof`:

```ruby
require 'stackprof'

StackProf.run(mode: :object, out: 'stackprof.dump') do
  100.times do |i|
    users = generate_fake_users(1000)
    cache.store_users(users)
  end
end
```

Then analyze:

```sh
stackprof stackprof.dump --limit 5
```

Look for:

* High object allocation methods
* Whether `@cache` or string generation is the culprit

---

### ✅ 4. **Profile with `ruby-prof` (allocations)**

```ruby
require 'ruby-prof'
RubyProf.measure_mode = RubyProf::ALLOCATIONS

RubyProf.start
100.times do
  users = generate_fake_users(1000)
  cache.store_users(users)
end
result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
```

---

## 🧽 Step 5: Fix the Leak

Option 1: Add LRU-style cleanup (naive fix):

```ruby
def store_users(users)
  @cache.clear if @cache.size > 10_000
  users.each do |user|
    @cache[user[:id]] = user
  end
end
```

Option 2: Keep only the last N batches:

```ruby
@batches ||= []
@batches.shift if @batches.size > 10
@batches << users
```

---

## 📊 Step 6: Re-run Profiling

Use `memory_profiler` again to confirm:

* Retained object count is flat
* No uncontrolled growth in allocations

---

## 🏁 Summary

| Step              | Goal                              |
| ----------------- | --------------------------------- |
| Run baseline      | See real memory usage             |
| `memory_profiler` | Find retained objects             |
| `stackprof`       | Find high-allocation code         |
| `ruby-prof`       | Dig into allocation-heavy methods |
| Refactor          | Reduce or control memory          |
| Re-profile        | Verify fix effectiveness          |
