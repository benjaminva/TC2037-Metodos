#lang racket
;; define a function is_larger which receives 2 parameters
;; and returns true if the first element is larger than the second
;; (is_larger 3 19) -> false
;; (is_larger 10 3) -> true

;; define a function is_lesser which receives 2 parameters
;; and returns true if the first element is larger than the second
;; (is_lesser 3 50) -> true
;; (is_lesser 10 3) -> false

;; define a function larger-items which receives a list of numbers and
;; a threshold number, the function returns a list will all the numbers
;; larger than the threshold
;; (larger-items (1 2 3 4 5) 3)  -> (4 5)
;; (larger-items (1 2 3 4 5) 5)  -> ()
;; (larger-items (1 2 3 4 5) 0)  -> (1 2 3 4 5)

;; define a function lesser-items which receives a list of numbers and
;; a threshold number, the function returns a list will all the numbers
;; smaller (or lesser) than the threshold
;; (larger-items (1 2 3 4 5) 3)  -> (1 2)
;; (larger-items (1 2 3 4 5) 5)  -> (1 2 3 4)
;; (larger-items (1 2 3 4 5) 0)  -> ()

;; define a function append_lists which recieves 3 lists and appends
;; them. 
;; (append_lists '(1 2 3) '(4) '(55))  -> '(1 2 3 4 55)

;; define a function quick-sort which recieves a list of
;; unordered numbers and returns a list of ordered numbers 
;; (quick-sort '(1 33 2 4 55 6 12 9))  -> '(1 2 4 6 9 12 33 55)
