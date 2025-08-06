# Testing Exercises

## 🧪📚 **Exercise: Currency Converter Service**

### 🎯 Goal:

Build a `CurrencyConverter` class that supports:

* Storing conversion rates
* Converting between currencies
* Handling unknown currencies

Then:

* ✅ Write unit tests
* 📚 Add YARD docstrings
* 📄 Generate HTML documentation

---

## 🧱 Step 1: Implement the Service

### `lib/currency_converter.rb`

```ruby
# A service to convert amounts between currencies using fixed exchange rates.
class CurrencyConverter
  # Initialize the converter with a hash of rates.
  #
  # @param [Hash{String => Float}] rates A hash like { "USD" => 1.0, "INR" => 83.0 }
  def initialize(rates = {})
    @rates = rates
  end

  # Convert an amount from one currency to another.
  #
  # @param [Float] amount
  # @param [String] from The currency code to convert from
  # @param [String] to The currency code to convert to
  # @return [Float] Converted amount
  #
  # @raise [ArgumentError] if either currency is unknown
  def convert(amount, from, to)
    raise ArgumentError, "Unknown currency: #{from}" unless @rates[from]
    raise ArgumentError, "Unknown currency: #{to}" unless @rates[to]

    usd_amount = amount / @rates[from]
    (usd_amount * @rates[to]).round(2)
  end

  # Add or update a currency rate.
  #
  # @param [String] currency The currency code
  # @param [Float] rate The rate relative to USD
  # @return [void]
  def add_rate(currency, rate)
    @rates[currency] = rate
  end
end
```

---

## 🧪 Step 2: Write Tests

### ✅ Option A: `test/test_currency_converter.rb` (Minitest)

```ruby
require "minitest/autorun"
require_relative "../lib/currency_converter"

class CurrencyConverterTest < Minitest::Test
  def setup
    @cc = CurrencyConverter.new({ "USD" => 1.0, "INR" => 83.0 })
  end

  def test_convert_usd_to_inr
    assert_equal 830.0, @cc.convert(10, "USD", "INR")
  end

  def test_convert_inr_to_usd
    assert_equal 1.2, @cc.convert(100, "INR", "USD")
  end

  def test_unknown_currency
    assert_raises(ArgumentError) { @cc.convert(100, "XYZ", "INR") }
  end
end
```

### ✅ Option B: `spec/currency_converter_spec.rb` (RSpec)

```ruby
require_relative "../lib/currency_converter"

RSpec.describe CurrencyConverter do
  let(:converter) { CurrencyConverter.new({ "USD" => 1.0, "INR" => 83.0 }) }

  it "converts USD to INR" do
    expect(converter.convert(10, "USD", "INR")).to eq(830.0)
  end

  it "converts INR to USD" do
    expect(converter.convert(100, "INR", "USD")).to eq(1.2)
  end

  it "raises on unknown currency" do
    expect { converter.convert(100, "XYZ", "INR") }.to raise_error(ArgumentError)
  end
end
```

---

## 📚 Step 3: Document with YARD

### ▶️ Generate docs:

```bash
yard doc lib/currency_converter.rb
```

Then serve:

```bash
yard server --reload
# Visit http://localhost:8808
```

Or use RDoc:

```bash
rdoc lib/currency_converter.rb
open doc/index.html
```

---

## ✅ Step 4: Bonus — Automate with Rake

### `Rakefile`

```ruby
require "rake/testtask"
require "yard"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end

desc "Generate docs"
task :doc do
  sh "yard doc"
end

desc "Serve docs"
task :serve_docs do
  sh "yard server --reload"
end

task default: :test
```

Run with:

```bash
rake           # run tests
rake doc       # generate docs
rake serve_docs
```

---

## 🧠 What You'll Learn

| Skill      | Outcome                                  |
| ---------- | ---------------------------------------- |
| TDD        | Write clean, tested APIs                 |
| Docs       | Embed rich YARD comments                 |
| Lint       | Optional: add RuboCop to keep code clean |
| Automation | Rake for tasks & CI prep                 |
