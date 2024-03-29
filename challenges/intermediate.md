# Intermediate

## 1. Convert temperatures between Fahrenheit and Celsius

## 2. Mars Rover

A squad of robotic rovers are to be landed by NASA on a plateau on Mars.

This plateau, which is curiously rectangular, must be navigated by the rovers so that their on board cameras can get a complete view of the surrounding terrain to send back to Earth. A rover's position is represented by a combination of an x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading. Assume that the square directly North from (x, y) is (x, y+1).

Input (whether hard coded or input from keyboard): The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0. The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation. Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving. Output: The output for each rover should be its final co-ordinates and heading.

Plateau max X and Y, Starting coordinates, direction and path for two rovers:

```txt
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

Output and new coordinates:

```txt
1 3 N
5 1 E
```

## 3. Strings

Convert strings to pig latin. The first consonant of each word is moved to the end of the word and “ay” is added, so “first” becomes “irst-fay.” Words that start with a vowel have “hay” added to the end instead (“apple” becomes “apple-hay”). Keep in mind the details about UTF-8 encoding!

## 4. HashMap

Using a hashes and arrays, create a text interface to allow a user to add employee names to a department in a company. For example, “Add Sally to Engineering” or “Add Amir to Sales.” Then let the user retrieve a list of all people in a department or all people in the company by department, sorted alphabetically.

## 5. Implement your own `filter` function

A filter function will take an array & a block which evaluates to `bool`. The filter function should return a array back of same type.

Eg. Take an array of strings: `["Iron Man", "Batman", "Superman", "Spider-man", "Wonder Woman", "Iron Fist", "Daredevil", "Supergirl", "Flash"]`.

Some predicate examples...

- Display all heroes whose name's second character is a vowel (a, e, i, o u)
- Display all heroes whose name doesn't contain "man" in it

## 6. Fibonacci closure

Implement a fibonacci function that returns a Proc (a closure) that returns successive fibonacci numbers (0, 1, 1, 2, 3, 5, ...).
