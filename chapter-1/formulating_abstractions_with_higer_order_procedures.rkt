#lang scheme

(define (sum term a next b)
  (if (> a b) 0 (+ (term a) (sum term (next a) next b))))

(define (cube num)
  (* num num num))
(define (inc a)
  (+ a 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 9 10)

(define (square n)
  (* n n))
; lamdba procedures:
((lambda (n) (* n n)) 3)
((lambda (x y z) (+ x y ((lambda (n) (* n n)) z))) 1 2 3)

(define (f x y)
  ((lambda (a b) (+ (* x (square a)) (* y b) (* a b))) (+ 1 (* x y)) ; this will be 'a' in the lambda
                                                       (- 1 1 y) ; and this will be 'b'
                                                       ))

; the above expression is so useful that there is a special form to make it more convinient:
; let expression
(define (f-1 x y)
  ;let expression local variables:
  (let ([a (+ 1 (* x y))] [b (- 1 y)])
    ;let expression body:
    (+ (* x (square a)) (* y b) (* a b))))

; general form of let expression:
; (let ((<var_1> <exp_1>)
;       (<var_2> <exp_2>)
;              . . .
;       (<var_n> <exp_n>))
;    <body>)
