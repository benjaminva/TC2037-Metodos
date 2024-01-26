#lang racket
;;Tail
(define (fibT n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

;;Head
(define (fibH n)
  (cond
    [(< n 1) 0]
    [(= n 1) 1]
    [else (+ (fibH (- n 2)) (fibH(- n 1)))]))