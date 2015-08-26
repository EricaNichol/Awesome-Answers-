# Javascript
# __Review__

^ Get notes from certified.in, follow along and take notes in there.

^ Install markdown extended format.

  ---

# Motivation

  ---

## Why?

^ [Table Q] Why should we learn Javascript when you've already learned Ruby? What's special about Javascript?

^ The *only* language of the browser.

^ Way to make websites feel like applications instead of just forms

 ---

## Web Page = <br> `HTML` + `CSS` + `Javascript`

^ 3 components of a web page

^ HTML defines the content and structure

^ CSS defines the presentation

^ Javascript defines the behaviour

 ---

## Web Application Flow

^ Draw diagram of browser requesting a page, server responding with html, user clicking a link.

^ Describe how page can change dynamically with JS w/o going back to server.

^ Difference between Craigslist and Gmail

 ---

## History

- __1995__: Created by Brendan Eich

- __1997__: Standardized as ECMAScript

- __1999__: ECMAScript 3

- __2009__: ECMAScript 5

- __2016__: ECMAScript 6

^ ES4 was thrown out

^ Not all browsers properly support ES5

^ Some support starting for ES6

 ---

# Today's Agenda

- Javascript on web pages
- Basic variables
- Conditionals
- Iteration
- Arrays
- Functions
- Objects

^

 ---

# Course's Agenda

- Javascript basics
- Advanced Javascript
- Manipulating web pages with the DOM
- Easier DOM with jQuery
- Transitions and Animations
- Talking to the server with AJAX

^

 ---

# Javascript on<br>web pages

  ---

## Demo
## __Our first dynamic page__

^ Create HTML file with inline script tag that write's "Hello, World" to the page.

^ Change script to write out the current date.

  ---

# The Script Tag

```html
<html>
  <head>
    <script>
      // Inline javascript
    </script>

    <script src="external_javascript.js"></script>
  </head>
  <body>
    ...
  </body>
</html>
```

^ Relative, absolute, or remote "src".

^ No "type" attribute required.

 ---

## Demo
## __External scripts__

^ Extract the javascript out to an external script and load it.

 ---

## Exercise
## __Add a second external script that<br>write's your name to the page__

 ---

# Interactive<br>Javascript

^ Demo JS console in Chrome and Firefox

^ Shortcuts for console and reload

^ Demo repl.it

 ---

# Numbers

^ Demo floats and integers in console

^ Demo arithmetic (* + - / %) in console

^ Very similar to Ruby

 ---
## What is 1/2 in Ruby?
## In Javascript?

^ All numbers are floats in JS

 ---

# Numbers
# __Summary__

^ Like Ruby except all numbers are floats

 ---

# Strings

 ---

# Strings

```js
"This is a string"

'So is this'

"This is \n on a new line"

"Quote's inside \"this string\""
```

^ Demo strings

^ "", '', '\n', \"

 ---

# Combining Strings

- Combine strings by concatenation

```js
"one" + "two"

'A' + ' ' + 'B'

'4' + 5

5 + '4'
```

- No interpolation in JS

^ They try these in console

 ---

# `"abc".length`
## `''.length`

^ Try in console. Results?

^ No "size" or "count" methods

 ---

# `"abc"[2]`

## `"abc"[3]`

## `"abc"[-1]`

^ Try in console. Results?

^ 0-indexed

^ Strings are immutable!

 ---

# `parseInt("123")`

## `parseInt("123abc")`

## `parseInt("abc")`

^ Try in console. Results?

 ---

# Exercises

0. Create a string "Hello, [Your Name]!" by concatenating 3 strings

0. Compute the length of that string

^

 ---

# Strings
# __Summary__

^ [Table Q] 3 ways strings are similar to ruby

^ [Table Q] 3 ways strings are different from ruby

^ concatenation, length, immutable

 ---

# Variables

 ---

# Variables

```js
var a;
a = 5;

var b = 'hello';

var mitchsAge = 31;
```

^ [Table Q] 3 things that are different from variables in Ruby

^ End statements with a ';'

^ Declare variables with 'var' before use

^ lowerCamelCase naming conversion

 ---

## Demo
## __Create two variables containing numbers and a third that contains their sum.__
## __Use only 3 lines of code.__

 ---

# Exercises

0. Create a variable that stores your first name.
0. Create a variable that stores your last name.
0. Create a variable that stores your full name by combining the above with a space between.

^

 ---

# Variables
# __Summary__

^ Must declare variables with 'var' before using.

^ Semi-colons separate statements.

 ---

# Comments

 ---

# Comments

```js
// This is a comment

/* This is a
   multiline comment */
```

 ---

## Exercise
## __Add a comment to the top of the script describing what it does.__

 ---

## Hot or Not?

0. `a = 5;`
0. `var my_string = 'hello world';`
0. `var myNumber = 3`
0. `# This is a comment`
0. `var name = "Mitch";
    name[1] = 'a';`

^ [Table Q] Which ones are hot JS? What's wrong?

 ---

# I/O

 ---

## `console.log`

 ---

# Exercises

