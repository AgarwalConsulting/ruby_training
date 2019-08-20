# Day 1

- `puts "Hello, World!"` in ruby
- Naming conventions
  - `ClassName` - Pascal case
  - `method_name` - snake case
  - `variable_or_field_name` - snake case
  - `CONSTANT_NAME` - Screaming snake case
- Running code interactively in `irb`
- Writing your first ruby script `.rb`
- Symbols
- Requiring code defined in some other file
  - `require`
  - `require_relative`
  - `load`
- Writing a class
  - `class`,
  - getters - `attr_reader`
  - setters - `attr_writer` ->
    - `attr_writer :name`
```ruby
  def name=(name)
    @name = name
  end
```
  - both - `attr_accessor`
- `class Class`
- Inheritance
- class instance methods - `def self.method_name`
  - Class variables - `@@`
  - class instance variables - `class << self; attr_accessor :count; end`
  - instance variables
- Introduction to functional programming; `Enumerable` module
  - `map`
  - `reduce`
  - `filter`
- blocks, procs and `yield`
- Monkey Patching
- Modules
  - Mixins
- Proper monkey patching - How Rails monkey patches?
