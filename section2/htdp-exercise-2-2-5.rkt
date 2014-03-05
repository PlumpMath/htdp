;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-2-2-4) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
(define (f1 n)
  (+ (sqrt n)
     10))

(define (f2 n)
  (+ (* (/ 1 2)
        (sqrt n))
     20))

(define (f3 n)
  (- 2
     (/ 1 n)))
