# Functional Programming

## What is functional programming?
Functional programming is based on mathematical functions, consists of expressions, and utilize recursion to complete computation. They also don't use statements like conditionals or loops that return values like imperative languages, and they use functions and functional calls instead. As a result, functional programming is considered a "lazy" and supports higher-order functions.

## Syntax
The syntax in Haskell varies from Python because they are different types of programming languages.

### Arithmetic
Basic arithmetic is the same as other programming languages and follows the typical precedence rules (PEMDAS).
```Haskell
1+2 -- 3
3*4 -- 12
10-5 -- 5
8/2 -- 4
15%7 -- 1
```

### Equality
When testing for equality, use == for equal and /= for not equal. The latter is different in Python, which uses !=
```Haskell
2 == 2 -- True
1 == 3 -- False
9 /= 9 -- False
8 /= 7 -- True
```

### Built-In Functions
Haskell functions are called by the function name, followed by a space, then the function's arguments, and doesn't include parenthesis like in Python.
```Haskell
min 5 4 -- 4
max 13 16 -- 16
```

### Defining Functions
```Haskell
addNums :: Int -> Int -> Int
addNums x y = x+y
```
The function `addNums` takes in two arguments of type Int and returns an Int.
Here is an example calling the function:
```
Prelude> addNums 1 2
3
```

In Python, the same function would be:
```Python
def addNums(x,y):
  return x+y
```
### Comments
Note: to add a single line comment, enter `--` before the line. For a multi-line comment, add `{-` at the beginning and `-}` at the end. An example of each is shown below.
```Haskell
-- single line comment
{-
this is a
multi-line
comment
-}
```

This is a brief introduction to Haskell and other blog posts will explore various aspects in more detail.

#### References
- https://hackmd.io/@alexhkurz/SJKWvna6U
- https://www.tutorialspoint.com/functional_programming/functional_programming_introduction.htm
