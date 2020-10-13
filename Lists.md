# Lists
A key difference between lists in Python and in Haskell is that lists in Python can contain multiple data types in the same list. However, Haskell lists can only consist of one data type, whether it's an Integer, Character, String (list of characters), etc, meaning they are homogenous.

The following list is valid in Python:
```Python
test = [1, "a", 2, "b"]
```
If this were entered in Haskell, it would return an error. Instead, the following lists are valid:
```Haskell
nums = [1, 2, 3, 4, 5]
chars = ["h", "a", "s", "k", "e", "l", "l"]
strings = ["hello", "world"]
```

## Constructing Lists
The empty list is `[]`.

We can add elements to the front of the list using x:xs notation.

To create a list from an empty list, type `1:(2:(3:(4:(5:[]))))`.

This can be abbreviated by removing the parentheses:  `1:2:3:4:5:[]`.

Both ways shown above (with & without parentheses) would return `[1,2,3,4,5]`.

Adding 6 to the front of the nums list defined above would look like: `6:nums` and would return `[6,1,2,3,4,5]`.

To add an element to the end of a list, we use xs ++ x notation.

For example, to add 6 to the end of nums list, type `nums ++ [6]`, which would return `[1,2,3,4,5,6]`. Note that this doesn't actually change the list nums.

To store the list with the additional element(s), assign it to another list like so: `nums2 = nums ++ [6]`, then call `nums2` to return the list.

`++` can also be used to concatenate two lists together, like `[1,2,3]` and `[4,5,6]` to return `[1,2,3,4,5,6]`.

## List Operations
A few of the basic operations on lists:

**head**: return the first element of a list
```Haskell
nums = [1, 2, 3, 4, 5]
head nums
```
would return 1.

**last**: return the last element of a list
```Haskell
nums = [1, 2, 3, 4, 5]
last nums
```
would return 5.

**tail**: return the list of elements except for the head
```Haskell
nums = [1, 2, 3, 4, 5]
tail nums
```
would return [2,3,4,5].

**length**: returns the size (number of elements) of the list
```Haskell
nums = [1, 2, 3, 4, 5]
length nums
```
would return 5. In another post, you'll see that we can easily create a length function ourselves using [recursion](Recursion.md).

## Accessing List Elements
Elements in lists use zero-based indexing. This means that we can access elements in a list (using the example nums defined above) by typing `nums !! n` where n is the index of the element's position.
```Haskell
nums !! 1
```
would return 2 because it is the second element in the list.

## List Comprehension
List comprehensions are a useful way to manipulate lists with the left side performing the action, and the right side specifying the list.
```Haskell
tripleAll :: [Int] -> [Int]
tripleAll ns = [3*n | n <- ns]
```
tripleAll takes a list of type Int and returns a list of Int with the values tripled. For every n in the list ns, it n is multiplied by 3.
```
tripleAll [1,2,3]
[3,6,9]
```

In this example, the list `[1,2,3]` becomes `[1*3, 2*3, 3*3]` which results in [3,6,9].

Similar logic can be applied to other types like String, but make sure to enter `import Data.Char` before defining the following function and calling it.

```Haskell
capitalize :: String -> String
capitalize letters = [toUpper l | l <- letters]
```
The function capitalize takes in a String converts each letter in the String and applies toUpper to it, then returns a String in capital letters.
```
capitalize "hello"
"HELLO"
```

#### References
- https://hackage.haskell.org/package/base-4.9.1.0/docs/Data-List.html
- https://wiki.haskell.org/How_to_work_on_lists
- https://wiki.haskell.org/List_comprehension
