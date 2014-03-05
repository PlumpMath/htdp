;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-21-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; copy : N X  ->  (listof X)
;; to create a list that contains
;; obj n times
(define (copy n obj)
  (cond
    [(zero? n) empty]
    [else (cons obj 
                (copy (sub1 n) obj))]))
 	
;; n-adder : N number  ->  number
;; to add n to x using
;; (+ 1 ...) only
(define (n-adder n x)
  (cond
    [(zero? n) x]
    [else (+ 1
             (n-adder (sub1 n) x))]))

;; natural-f : (number -> X) N Y1 Y2 Y3 -> Y4
(define (natural-f f n on-zero on-not-zero)
  (cond
    ((zero? n) on-zero)
    (else (f on-not-zero
             (natural-f f (sub1 n) on-zero on-not-zero)))))

(define (new-copy n obj)
  (natural-f cons n empty obj))

(define (new-n-adder n x)
  (natural-f + n x 1))


(copy 5 'a)
(new-copy 5 'a)

(n-adder 10 5)
(new-n-adder 10 5)
