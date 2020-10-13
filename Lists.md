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

To create a list from an empty list, we would type `1:(2:(3:(4:(5:[]))))`.

This can be abbreviated by removing the parenthesis:  `1:2:3:4:5:[]`.

If we wanted to add 6 to nums defined above, it would look like: `6:nums`

## List Operations
A few of the basic operations on lists:

head: return the first element of a list
```Haskell
nums = [1, 2, 3, 4, 5]
head nums
```
would return 1.

last: return the last element of a list
```Haskell
nums = [1, 2, 3, 4, 5]
last nums
```
would return 5.

tail: return the list of elements except for the head
```Haskell
nums = [1, 2, 3, 4, 5]
tail nums
```
would return [2,3,4,5].

length: returns the size (number of elements) of the list
```Haskell
nums = [1, 2, 3, 4, 5]
length nums
```
would return 5.

#### References
- https://hackage.haskell.org/package/base-4.9.1.0/docs/Data-List.html
- https://wiki.haskell.org/How_to_work_on_lists
