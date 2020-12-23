# Haskell vs Python
Haskell and Python are quite different from each other but one similarity they share is in the simplicity of their languages. The main distinctions between these languages is that Haskell is a functional programming language, compiled, and has static typing, while Python is a procedural and interpreted programming language, and has dynamic typing.

## Examples
Below are examples of programs that I ran in Haskell and Python to benchmark the same algorithms and compare the overall performance and speed.

### Haskell
The program below takes in an argument of type `String` and checks if the specified String (only words, no phrases or sentences), is a palindrome, and returns a `Bool` ("True" if it is or "False" if not). This program is case sensitive and does not ignore punctuation.

```Haskell
isPalindrome :: String -> Bool
isPalindrome word = (word == reverse word)
```

To benchmark an algorithm when running a Haskell program, I first entered `ghci` in the Terminal. Next, I entered `:set +s` to display the program's execution time in seconds and memory usage.

The output is below:
```
GHCi, version 8.8.4: https://www.haskell.org/ghc/  :? for help
Prelude> :set +s
Prelude> :load Test.hs
[1 of 1] Compiling Test            ( Test.hs, interpreted )
Ok, one module loaded.
(0.07 secs,)
*Main> isPalindrome("hello")
False
(0.01 secs, 70,224 bytes)
*Main> isPalindrome("kayak")
True
(0.00 secs, 65,840 bytes)
*Main> isPalindrome("level")
True
(0.00 secs, 65,536 bytes)
*Main> isPalindrome("bye")
False
(0.01 secs, 66,040 bytes)
*Main> isPalindrome("radar")
True
(0.00 secs, 65,536 bytes)
*Main> isPalindrome("rotavator")
True
(0.00 secs, 65,920 bytes)
*Main> isPalindrome("tattarrattat")
True
(0.00 secs, 66,208 bytes)
```

For a basic program like `isPalindrome`, the execution time was less than a second every time after testing different words, where words that weren't palindromes took 0.01 seconds and words that were palindromes took 0.00 seconds (probably a few thousand nanoseconds).

I chose to test a fibonacci function because it is recursive and as the number increases, it takes longer to compute. This program takes in an argument of type `Int` and returns an `Int`.

**Warning**: My computer's fan became loud as I started running the fibonacci program in both Haskell and Python for numbers greater than 30, so keep this in mind when testing.

```Haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-2) + fib(n-1)
```

The output is below:
```
*Main> fib(10)
55
(0.00 secs, 92,560 bytes)
*Main> fib(20)
6765
(0.01 secs, 3,655,128 bytes)
*Main> fib(25)
75025
(0.08 secs, 39,882,480 bytes)
*Main> fib(30)
832040
(0.96 secs, 441,642,544 bytes)
*Main> fib(31)
1346269
(1.46 secs, 714,552,400 bytes)
*Main> fib(32)
2178309
(2.27 secs, 1,156,128,632 bytes)
*Main> fib(33)
3524578
(3.45 secs, 1,870,613,984 bytes)
*Main> fib(34)
5702887
(4.82 secs, 3,026,675,568 bytes)
*Main> fib(35)
9227465
(8.20 secs, 4,897,222,504 bytes)
*Main> fib(36)
14930352
(13.47 secs, 7,923,831,760 bytes)
*Main> fib(37)
24157817
(21.84 secs, 12,820,987,216 bytes)
*Main> fib(38)
39088169
(33.19 secs, 20,744,751,192 bytes)
*Main> fib(39)
63245986
(55.84 secs, 33,565,670,624 bytes)
*Main> fib(40)
102334155
(91.25 secs, 54,310,354,768 bytes)
```
As expected, the execution time of the program fib takes longer as the number increases and uses more memory.

### Python
In order to benchmark an algorithm in Python, I included the time module with the statement `import time` at the beginning. I used `time.process_time()` before and after running the function for the start and end times, then calculated the time it took to execute by subtracting the start time from the end time, and I formatted the total time to two decimal places.

The palindrome function in Python looks like this:
```Python
import time
def isPalindrome(word):
   backwards = word[::-1]
   if(word == backwards):
       return True
   else:
       return False
start = time.process_time()
print("isPalindrome('hello'):", isPalindrome("hello"))
end = time.process_time()
total = end - start
print("Execution time:", '{:.2}'.format(total), "seconds")
```

