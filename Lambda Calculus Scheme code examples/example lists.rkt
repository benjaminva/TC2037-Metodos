#lang racket

;; list example
(define lista (cons 1(cons 2 (cons 3 empty))))

(define (addlist a b)
  (cons a(cons b empty)))

;; car from lisp is first
;; cdr from lisp is rest
;; normal head right recursion 
(define (add1 a)
  (cond
    [(empty? a) 0]
    [else (+ (car a) (add1 (cdr a) ))]))

;;add elements in a list with tail recursion
(define (add a res)
  (cond
    [(empty? a) res]
    [else (add (rest a) (+ (first a) res))]))


;; generate a list with x elements (1s)
(define (elements a x)
  (cond
    [(< x 0) a]
    [else (elements (cons x a)(- x 1))]))
(elements  empty 6)

;; list with n elements
(define (elements2 a x)
  (cond
    [(< x 0) a]
    [else (cons 1 (elements2 a(- x 1)))]))
(elements2 '(a b) 4)

;;invert  with dots
(define (inv l)
  (cond
    [(empty? l) '()]
    [else (addLast (inv (cdr l))(car l))]))
;;(inv '(1 32 11 44 5 5 1 4 3))


;;add last
(define (addLast l x)
  (cond
    [(empty? l)(cons x empty)]
    [else (cons (car l)(addLast (cdr l) x))]))
;;(addLast '(1 2 3 4) 5)
