#lang racket
;; comments
(define (sum v b)
  (+ v b))

;; call lambda
((lambda (v b) (+ v b)) 2 3)


;; define add as lambda operation
(define add (lambda (x)
              (lambda (y) (+ x y))))
;;call ((add 2)3)


;;(define (square x) (* x x))
(define square (lambda (x) (* x x))) 

;; call lambda
((lambda (x) (* x x)) 10)

;; define a procedure that as ask for
;; two values and prints which one is greater.
(define (test a b)
  (cond
    [(> a b)a ]
    [else b]))


;;some examples from https://www.scheme.com/tspl2d/binding.html variable definitions

(define x 3)
;;x  3 

(define f
  (lambda (x y)
    (* (+ x y) 2)))
;;(f 5 4)  18 

(define (sum-of-squares x y)
  (+ (* x x) (* y y)))
;;(sum-of-squares 3 4)  25 