I also tested it with the same words as I did in Haskell by changing the function argument, saving the file, then rerunning the program. The output is below and I displayed the values in () to make it more readable to compare to the other execution times:
```
python3 Test.py
isPalindrome('hello'): False
Execution time: 3.5e-05 seconds (0.000035 seconds)
isPalindrome('kayak'): True
Execution time: 2.8e-05 seconds (0.000028 seconds)
isPalindrome('level'): True
Execution time: 2.9e-05 seconds (0.000029 seconds)
isPalindrome('bye'): False
Execution time: 3.2e-05 seconds (0.000032 seconds)
isPalindrome('radar'): True
Execution time: 2.9e-05 seconds (0.000029 seconds)
isPalindrome('rotavator'): True
Execution time: 3.1e-05 seconds (0.000031 seconds)
isPalindrome('tattarrattat'): True
Execution time: 3e-05 seconds (0.00003 seconds)
```

I also tested the fibonacci function in Python with the same lines of code in `isPalindrome` to calculate the execution time.
```Python
def fib(num):
	if num <= 1:
		return num
	else:
		return(fib(num-1) + fib(num-2))
```

```
fib(10): 55
Execution time: 5.8e-05 seconds (0.000058 seconds)
fib(20): 6765
Execution time: 0.0021 seconds
fib(25): 75025
Execution time: 0.025 seconds
fib(30): 832040
Execution time: 0.37 seconds
fib(31): 1346269
Execution time: 0.51 seconds
fib(32): 2178309
Execution time: 0.74 seconds
fib(33): 3524578
Execution time: 1.2 seconds
fib(34): 5702887
Execution time: 2.0 seconds
fib(35): 9227465
Execution time: 3.3 seconds
fib(36): 14930352
Execution time: 5.1 seconds
fib(37): 24157817
Execution time: 8.2 seconds
fib(38): 39088169
Execution time: 1.3e+01 seconds (13 seconds)
fib(39): 63245986
Execution time: 2.1e+01 seconds (21 seconds)
fib(40): 102334155
Execution time: 3.9e+01 seconds (39 seconds)
```

## Comparisons & Discoveries
After running the `isPalindrome` and `fib` programs in Haskell and Python, it was interesting to compare the execution times of both programs.

For `isPalindrome`, the execution times were close and less than a second. I noticed that for words that weren't palindromes and returned `False` or longer words took slightly longer in Python. This makes sense because it checks if the word is a palindrome before checking if it's not, and longer words also take more time to check whether a word is a palindrome or not. I couldn't find a way to show the execution time in milliseconds or nanoseconds in Haskell, Python shows more decimal places which is useful to compare small programs like this one. I also thought it was helpful that Haskell displayed memory usage in number of bytes to observe how that changes, especially because the execution time was only in seconds to the hundredths decimal place.

For `fib`, the execution times for numbers less than 30 were within the same range. However, I discovered that numbers 30 and greater ran faster in Python compared to Haskell. The largest difference was for the number 40, and the execution time was 91.25 seconds in Haskell whereas it was 39 seconds in Python. This resulted in a 52.25 second difference which is quite drastic. I was a bit surprised by this because the Haskell code for this function is more concise so I expected it to run faster than the Python version.

Below is a table of `time(fib(n+1)) / time(fib(n))` for the last ten computations to further compare the rate of the execution times (rounded to the ten thousandths place) of programs in Haskell and Python:

fib(n+1)/fib(n) | Haskell (seconds) | Python (seconds)
----------------|-------------------|-----------------
fib(31)/fib(30) | 1.5208            | 1.3784
fib(32)/fib(31) | 1.5548            | 1.4510
fib(33)/fib(32) | 1.5198            | 1.6216
fib(34)/fib(33) | 1.3971            | 1.6667
fib(35)/fib(34) | 1.7012            | 1.6500
fib(36)/fib(35) | 1.6427            | 1.5455
fib(37)/fib(36) | 1.6214            | 1.6078
fib(38)/fib(37) | 1.5197            | 1.5854
fib(39)/fib(38) | 1.6824            | 1.6154
fib(40)/fib(39) | 1.6341            | 1.8571

Based on the table, the computations are relatively constant for both versions of `fib`. For Haskell and Python, the average difference is 0.1133 second and 0.4787 second among all computations, respectively. This is an interesting finding because looking at the execution times alone, the Haskell version took longer than the Python version. However, after computing `time(fib(n+1)) / time(fib(n))` the Haskell version seems to be more consistent with a lower average difference while the Python version has a higher average difference.

There could also be other factors that affect the execution time of running these programs, such as other applications open on my computer while running them or the amount of time between each computation which could've given my computer a chance to rest, but this shouldn't make a significant difference.

#### References
- [Python vs Haskell](https://wiki.python.org/moin/PythonVsHaskell)
- [time — Time access and conversions](https://docs.python.org/3/library/time.html)
- [Haskell function execution time](https://stackoverflow.com/questions/6766450/haskell-function-execution-time)
