#lang racket
(define (map f lst)
   (if (null? lst)
       '()
       (cons (f (car lst)) (map f (cdr lst)))))

;; A regular mult function
(define (mult a)
  (* a 1000))
;;Using map
(map mult '(1 2 3 4))
;;Using map with an anonymus function
(map (lambda (x) (* x 50)) '(1 2 3 4))

;;familiar sintax
(define (reduce f lst)
   (cond
     [(empty? lst) 0]
     [else (+ (f (car lst)) (reduce f (cdr lst)))]))

(reduce mult '(9 8 7 6))