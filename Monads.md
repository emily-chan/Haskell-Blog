# Monads

Monads are considered to be composable computation descriptions, which is the separation of the composition timeline and the computation's execution timeline. Monads can perform a computation to implicitly carry extra data associated with said computation, and its output that is returned when a program runs. Monads are also used to structure functional programs, and can be applied towards various evaluation strategies or building parsers. In class, we briefly discussed the Maybe monad so I wanted to explore this and the general concept of monads more.

The table below shows the different monads and their respective uses for imperative semantics:
| Monad    | Imperative Semantics          | Description
-----------|-------------------------------|------------
`Maybe`    | Exception (anonymous)         | represent computations that may fail and not return a value
`Error`    | Exception (error description) | similar to maybe, but includes the description of the error
`IO`       | Input/output                  | represent actions as Haskell values that can be manipulated with pure functions
`[]` lists | Nondeterminism                | model nondeterministic computations that might return an arbitrary number of results
`Reader`   | Environment                   | pass a "shared" value between functions where the environmental state may change
`Writer`   | Logger                        | represent computations that produce a stream of data along with computed values
`State`    | Global state                  | simplify the process of threading state through functions

## Introduction

A monad is defined by a type constructor `m`, a function `return`, and an operator `>>=`. The `Monad` type class includes the function and operator methods shown below:
```Haskell
return :: a -> m a
    (>>=)  :: m a -> (a -> m b) -> m b
```

This is a monad class:
```Haskell
class Monad m where
  (>>=)  :: m a -> (a -> m b) -> m b
  (>>)   :: m a -> m b -> m b
  return :: a -> m a
  fail   :: String -> m a
```

## Monad Laws
There are three laws that must be followed: right identity, left identity, associativity.

The law for right identity is
```Haskell
m >>= return  =  m
```

The law for left identity is
```Haskell
return x >>= f =  f x
```

The right and left identity laws specify the behavior of `return`, where it only collects values and doesn't perform computations.

The law for associativity is
```Haskell
(m >>= f) >>= g  =  m >>= (\x -> f x >>= g)
```

## do Notation
The laws above can be written in the do-notation as well, which improves the code readability.

Right identity:
```Haskell
do {
  x <- m;
  return x
}
```

Left identity:
```Haskell
do {
  x′ <- return x;
  f x′
}
```

Associativity:
```Haskell
do {
  y <- do {
    x <- m;
    f x
  }
  g y
}
```

Monads need to follow the laws stated to maintain consistency so that both beginners and advanced users can easily understand them when they are used in various contexts.

## Commutative Monads
Commutative monads are a kind of monad where the order in which they're defined doesn't matter. The `Maybe` and `Reader` monads are examples of a commutative monad.

The two pieces of code are essentially the same, and the order of the first two lines after the `do` statement doesn't affect the result.
```Haskell
do {
  x <- thisX
  y <- thisY
  m x y
}
```

```Haskell
do {
  y <- thisY
  x <- thisX
  m x y
}
```

An example of a non-commutative monad could be if one computation must be done before the next computation like adding the items when checking out at a grocery store then applying tax:
```Haskell
do {
  subtotal <- item1 + item2
  tax <- subtotal * (1+taxRate)
  m subtotal tax
}
```

### Maybe Monad
As stated earlier, the Maybe monad is a way to represent computations that don't return a value.
The `Maybe` type is defined like so, where type a is polymorphic and `Nothing` and `Just` are constructors:
```Haskell
data Maybe a = Nothing | Just a
```

Below are the definitions of `return` and `>>==`:
```Haskell
return :: a -> Maybe a
    return x  = Just x

    (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
    (>>=) m g = case m of
                   Nothing -> Nothing
                   Just x  -> g x
```

The maybe monad is used when it is unknown whether a function returns a result or not, like an ordinary program with a while loop that may or may not terminate. The `Maybe` data type allows safety wrappers partial functions, which are functions that fail given certain arguments. For example, a square root function only works if the number is positive and would fail if the number is negative.

Below is a function that takes in two arguments of type `Float` to calculate the area of a square or rectangle and returns a value of type `Float`
```Haskell
area :: Float -> Float -> Float
area h w = h * w
```

I ran `ghci` in my Terminal then loaded the file where I defined the function. The output is below:
```
*Main> :load Test.hs
[1 of 1] Compiling Main             ( Test.hs, interpreted )
Ok, one module loaded.
*Main> area 2 4
8.0
*Main> area (-3) 10
-30.0
```

Even though one of the input numbers is negative, the function still runs and the result is a negative number, but this shouldn't be allowed because area can't be negative.

This is where the `Maybe` type comes in handy. The function `maybeArea` takes in two arguments of type `Float` and returns value of type `Maybe Float`. If one of the inputs are less than zero, then the function returns `Nothing`. If the inputs are zero or greater, the function returns `Just (h*w)`, which is the area.
```Haskell
maybeArea :: Float -> Float -> Maybe Float
maybeArea h w
  | h < 0 = Nothing
  | w < 0 = Nothing
  | otherwise = Just (h*w)
```

The output of the `maybeArea` function is below:
```
*Main> maybeArea 2 4
Just 8.0
*Main> maybeArea (-3) 10
Nothing
```
This ensures that only valid inputs return a `Just` value while invalid inputs return `Nothing`.
The `Maybe` type is a great way to gracefully handle errors or exceptions.

### Lists []
Lists and Maybe are similar in that they both represent computations that return zero or one value. However, lists can also return multiple values, which is defined by the length of the list. The binding operator for lists is `[a] -> (a -> [b]) -> [b]`, where a function maps to a given list to retrieve a list of lists, then concatenate the list of lists the get a single list. The chaining strategy for a list monad models non-determinism because `(a -> [b])` can generate an input of type `a` with an unknown number of potential outputs type `b`, which are combined into one list.

#### References
- [Monad on Haskell wiki](https://wiki.haskell.org/Monad)
- [Understanding monads on Wikibooks](https://en.wikibooks.org/wiki/Haskell/Understanding_monads)
