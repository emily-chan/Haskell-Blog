# Lambda Calculus

## Overview
Lambda (λ) calculus is a mathematical logic system that to express computations based on function abstraction and application using variable binding and substitution.

The table below shows the basic rules for lambda calculus:

| Name      | Syntax | Description
------------|--------|-----------
Variable    | x      | A character or string that represents a parameter or logical value
Abstraction | (λx.M) | This is a function definition, where M is a λ-term and the variable x is bound in the expression.
Application | (M N)  | A function is applied to an argument, where M and N are λ-terms

The identity term is λx.x

## Rules
The alpha reduction rule is used to rename bound variables. The beta reduction rule is used to apply a function to an argument to handle the λs. Since abstract syntax is for trees and concrete syntax is for strings, parentheses are needed to convert from abstract to concrete syntax. However, this can be messy so there are rules to drop parentheses. The rules are that application associates to the left, abstraction is a unary operation so parentheses can be dropped without ambiguity, and application has higher precedence than abstraction.

Here is a simple example to show how it works: λx.λy x y = λx.λy (x y) = (λx. (λy (x y))

## Examples
(λx.(λy.x+y)) 4 8 = (λy.4 + y) 8
                  = 4 + 8
                  = 12

In this example, the λx and outer () are dropped and the numbers are applied to the function.

(λx.(λy.x+y) 5 z = (λy.5+z) 5
                  = 5+z

In this example, the computation can't continue because the value of z is unknown, and it's called a free variable and needs a value to evaluate to a number. The variables x and y are bound variables which are basically placeholders that don't have values, and λx.λy are binders. Essentially, x is a variable that is bound to the λ.

## Syntax: Haskell vs Lambda Calculus

### Haskell
Let's define a function to calculate an the square of a number: f(x) = x^2

If x = 8, then f(8) = 8^2, and 8^2 = 64 so f(8) = 64.

### Lambda Calculus
The same function in lambda calculus syntax is λx.x^2

To apply this function to the same variable, (λx.x^2) 8 = 64.

## Why is Lambda Calculus Turing complete?
When a system of data manipulation rules, like a programming language, can be used to simulate a Turing machine, then it is considered Turing-complete. Lambda calculus is Turing-complete because it's a universal computation model that can be used to simulate any Turing machine. The rules of alpha and beta reduction and the ability to have recursive functions are important because this helps prove that lambda calculus is Turing-complete. Lambda calculus can be typed or untyped, and typed lambda calculus is weaker than untyped. For typed lambda calculus, functions can only be applied depending on if they're able to accept the data type for the input. Typed lambda calculus can express less than untyped calculus. This is crucial to note because typed lambda calculus is Turing-complete but some kinds of typed lambda calculus are not.

#### References
- [The Lambda Calculus on Stanford Encyclopedia of Philosophy](https://plato.stanford.edu/entries/lambda-calculus/)
- [Lambda Calculus on Brilliant](https://brilliant.org/wiki/lambda-calculus/)
