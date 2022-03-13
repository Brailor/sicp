#lang scheme
; define is a special form, meaning it is not an ordenary operator such as: `+,-` etc.
; so this does not mean use the `define` operator on the parameters `x` and `2`
; rather use the name `x` and give it the 2
(define x 2)

; later we can reuse the above defined object in this environment (global)
(+ x 10)

; this is how we define funcitons:
; (define (<name of the function> <parameters>) <function body>)
(define (square x)
  (* x x))

(square 5)

; note: defining functions and 'variables' are both accomplished by the `define` special form
; this will define a function which just gives back the number 5
(define (y)
  5)

(+ x (y))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)
; --- applicative order evaulation ---
; evaulation of (f 5)
; retrieve the body of `f`
; which is: (sum-of-squares (+ a 1) (* a 2))
; then replace the formal parameters with the argument 5:
; (sum-of-squares (+ 5 1) (* 5 2))
; we further evaulate to:
; (sum-of-squares 6 10)
; now we can retrieve the body of `sum-of-squares`:
; (+ (square x) (square y))
; replace formal parameters with the arguments 6, 10:
; (+ (square 6) (square 10))
; evaulate the sub-expressions by getting the body of `square`:
; (+ (* x x) (* x x))
; once again replace the formal parameters:
; (+ (* 6 6) (* 10 10))
; evalute sub-expessions:
; (+ 36 100)
; and then finally:
; 136
; this is called substitution model for procedure applicaiton

; --- normal order evaulation ---
; (f 5)
; first substitute operand expressions for parameters until it obtained an expression involving only
; primitive operators, and would then perform the evaluation
; (sum-of-squares (+ 5 1) (* 5 2))
; (+ (square (+ 5 1)) (square (* 5 2)) )
; (+ (* (+ 5 1) (+ 5 1) (* (* 5 2) (* 5 2)) )
; (+ (* 6 6) (* 10 10) )
; (+ 36 100)
; 136

; ex: 1.3
; Define a procedure that takes three numbers as arguments and return
; the sum of the squares of the two larger numbers.
(define (sum-of-largest-two-squares x y z)
  (sum-of-squares (max x y) (max (min x y) z)))

(sum-of-largest-two-squares 1 2 3) ; 4 + 9 = 13
(sum-of-largest-two-squares 3 1 2) ; 9 + 4 = 13

; ex: 1.4
; interesting: the result of the `if` expression +/- is used for the `a b` block
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(= (a-plus-abs-b 10 -5) 15) ;true
(= (a-plus-abs-b 10 5) 15) ;true

; ex: 1.5 normal vs applicative order?
(define (p)
  (p))

(define (test x y)
  (if (= x 0) 0 y))

; in applicative order this would be an infinite loop
; (test 0 (p))

; evaulation in applicative order
; (test 0 (p))
; get result of sub-expressions:
; (test 0 (p))
; (p)
; (p)
;... infinite loop

; evaulation in normal order
; (test 0 (p))
; retrieve the body of `test`:
; (if (= 0 0) 0 (p))
; since 0 = 0 the else block won't be run, so no infinite loop in normal order case

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

; ex: 1.6
; rewrite `if` speciaf form into `cond`
(define (new-if predicate then-clause else-clause)
  (cond
    [predicate then-clause]
    [else else-clause]))

(define (sqrt-iter-2 guess x)
  (new-if (good-enough? guess x) guess (sqrt-iter-2 (improve guess x) x)))

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x))

; this will run into an infinite loop, but why?
; (sqrt-2 9)
; it will result in an infinite loop because of the behaviour of applicative order evaulation:
; the `new-if` function is not a special form, which means the interpreter will try to
; calculate all of it's sub-expressions, which in the case of:
; (new-if (predicate) true-case else-case) else-case -> is a recursive call to:
; `sqrt-iter-2` which in turn will call it self and thus an infinte loop will occur
