#lang racket




;;adds all the elements from 0 to x (including x)
(define (add_all x)
  (cond
    ([< x 1] 0) ;;base case
    [else (+ (add_all (- x 1)) x)])) ;;recursive call

(add_all 5)
(add_all 15)


;;adds all even numbers from 0 to x (including x)
(define (add_even_rec x)
  (cond
    ([< x 1] 0) ;; base case
    ([= (modulo x 2) 0] (+ (add_even_rec (- x 2)) x));;recursive call
    [else (+ (add_even_rec (- x 1)) (- x 1))])) ;;recursive call


(add_even_rec 10)
(add_even_rec 11)
