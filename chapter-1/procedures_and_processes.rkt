#lang scheme

; this is a linear recursive process
; this procedure needs to 'carry' all of the preceeding values until the base case (= num 1) is met
(define (factorial num)
  (if (= num 1) 1 (* num (factorial (- num 1)))))

; this is a linear iterative process
; the interpreter only needs to keep track of the 3 parameters of the function at any given time
; it's state can be calculated at any time based on those 3 paramaters
; this is called a tail-recursive procedure, because the memory footprint of the procedure does not
; grow as the program grows lineraly
(define (factorial-2 num)
  (define (fact-iter product counter max-count)
    (if (> counter max-count) product (fact-iter (* product counter) (+ counter 1) max-count)))
  (fact-iter 1 1 num))

; ex: 1.9
(define (inc x)
  (+ x 1))
(define (dec x)
  (- x 1))

; this is linear recursive process:
; (define (+ a b)
; (if (= a 0) b (inc (+ (dec a) b))))
; 1.:
; (+ 4 5)
; (inc (+ (dec 4) 5))
; (inc (+ 3 5))
; (inc (inc (+ (dec 3) 5)))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ (dec 2 5))))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ (dec 1) 5)))))
; (inc (inc (inc (inc + 0 5))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

; this is a linear iterative process:
; (define (+ a b)
; (if (= a 0) b (+ (dec a) (inc b))))
; 2.:
; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ 2 7)
; (+ (dec 2) (inc 7))
; (+ 1 8)
; (+ (dec 1) (inc 8))
; (+ 0 9)
; 9
