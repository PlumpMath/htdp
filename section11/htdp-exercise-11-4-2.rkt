;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-4-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; ! : N  ->  N
;; to compute n  ·  (n - 1)  ·  ...  ·  2  ·  1
(define (! n)
  (cond
    [(zero? n) 1]
    [else (* n (! (sub1 n)))]))

(define (product n m)
  (/ (! m) (! n)))

