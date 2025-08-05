# Special Ruby method naming conventions

- Question Mark (`?`):

Methods ending with a question mark are known as "predicate methods." They are designed to return a boolean value (true or false), indicating whether a certain condition is met. Examples include `empty?`, `present?`, and `include?`.

- Exclamation Mark (`!`):

Methods ending with an exclamation mark are often referred to as "bang methods." This convention signifies that the method performs a destructive or modifying action on the object it's called upon, potentially altering its state or content. A non-bang equivalent usually exists that returns a modified copy without altering the original. Examples include `sort!` (modifies the array in place) versus `sort` (returns a new sorted array).

- Equals Sign (`=`):

Methods ending with an equals sign are "setter methods." They are used to assign values to instance variables, often in conjunction with attribute accessors. For example, `def name=(value)` allows `object.name = "new_name"` syntax.

- Operator Overloading:

Ruby allows you to define methods with special names that correspond to operators, enabling operator overloading for custom classes. Examples include `+`, `-`, `*`, `[]`, and `[]=` for array-like access and assignment.

- `self`:

While not a method name it`self`, `self` is a special keyword used within method definitions to refer to the current object. It is crucial for defining singleton methods (methods specific to a single object instance) and class methods.
