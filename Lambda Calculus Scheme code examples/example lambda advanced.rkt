#lang racket

;; basic lambda example anonymous function
((lambda ( a b) (+ b a))105 9)

;; returns procedures
(define (make-adder num)
  (lambda (x) (+ x num)))

;; returns procedure 
;;(make-adder 4)

;; returns 10 
;;((make-adder 4) 6)

(define (same-arg-twice fn)
  (lambda (arg) (fn arg arg)))

;;procedure
;;(same-arg-twice *)

;; returns 100
;;((same-arg-twice *) 10)


;;operation recieves the procedure or function to apply (lambda)  and 2 values
(define (operation  op val1 val2)
  (op val1 val2))


;;using anonymous functions
(operation  (lambda (a b) (+ a b)) 4 10)
(operation  (lambda (a b) (- a b)) 4 10)
(operation  (lambda (a b) (/ (+ a b) 2)) 4 10)
(operation  (lambda (a b) (* (+ a b) 2)) 4 10)


;; recursion with pure lambda
;; come back when we have been through basic recursion
;; https://gist.github.com/z5h/238891 best explanation ever!
(((lambda (x) (x x)) ;; x call applies to itself this is a helper for recursion
 (lambda (fact-gen)
   (lambda (n)
     (if (zero? n)
         1
         (* n ((fact-gen fact-gen) (sub1 n)))))))6) ;; sub1 is (- n 1) ;;fact-gen returns a procedure
