#lang racket



;; mutual recursion
;; helper function to check if a node is at the bottom of the tree
(define (leaf? tree)
  (cond
    [(empty? (cdr tree))true]
    [else false]))

;; helper function to get children of a node (which are the rest of the anidated list)
(define (children tree)
  (cdr tree))

;;first call explores the depth of the tree
(define (count-leaves tree)
  (if (leaf? tree)
      1
      (count-leaves-in-forest (children tree))));;calls in-forest to explore the width (mutal recursio)

;;
(define (count-leaves-in-forest forest)
  (if (null? forest)
      0
      (+ (count-leaves (car forest));;calls to count-leaves to explore depth (mutual recursion)
         (count-leaves-in-forest (cdr forest))))) ;; recursive call unto itself to explore the other ones


(leaf? '(a (b (c) (d)) (e (f) (g))))
(leaf? '(a))
(leaf? '(b (e) (d (j)(k))))
(leaf? '(b (c) (d)))
(children '(a (b (c) (d)) (e (f) (g)))) 
(count-leaves '(a (b (c) (d)) (e (f) (g)))) 
(count-leaves '(a (b (c) (d)(p)) (e (f) (g)))) 
(count-leaves '(a (b (c) (d)) (e (f) (g))(n (h)(i))(z))) 



(define (add-leaves tree)
  (if (leaf? tree)
      (first tree)
      (add-leaves-in-forest (children tree))))

(define (add-leaves-in-forest forest)
  (if (null? forest)
      0
      (+ (add-leaves (car forest))
         (add-leaves-in-forest (cdr forest)))))

(add-leaves '(100 (100 (1) (2)) (100 (3) (5)))) 
;; 11

(add-leaves '(1 (2 (3) (4)) (5 (6) (7))))
;; 20

(add-leaves '(1 (3) (4)))
;; 7

(add-leaves '(100))
;; 100

(add-leaves '(1 (3 (6 (12(40(42)))))))
;; 42


(define (add-nodes tree)
  (if (leaf? tree)
      (first tree)
      (+ (add-nodes-in-forest (children tree))(first tree))))

(define (add-nodes-in-forest forest)
  (if (null? forest)
      0
      (+ (add-nodes (car forest))
         (add-nodes-in-forest (cdr forest)))))

(add-nodes '(1 (2) (3)))
;; 28