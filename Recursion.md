# Recursion
Functional programming utilizes recursion in which a function calls itself continuously until it reaches a certain case that stops it.

## Examples

### Length
As mentioned in [Lists](Lists.md), we can use recursion to implement the built-in length function.
```Haskell
len [] = 0 -- base case
len(x:xs) = 1 + len xs -- recursive case
```
The empty list [] has a length of zero because there are no elements in it, and this is called the base case.
The recursive case is when len calls itself and adds 1, for each element that is in the list.

Put the two lines of code in a Haskell file and run ghci, then load the module. Call the function len along with a list, `len [1,2,3,4,5]` and it should return 5.

### Fibonacci
We can also define the Fibonacci sequence using recursion.
```Haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-2) + fib(n-1)
```
The first line defines the a Fibonacci function that takes in one argument `Int` and returns one `Int`. Since Haskell uses type inference, this is not necessarily required, but can be helpful to understand the expected type and number of arguments. The next two lines are the base cases when fib is 0 or 1. The fourth line uses recursion and calls itself until it reaches the base cases.

Below is the output from loading the fib.hs file and calling the function.
```
*Main> :l fib.hs
[1 of 1] Compiling Main             ( fib.hs, interpreted )
Ok, one module loaded.
*Main> fib 2
1
*Main> fib 10
55
*Main> fib 25
75025
```

### Factorial
```Haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
```
Similarly to Fibonacci, the factorial function takes in one `Int` and returns one `Int`. Factorial only has one base case, and its recursive case that stops once it arrives at the base case.

Output for calling factorial is shown below.
```
*Main> :l factorial.hs
[1 of 1] Compiling Main             ( factorial.hs, interpreted )
Ok, one module loaded.
*Main> factorial 3
6
*Main> factorial 5
120
*Main> factorial 10
3628800
```

#### References
- http://learnyouahaskell.com/recursion
