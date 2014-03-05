;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-4-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; ! : N  ->  N
;; to compute n  ·  (n - 1)  ·  ...  ·  2  ·  1
(define (! n)
  (cond
    [(zero? n) 1]
    [else (* n (! (sub1 n)))]))

;; (! 2)
;; (* 2 (! 1))
;; (* 2 (* 1 (! 0))
;; (* 2 (* 1 1)
;; (* 2 1)
;; 2

(! 2)
(! 10)
(! 100)
(! 1000)

(define (product-from-20-old n)
  (cond
    ((= 21 n) 21)
    (else (* n (product-from-20-old (sub1 n))))))

(define (product-from-20 n)
  (/ (! n) (! 20)))

