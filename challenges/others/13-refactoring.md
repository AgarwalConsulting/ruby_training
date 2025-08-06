# 🧩 Exercise Set: Refactor & SOLID Design in Ruby

---

## 🔹 **Exercise 1: Baseline Script (Procedural)**

You’re given the following script:

```ruby
# script.rb

lines = File.read('people.csv').split("\n")
people = lines.map { |l| l.split(',') }

people.each do |person|
  name, age, country = person
  next unless country == 'India' && age.to_i > 30

  puts "#{name} (#{age}) from #{country}"
end
```

---

## 🎯 Task:

1. **Break into classes**:

   * `FileReader`
   * `CSVParser`
   * `PersonFilter`
   * `ConsoleReporter`

2. **Apply SOLID principles**:

   * SRP: each class does one thing
   * OCP: allow new filters without modifying the core logic
   * DIP: inject dependencies where needed

3. **Make it testable**:

   * Ensure each class can be tested in isolation

---

## 🟡 **Exercise 2: Introduce Struct and Domain Concepts**

### 🎯 Task:

* Introduce a `Person` domain model using `Struct` or `class`
* Replace `["John", "35", "India"]` arrays with `Person.new("John", 35, "India")`

```ruby
Person = Struct.new(:name, :age, :country)
```

* Update the parser and filters accordingly

---

## 🔵 **Exercise 3: Add Filter Strategy (OCP)**

Create a generic filter system:

```ruby
class CountryFilter
  def initialize(country)
    @country = country
  end

  def call(person)
    person.country == @country
  end
end

class AgeFilter
  def initialize(min_age)
    @min_age = min_age
  end

  def call(person)
    person.age > @min_age
  end
end
```

### 🎯 Task:

* Build a `CompositeFilter` that applies multiple filters using composition
* Plug it into the main app

---

## 🟣 **Exercise 4: Create an Orchestrator**

Build an `Application` class that glues everything:

```ruby
class Application
  def initialize(reader:, parser:, filter:, reporter:)
    @reader = reader
    @parser = parser
    @filter = filter
    @reporter = reporter
  end

  def run(file_path)
    raw = @reader.read(file_path)
    people = @parser.parse(raw)
    filtered = people.select { |p| @filter.call(p) }
    @reporter.report(filtered)
  end
end
```

---

## 🧪 **Exercise 5: Unit Testing**

Write test cases for:

* PersonFilter (age and country)
* Parser (with various line formats)
* Reporter (mock output using `StringIO`)
* Application (integration test)

---

## 🧰 Directory Structure (Suggested)

```
project/
├── app.rb
├── reader.rb
├── parser.rb
├── person.rb
├── filters/
│   ├── age_filter.rb
│   ├── country_filter.rb
│   └── composite_filter.rb
├── reporter.rb
├── people.csv
└── test/
    ├── test_parser.rb
    ├── test_filters.rb
    └── test_app.rb
```

---

## 📄 Example `people.csv`

```
John,35,India
Alice,28,USA
Ravi,42,India
Mei,38,China
```

---

## 🏁 Bonus Exercises

1. Add support for multiple input formats (e.g., JSON) using a pluggable parser (`CSVParser`, `JSONParser`)
2. Add an output formatter (e.g., `JSONReporter`)
3. Add a DSL for defining filters:

   ```ruby
   filter = FilterBuilder.new do
     country "India"
     min_age 30
   end.build
   ```
