;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-5-1) (read-case-sensitive #t) (teachpacks ((lib "graphing.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.rkt" "teachpack" "htdp")))))
(define (q1 x) (+ x 4))
(define (q2 x) (- 4 x))
(define (q3 x) (+ x 10))
(define (q4 x) (- 10 x))
(define (q5 x) 12)

(graph-line q1 'red)
(graph-line q2 'blue)
(graph-line q3 'green)
(graph-line q4 'magenta)
(graph-line q5 'black)