0. Change "Our First Dynamic Page" to write the following message to the console: `"Hello, Mitch! In case you forgot, 3 x 4 is 12."` Use variables for your name, a, b, and result.

0. Change your script to write this message to the console AND the document.

0. Add a comment to the top of the script describing what it does.

^

 ---

# Built-Ins

- __`alert`__ to display a message
- __`confirm`__ to check if the user wants to proceed
- __`prompt`__ to ask a question

^ Demo in console

^ Return values for confirm => true/false

^ Return values for prompt => string/null

 ---

## `null` and `undefined`

^ Both like Ruby's nil => nothing

 ---

# Exercises

0. Change the script in our page to:
   - write a message to the __document__
   - write a message to the __console__
   - create an __alert__ message

0. Change the script to __prompt the user for their name__ and then __alert__ "Hello, [name]!"

^

 ---

# Booleans

 ---

# Booleans

## `true false`
## [fit] `> < == != <= >= && || !`

^ Demo in console

^ Similar to Ruby

^ true, false, > < == != <= >=, &&, ||, !

 ---

# True or False?

- `2 > 1`

- `0.5 < 0`

- `true && false`

- `"abc" > "def"`

- `"c" == "c"`

- `"2" == 2`

^ Ask class individually

^ Looser equality

 ---

# `"2" === "2"`

 ---

# True or False?

- `'abc'.length == 3`

- `5 * 2 != 10`

- `parseInt('123.5') > 123`

- `4 + '5' === 9`

- `"123"[3] == '3'`

^ Discuss with neighbour

 ---

# Conditionals

 ---

# Conditionals

```js
if (condition) {
  // action
}
```

```js
if (a) {
  // ..
} else if (b) {
  // ...
} else {
  // ...
}
```

^ [Table Q] 4 ways javascript if statements are different from Ruby

^ Parens, {}, "else if"

 ---

# `if` is a statement, not an expression

```js
// Not valid JS
var answer = if (a) {
  2
} else {
  3
};
```

 ---

## What happens?

```js
var a = 5;

if (a > 3) {
  console.log('big');
} else {
  console.log('small');
}
```

 ---

## What's wrong?

```
var age = prompt("What's your age?");

if age >= 50
  console.log("You are so wise!")
else
  console.log("You are so youthful!");
end
```

^ Find the errors

 ---

# Exercise __Password Checker__

Change our script so that it prompts the user to enter a password.

- If their name is longer than 12 characters, alert "Too long!".
- If their name is less than 8 characters, alert "Too short!".
- Otherwise, alert "Just right!".

^ Do in partners

 ---

# Exercise __Build a Safe__

Build a safe to guard the secret number "714".

- Prompt the user to enter the password to our safe.
- If the password is correct (opensesame), alert the safe's secret number.
- Otherwise, alert a failure message.

^

 ---

# Exercise __A friendly safe__

Change your safe so that it asks the user if they wants to enter the safe first.

```
"Welcome to super-safe! Are you sure you want to enter?"
[cancel]
"OK. Goodbye, then."
```

 ---

# Conditionals
# __Summary__

^ Remember: (), {}, "else if". statement vs expression

 ---

# Iteration

 ---

# While Loop

```js
while (condition) {
  // body
}
```

^ Use +=

^ Like while in Ruby

^ [Table Q] 2 things that are different from while loops from ruby

 ---

## Example
## __Use a while loop to log the numbers from 0 to 100 to the console.__

 ---

# What's the result?

```js
var i = 10;
while (i > 5) {
  i -= 1;
}

console.log(i * 2);
```

 ---

# What's the result?

```js
var i = 0;
var x = 0;

while (i < 10) {
  x += i;
}
```

 ---

## Exercises

0. Use a while loop to log the EVEN numbers from 0 to 100 to the console.

0. Use a while loop to implement "bottles of beer rhyme".

```
"100 bottles of beer on the wall"
"100 bottles of beer"
"Take one down, pass it around, 99 bottles of beer on the wall"
```

 ---

# For Loop

```js
for (initialize; condition; increment) {
  // ...
}
```

^ Demo: Use a for loop to log the numbers from 0 to 100 to the console.

^ [Table Q] Why do we have a for loop AND a while loop?

^ Convenience of having initialization, condition and increment together, because often use it.

 ---

## Exercise
## __Implement the "bottles of beer rhyme" using a `for` loop.__

^ partners

 ---

## `break`

^ Demo: Determine the first number divisible by 3,4, and 5 using a "while" loop and "break".

 ---

## What's wrong?

```js
for (i < 10; i += 1) {
  console.log(i);
}
```

 ---

## What's the result?

```js
var result = 0;

for (var i = 5; i < 10; i += 1) {
  result += i;
  if (i % 3 == 0) {
    break;
  }
}

console.log(result);
```

 ---

# Exercises

0. Use a `for` loop to log the numbers from 100 down to 0 to the console

0. Use a `for` loop to determine the sum of the numbers from 0 to 99

^

 ---

# Exercise __Number guessing game__

0. Choose a number between 0 and 100
0. Prompt users to guess the number
0. Alert the user whether their guess is greater than or less than the number, or correct.
0. If their guess is wrong, repeat

