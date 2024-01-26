#lang racket


;;list
(cons 1 empty)
(cons 1(cons 1 (cons 1 empty)))


;; pair examples (common errors)
(cons 1 2)
(cons (cons 1 empty) 3)


