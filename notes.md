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
