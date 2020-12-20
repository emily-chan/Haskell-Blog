# Multi-paradigm Langauges

While Haskell is a purely functional programming language, a language like Scala, which stands for Scalable Language, not only supports functional programming but also object-oriented programming. Scala is similar to languages like Java and C++ and has more complicated syntax but different in that it uses type inference and functions are objects, among other things.

## How does Scala integrate functional and object-oriented programming?
Scala integrates functional programming by using type inference so the data type of a variable does not need to be defined explicitly. Instead of using static variables or methods, Scala uses singleton objects where the essential class only contains one object in the file. Another feature of Scala is that it uses pattern matching like Haskell and has a system that supports algebraic data types and higher-order types. Scala also uses immutability, meaning that once a variable is declared, it can't be changed. Like Haskell, Scala utilizes lazy evaluation where the computations occur in a lazy manner and evaluates expressions when necessary.  There is also pattern matching and case classes so that programmers can write more logical code. Higher-order functions is another aspect of Scala, and they are used for function composition, and lambda or anonymous functions. Scala also supports concurrency control and parallelism, making it convenient for users to write less code in a type-safe manner while still applying general programming patterns effectively.

In terms of object-oriented programming, it has the same features as Java such as classes, objects, and methods. Scala also allows abstract classes and class extensions like Java. One difference between Java and Scala is the syntax. Java requires semicolons while Scala does not. Another distinction is that a class in Scala can only have one superclass. To have a class with multiple supertypes, a trait can be declared. However, the drawback of using traits over classes is that traits can't have parameters. Scala is unique in that it is much more dynamic than Java.

An example of this for a Dog would be:
```Scala
trait Dog {
  def name: String
  def breed: String
  def age: Int
}
```

### Class Hierarchy
Scala has an interesting class hierarchy that consists of a top and bottom. The top hierarchy includes `Any`, the base type of all types, then branches off into two subtypes. One of the subtypes is `AnyRef`, which is the base type of all reference types like ScalaObject, java.lang.String, and other Scala and Java classes. The second subtype is `AnyVal`, the base of all primitive types, including but not limited to Double, Float, Int, Boolean, and Char. At the bottom type is `Nothing`, which is a subtype of the other types and doesn't have a value. This is useful to signal abnormal termination or to be an element type of empty collections. Finally, the `Null` type is a subtype of the classes that inherit from `Object`. Every reference class type has a null value, and Null is not compatible with subtypes of `AnyVal`.

A more comprehensive hierarchy is shown below and is hopefully easier to visualize:

Top:
- `Any`
  - `AnyRef` (java.lang.Object)
    - `ScalaObject`
    - `Iterable`
    - `Seq`
    - `List`
    - `java.Lang.String`
    - other Java classes
    - other Scala classes
  - `AnyVal`
    - `Double`
    - `Float`
    - `Long`
    - `Int`
    - `Short`
    - `Byte`
    - `Unit`
    - `Boolean`
    - `Char`

Bottom:
- `Null`
  -`Nothing`

## Examples

A basic program in Scala looks like this:

```Scala
object HelloWorld {
  def main(args: Array[String]) {
    print("Hello world!")
  }
}
```
The output of this program is `"Hello world!"`

The program below shows a function that takes in a two parameters of type Int, takes the power (num1^num2), then takes the cube root, and returns the result as an Int.

In Java:
```Java
int powCbrt(int num1, int num2) {
    int result = Math.pow(num1, num2);
    return (int) (Math.cbrt(result));
}
```

In Scala:
```Scala
import math._
def powCbrt(num1: Int, num2: Int) = {
  val result = pow(num1,num2)
  (cbrt(result)).toInt
}
```

Comparing both functions, Java uses the return statement whereas Scala uses type inference instead. The Scala version also imports the math library at the beginning which doesn't require calling it whenever a method within the math library is used like in Java. In the last line, Scala uses the `toInt` method, which declares the value `result` as immutable. While these differences are subtle between Scala and Java, they become more noticeable in larger programs and can reduce the number of lines of code and make it more efficient.

## Benefits
Before writing this post, I wasn't familiar with Scala, but it was interesting to research features to learn more about how it works as a functional and object-oriented programming language. Aside from these advantages, Scala is fairly easy to learn, especially with prior knowledge of Java (which I have), and can be used to bridge the gap between Java and Haskell. This is helpful to follow functional programming and apply these practices to an object-oriented language like Java and have fewer lines of code and less bugs, ultimately improving productivity and quality. Scala also has good IDE support, such as IntelliJ IDEA and Scala IDE to name a couple.

The name Scala represents that this language is designed to grow along with the demands of its users. Therefore, I can see it becoming more popular and valuable as more users discover it because of its flexibility and it's a multi-paradigm language.

#### References
- https://en.wikipedia.org/wiki/Scala_(programming_language)
- https://www.tutorialspoint.com/scala/scala_overview.htm
- https://www.scala-exercises.org/scala_tutorial/object_oriented_programming
