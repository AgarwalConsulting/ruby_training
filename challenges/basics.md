# Basic

## 0. FizzBuzz challenge

Print numbers 1 to 100:

- for every number divisible by 3 print "Fizz" instead
- for every number divisible by 5 print "Buzz" instead
- for numbers divisible by 3 & 5 print "FizzBuzz"
- for other numbers print them as is

### Extra Challenge

- Create a function `fizz_buzz` which takes a `Integer` and returns a `String`

## 1. Input from user

Have the user enter a string, then loop through the string to generate a new string in which every character is duplicated, e.g., "hello" => "hheelllloo".

Test with "世界" as input.

## 2. Write a function to generate 'n' numbers from fibonacci series

- Print the first `n` numbers from the fibonacci series

## 3. Write a function to find factorials for a given n

- Print the factorial of number `n`

## 4. Prime Numbers

- Loop through the numbers from 2 to 25 and print out which numbers are prime, and for those numbers which are not prime numbers, you should print them as a product of two factors
- Remember that prime = no divisors other than 1 and itself
- Don't worry about efficiency, but if you're interested, check out `Math.sqrt()`

```
2 is prime
3 is prime
4 is product of 2 * 2
...
```

### Extra Challenge

- Create a function which can return the products given a number
  - Think about the return value in case the given number is prime?
- DRY-up your logic

## 5. Adder

Define an `Adder` class; which has methods like `add` & `result`... Adder should maintain the running total with each call to `add`, and return the total when the `result` is called.
