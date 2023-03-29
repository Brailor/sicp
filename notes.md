# SICP notes

## Chapter 1 - Building Abstractions with Procedures

In this chapter the author describes programmers as wizards of computers and their programs as their spells.

Also it explains how our minds gets its power from simple ideas:
1. combine several simple ideas into one idea, thus creating one complex idea
2. take 2 seperate ideas together and inspect them without combining them
3. seperate them from all other ideas that accompany them -> abstraction

Then it briefly introduces us to the `Lisp` language and explains a little bit about its history. We will use a `Lisp` dialect called `Scheme` as the programming language for this book.

### The Elements of Programming
Every proper programming language has to provide means to combine simple ideas into more complex ones.

They have 3 mechanism to achive it:
1. primitive expessions - represents the simple entites the language is concerned with
2. means of combination - compound elements are built from simpler ones
3. means of abstraction - compound elements can be named and manipulated as units

In `Lisp` we use __prefix notation__ which means operators are always the leftmost element:
```lisp
(+ 23 45 67 234)
369
```
This enables us to easely chain multiple operands together without polluting the expression with operators.

In this chapter the basics of Lisp (Scheme in this case) was introduced to us. It showed how to declare variables and functions (which are not really that different), how to call these functions, recursion and introduced the concepts of block scoping and how to modularize our programs.

### Procedures and the Processes They Generate
In this chapter we are introduced to 2 definitive ways of writing processes:
- linear recursive process
- linear iterative process

Altough the names of these processes might indicate that only the first one is implemented using recursion, it is eneterely possible to implement such linear iterative process which uses recursion, consider:
```lisp
(define (+ a b)
    (if (= a 0)
        b 
        (+ (dec a) (inc b))))
```
In the above code we used recursive (the `+` procedure calls itself) still, this is not a linear recursive process, its evaulation is the following:
```lisp
(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9
```

If we would have defined the same (`+`) procedure as such:
```lisp
(define (+ a b)
    (if (= a 0)
        b 
        (inc (+ (dec a) b))))
```
Then its evaulation would be:
```lisp
(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc + 0 5))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```
Which would classify it as linear recursive process.

The easiest way to spot that the second process is recursive is to note that the (recursive) `+` call is inside a sub-expression, while in the first example the `+` call is the first expression.


### Formulating Abstractions with Higher-Order Procedures