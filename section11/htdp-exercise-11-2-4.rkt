;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; deep-list : 
;; 1. s 
;;    -> s: symbol
;; 2. (cons dl empty)
;;    -> dl: deep-list

;; depth : deep-list -> number
;; to count how many 'cons' was used to build given dl(deep-list).
(define (depth dl)
  (cond ((symbol? dl) 0)
        (else (add1 (depth (first dl))))))


(= 0 (depth 'a))
(= 1 (depth (cons 'a empty)))
(= 2 (depth (cons (cons 'a empty) empty)))
(= 3 (depth (cons (cons (cons 'a empty) empty) empty)))
(= 4 (depth (cons (cons (cons (cons 'a empty) empty) empty) empty)))

;; make-deep : 
;; symbol, number -> deep-list
(define (make-deep s n)
  (cond ((zero? n) s)
        (else (cons (make-deep s (sub1 n))
                    empty))))
