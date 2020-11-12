# Assignment 1

## Part 1: Recursion
For Assignment 1 Part 1, we used [recursion](Recursion.md) to define functions over algebraic data types in Natural Numbers (NN), Positive Numbers (PN), and fractions, along with conversion functions in the `fractions.hs` file.

### Natural Numbers
The library for NN was defined as:
```Haskell
data NN = O | S NN
    deriving (Eq,Show)
```
where O represents 0 (zero) and S represents 1 (one).

First, we defined basic arithmetic functions for addition, multiplication, subtraction, and division. We also created functions for modulo, less, and greatest common divisor (gcd).

Add function for NN:
```Haskell
add :: NN -> NN -> NN
add O n = n -- base case
add (S n) m = S (add n m) -- recursive case
```
As discussed before, the add function takes in two arguments of type NN and returns a value of type NN. The next line is the base case for add because 0 (O) added to any number is itself. The third line is the recursive case that calls itself until the base case is reached.

Example input and output are shown below:
```
*Main> add (S O) (S (S O))
S (S (S O))
```

### Positive Numbers
Next, we defined PN as:
```Haskell
data PN = I | T PN
    deriving (Eq,Show)
```

The difference between PN and NN is that the base case is 1 for PN and 0 for NN.
We defined the same arithmetic functions as we did for NN.

Add function for PN:
```Haskell
addP :: PN -> PN -> PN
addP I n = T n
addP (T n) m = T (addP n m)
```
Example input and output are shown below:
```
*Main> addP (T I) (T (T I))
T (T (T (T I)))
```

This table displays the how numbers are represented in NN, PN, and Integers.
 | NN                | PN              | Integer
 --------------------|-----------------|--------
 O                   |                 | 0
 S O                 | I               | 1
 S (S O)             | T I             | 2
 S (S (S O)          | T (T I)         | 3
 S (S (S (S O)))     | T (T (T I))     | 4
 S (S (S (S (S O)))) | T (T (T (T I))) | 5


### Fractions
Thirdly, we defined fractions as a pair (numerator, denominator) like so:
```Haskell
type Frac = (NN,PN)
```

Besides creating add and multiply functions for fractions, we also created functions to check for equality (returns a boolean - True or False), and simplify (using the gcd function defined for NN). These were the most challenging, especially because it required converting between data types.

The conversion functions we defined were used to convert from PN to NN and NN to PN. We also defined conversion functions nn2int, int2nn, int2pn, which allowed us to test larger numbers for our main arithmetic functions.

The table below shows some example inputs and outputs:
```
| Input                                                              | Output
---------------------------------------------------------------------|-------
frac2ints (addF (ints2frac (3,5)) (ints2frac (2,10)))                | (40,50)
frac2ints (simplifyF (addF (ints2frac (3,5)) (ints2frac (2,10))))    | (4,5)
frac2ints (multF (ints2frac (1,2)) (ints2frac (3,4)))                | (3,8)
frac2ints (simplifyF ((multF (ints2frac (1,3)) (ints2frac (4,12))))) | (1,9)
equalF (ints2frac (1,2)) (ints2frac (2,4))                           | True
equalF (ints2frac (1,2)) (ints2frac (3,4))                           | False
addF (ints2frac (1,2)) (ints2frac (3,4))                             | (S (S (S (S (S (S (S (S (S (S O))))))))),T (T (T (T (T (T (T I)))))))
```

### Errors
Of course, programmers encounter errors along the way.

One common error was "Couldn't matched expected type __ with actual type __":
```
<interactive>:10:12: error:
    • Couldn't match expected type ‘NN’ with actual type ‘PN’
    • In the second argument of ‘add’, namely ‘(T I)’
      In the expression: add (T I) (T I)
      In an equation for ‘it’: it = add (T I) (T I)
```
In this case, the add function expects two arguments of type NN but received type PN. To fix this, we'd either need to change the arguments to NN and call the function `add (S (S O)) (S (S O))` or use the appropriate function for PN and call `addP (T I) (T I)`. I encountered multiple variations of this error and fixed it by checking the argument type for the function being called to ensure it was correct.

## Part 2: A Calculator
For Part 2, [BNFC](BNFC-Installation) is required. This part focuses on creating interpreters for abstract and concrete syntax to perform basic arithmetic operations. In the end, we will have a Calculator that can perform arithmetic operations using binary numbers rather than NN and PN so it is more efficient and human-readable.

### Interpreter for Abstract Syntax
The first step was to create the interpreter for the abstract syntax to define and evaluate arithmetic expressions in the `numbers3.hs` file.
```Haskell
data Exp = Num Integer | Plus Exp Exp | Times Exp Exp | Minus Exp Exp | Divide Exp Exp | Modulo Exp Exp | Power Exp Exp | Negate Exp | Abs Exp | GCD Exp Exp
eval :: Exp -> Integer
eval (Num n) = n
```

Next, we defined the arithmetic functions we previously defined in Part 1, such as add (Plus), mult (Times), subtr (Minus), div_q (Divide), etc.

```Haskell
eval (Plus e1 e2) = (eval e1) + (eval e2)
eval (Times e1 e2) = (eval e1) * (eval e2)
```

### Interpreter for Concrete Syntax
After completing the interpreter for abstract syntax, we created an interpreter for concrete syntax in the `numbers.cf` file. We extended the grammar with the operations in the abstract syntax interpreter like so:
```
Plus. Exp ::= Exp "+" Exp1 ;
Times. Exp1 ::= Exp1 "*" Exp2 ;

Num. Exp2 ::= Integer ;
coercions Exp 2 ;
```
The different levels of Exp (Exp1, Exp2) indicate precedence and follow PEMDAS. For example, if we were evaluating 1+2*3, the program would do multiplication first 2 * 3 = 6, then addition 1 + 6 = 7.

To run the calculator, first ensure that you are in the Calculator directory, then enter:
```
bnfc -m -haskell numbers.cf
make
ghc Calculator.hs
```

Next, run the following command:
```
echo "1+2*3" | ./Calculator
```
Echo is a command to output text to the console for the user to view.

Since multiplication rules are applied before addition, the output would be:
```
7
```

Overall, this assignment showed me the importance of recursion and gain a better understanding of abstract and concrete syntax, and how these can concepts can be applied to build something useful like a calculator.

#### References
- https://github.com/alexhkurz/programming-languages-2020/blob/master/assignment-1.md
- https://bnfc.digitalgrammars.com/tutorial/bnfc-tutorial.html
