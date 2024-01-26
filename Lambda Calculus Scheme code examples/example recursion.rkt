#lang racket
;; factorial recursion(right) normal
(define (factH n)
  (cond
    [(= 1 n) 1]
    [else (* (factH (- n 1)) n)]))

;; factorial tail(left) rec normal
(define (factT n res)
  (cond
    [(= 1 n) res]
    [else (factT (- n 1)(* res n))]))


