#lang racket
;; define a function is_larger which receives 2 parameters
;; and returns true if the first element is larger than the second
;; (is_larger 3 19) -> false
;; (is_larger 10 3) -> true
(define (is_larger a b)
  (cond
    [(> a b) true]
    [else false]))

(is_larger 3 19)
(is_larger 10 3)

;; define a function is_lesser which receives 2 parameters
;; and returns true if the first element is larger than the second
;; (is_lesser 3 50) -> true
;; (is_lesser 10 3) -> false
(define (is_lesser a b)
  (if (< a b)
      true
      false))

 (is_lesser 3 50) ;;-> true
 (is_lesser 10 3) ;;-> false

;; define a function larger-items which receives a list of numbers and
;; a threshold number, the function returns a list will all the numbers
;; larger than the threshold
;; (larger-items '(1 2 3 4 5) 3)  -> (4 5)
;; (larger-items '(1 2 3 4 5) 5)  -> ()
;; (larger-items '(1 2 3 4 5) 0)  -> (1 2 3 4 5)
(define (larger-items list threshold)
  (if (empty? list)
      empty
      (if (is_larger (first list) threshold)
          (cons (first list) (larger-items (rest list) threshold))
          (larger-items (rest list) threshold))))

(larger-items '(1 2 3 4 5) 3) ;; -> (4 5)
(larger-items '(1 2 3 4 5) 5) ;; -> ()
(larger-items '(1 2 3 4 5) 0) ;; -> (1 2 3 4 5)

;; define a function lesser-items which receives a list of numbers and
;; a threshold number, the function returns a list will all the numbers
;; smaller (or lesser) than the threshold
;; (lesser-items '(1 2 3 4 5) 3)  -> (1 2)
;; (lesser-items '(1 2 3 4 5) 5)  -> (1 2 3 4)
;; (lesser-items '(1 2 3 4 5) 0)  -> ()

(define (lesser-items list threshold)
  (if (empty? list)
      empty
      (if (is_lesser (first list) threshold)
          (cons (first list) (lesser-items (rest list) threshold))
          (lesser-items (rest list) threshold))))

 (lesser-items '(1 2 3 4 5) 3) ;; -> (1 2)
 (lesser-items '(1 2 3 4 5) 5) ;; -> (1 2 3 4)
 (lesser-items '(1 2 3 4 5) 0) ;; -> ()

;; define a function add_last which receives a list and an element,
;; and adds the element to the last part of the list
(define (add_last list elem)
  (if (empty? list)
      (cons elem '())
      (cons (first list) (add_last (rest list) elem))))

(add_last '(1 2 3) 4)

;; define a function append_lists which recieves 3 lists and appends
;; them. 
;; (append_lists '(1 2 3) '(4) '(55))  -> '(1 2 3 4 55)

(define (append_lists lista listb listc)
  (if (empty? listb)
      (if (empty? listc)
          lista
          (append_lists
           (add_last lista (first listc))
           listb
           (rest listc)))
      (append_lists
        (add_last lista (first listb))
        (rest listb)
        listc)))

(append_lists '(1 2 3) '(4) '(55))


;; define a function quick-sort which recieves a list of
;; unordered numbers and returns a list of ordered numbers 
;; (quick-sort '(1 33 2 4 55 6 12 9))  -> '(1 2 4 6 9 12 33 55)
(define (quick-sort list)
  (if (empty? list)
      '()
      (append_lists
       (quick-sort (lesser-items list (first list)))
       (cons (first list)'())
       (quick-sort (larger-items list (first list))))))

(quick-sort '(1 33 2 4 55 6 12 9))
