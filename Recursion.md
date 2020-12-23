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

### Sorting
The odds and evens functions take in one non type-variable argument and return one non type-variable. The `odds` function returns characters at the odd positions while the `evens` function returns characters at the even positions.
```Haskell
odds :: [a] -> [a]
odds [] = []
odds (x:xs) = x:evens xs

evens :: [a] -> [a]
evens [] = []
evens (x:xs) = odds xs
```
For example, if the input was "Hello World", the H is at position 1, e at position 2, l at position 3, and so on.

The `merge` function below takes two ordered lists as arguments and returns one merged ordered list. The function uses the `Ord` class that is used for ordered datatypes. The base case is two empty lists that returns an empty list. The second case is one list and one empty list that returns the one list, and vice versa. The recursive case compares the values in each list and merges them accordingly.
```Haskell
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | (x < y) = x:merge xs (y:ys)
  | otherwise = y:merge ys (x:xs)
```

Merge sort is a divide and conquer sorting algorithm that splits the list in half, sorts each list separately, then merges them back together into one list. The `mergeSort` function takes in two lists as arguments and returns one list, and uses the `Ord` class too. Once again, the base case is the empty list. The next case is a list that only contains one value. The recursive case utilizes the merge, odds, and evens functions defined above to sort the lists. Since the arguments can be of any type, integers and characters can be used with this function.
```Haskell
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort (odds xs)) (mergeSort (evens xs))
```

Example input and output for calling the four functions above are shown below.
```
*Main> :l sorting.hs
[1 of 1] Compiling Main             ( sorting.hs, interpreted )
Ok, one module loaded.
*Main> odds "Hello World"
"HloWrd"
*Main> evens "Hello World"
"el ol"
*Main> merge [1,4,5] [2,3,6]
[1,2,3,4,5,6]
*Main> mergeSort [8,21,6,45,3,100,59,2,84,76,1,14]
[1,2,3,6,8,14,21,45,59,76,84,100]
```

#### References
- [Recursion on Learn You a Haskell](http://learnyouahaskell.com/recursion)
