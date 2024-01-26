#lang racket

;; original code in https://eecs.ceas.uc.edu/~franco/C511/html/Scheme/mergesrt.html

;; merge 2 lists or ordered numbers
(define (merge l1 l2)
  (cond
    [(null? l1) l2]
    [(null? l2) l1]
    [(< (car l1)(car l2)) (cons (car l1)(merge (cdr l1) l2))]
    [else (cons (car l2)(merge (cdr l2) l1))]))

;;split-odd
(define (split-odd l)
  (cond
    [(null? l) '()]
    [(null? (cdr l))l]
    [else (cons (car l)(split-odd (cdr (cdr l))))]))


;;split-even
(define (split-even l)
  (cond
    [(null? l) '()]
    [(null? (cdr l))'()]
    [else (cons (car (cdr l))(split-even (cdr (cdr l))))]))

(split-odd '(1 2 3 4 5 6 7 8))
(split-even '(1 2 3 4 5 6 7 8))

;;merge-sort
(define (merge-sort l)
  (cond
    [(null? l) l]
    [(null? (cdr l))l]
    [else
     (merge
      (merge-sort(split-odd l))
      (merge-sort(split-even l)))]))

(merge-sort '(4 5 632 1))