#lang racket
;; quick-sort : (listof number)  ->  (listof number)
;; to create a list of numbers with the same numbers as
;; alon sorted in ascending order
;; assume that the numbers are all distinct 
(define (quick-sort alon)
  (cond
    [(empty? alon) empty]
    [else (append (quick-sort (smaller-items alon (first alon))) 
	    	  (list (first alon)) 
		  (quick-sort (larger-items alon (first alon))))]))

;; larger-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are larger than threshold
(define (larger-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (> (first alon) threshold) 
	      (cons (first alon) (larger-items (rest alon) threshold))
	      (larger-items (rest alon) threshold))]))

;; smaller-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are smaller than threshold
(define (smaller-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (< (first alon) threshold) 
	      (cons (first alon) (smaller-items (rest alon) threshold))
	      (smaller-items (rest alon) threshold))]))

(quick-sort '(1  33 2 4 55 6 12 9))