^ Do in partners

 ---

# Iteration
# __Summary__

 ---

# Arrays

^ Demo arrays with [] syntax.

^ Like ruby arrays: 0-based, hold anything

 ---

## `.length`

^ No size or count methods

 ---

## `.push` `.pop`
## `.shift` `.unshift`
## `[]`

 ---

# What's the result?

```js
var array = [1, 2, 3];
```

- `array.length` ?
- `array[2]` ?

```js
array[0] = 5;
array.push(4);
```

- `array[0]` ?

^

 ---

# Exercises

0. Create an array (`first`) containing the elements `"hello"`, `5`, and `'a'`

0. Change the 2nd element of `first` to `6`.

0. Create an array (`second`) containing the digits from 0 to 100.

0. Compute the length of `second`.

^

 ---

## Looping over an array

^ Demo: console.log each element in an array.

 ---

# Exercises

0. Create an array containing `0, 5, 6, -12`, and use a loop to compute the sum of its elements.

0. Create an array containing the words `"apple", "dog", "computer", "cup"`, use a loop to log `"[Word] has [length] characters."` for each word.

^

 ---

## `split` and `join`

^ demo in console with and without parameters.

 ---

# Exercises

0. Create a string `"hello"` and then use `split` to make an array of its characters.

0. Write a script that prompts for a sentence, and alerts how many words are in that sentence.

0. Make a string containing all the numbers from 0-99. (e.g `"01234..."`)

^

 ---

# Functions

 ---

# Functions

```js
// Define a function
var doubleIt = function(a) {
  console.log(a * 2);
};

// Call a function
doubleIt(5);
```

^ Demo: functions, function expressions, calling functions

^ Functions are just variables!

^ Create a function

 ---

# What's wrong?

```
var function countCharacters() {
  console.log(string.length + ' characters');
};

countCharacters('12345');
```

 ---

## Return Values

```js
var doubleIt = function(a) {
  return a * 2;
}
```

^ Q: What happens if you don't add an explicit return?

^ Explicit return is required if you want to return a value.

 ---

## Demo

## __Write a function that accepts a name, and returns the string "Hello, [name]!"__

 ---

## Demo

## __Write a function "reverse" that accepts an array, and returns an array with the items in reverse order.__

 ---

# Exercises

0. Write a function __`insult`__ that takes a name, and logs an insult to the console (e.g. "Mitch, you dummy!")

0. Write a function __`increment`__ that takes a number and adds 1 to it.

0. Write a function __`doubleArray`__ that accepts an array of numbers and returns a array of those numbers doubled.

^ Do number 1 in partners.

^ Rest by yourself.

 ---

# Functions
# __Summary__

^ [Table Q] 4 ways functions are different from Ruby methods

 ---

# Objects

 ---

# Objects

```js
var myObject = {
  a: 5,
  b: 6,
  c: 7
};
```

^ property: [keys => values]

^ keys are always strings

^ values are anything (even other objects)

 ---

# `.`

^ Demo setting, getting, creating attributes

 ---

## Demo
## __Building a car__

^ Build a "car" object, and add/change properties using '.'

 ---

## What happens when you read a property that doesn't exist?

 ---

# Exercises

0. Create an object "me" containing your name, age, and occupation.

0. Change your occupation to "javascript expert"

0. Add a "skills" property containing the array `['ruby', 'rails', 'javascript']`

^

 ---

## Object-ception
## __Nested Objects__

^ Add a "car" object to "me" object

 ---

# What's the result?

```js
var obj = {
  a: [1, 2, 3],
  b: { c: 6 }
};

console.log(obj.a[2] + obj.b.c);
```

 ---

## Can you have a property with a space in it?

 ---

# `[]` to the rescue

- For properties with spaces or other special characters

- For property names stored in variables

```js
var car = {};
car['year made'] = '2009';
console.log(car['year made']);

// Or

var car = {
  'year made': '2009'
};
```

^ Demo

 ---

# What's wrong?

```js
var obj = {
  a: 5,
  b: 6
};

console.log(obj[a] + obj[b]);
```

 ---

## Demo
## __Write a function that takes a string and returns an object containing the count of each character__

 ---

# Exercises

0. Write a function that takes a user object with 'name' and 'age' properties, and logs the string "[name] is [age] years old."

0. Write a function that takes a sentence, and returns an object of all the words and their lengths.
  `wordLengths("Hello world"); => { "Hello": 5, "world": 5 }`

^

 ---

## `delete`

 ---

# Looping over an object

```js
for (var key in object) {
  console.log("key " + key + ", value " + value);
}
```

 ---

## Demo
## __Write a function that computes the number of properties an object has.__

 ---

# Exercises

0. `console` is an object, figure out what properties it has.

0. Write a function `clone`, which takes an object and returns a clone of it.

^ In partners

 ---

# `typeof`

^ Demo typeof for numbers, strings, arrays, objects, functions

 ---

# Next Time

- Higher-order functions

- Methods on objects

- Timing functions

- Working with the DOM

- underscore library

^

 ---

# Homework

