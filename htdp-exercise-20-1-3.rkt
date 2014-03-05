;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-20-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (a-function=? f1 f2)
  (and (equal? (f1 1.2) (f2 1.2))
       (equal? (f1 3) (f2 3))
       (equal? (f1 -5.7) (f2 -5.7))))

(define (fa x)
  0)

(define (fb x)
  (* 0 x))

(define (fc x)
  x)

(define (fd x)
  (* 1 x))

(a-function=? fa fb)
(a-function=? fa fc)
(a-function=? fa fd)
(a-function=? fb fc)
(a-function=? fb fd)
(a-function=? fc fd)

(define (function=? n f1 f2)
  (equal? (f1 n) (f2 n)))
