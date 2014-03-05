;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-6-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define PRICE 5)
PRICE -> 5

(define SALES-TAX (* .08 PRICE))
(define SALES-TAX (* .08 5))
(define SALES-TAX 0.4)
SALES-TAX -> 0.4

(define TOTAL (+ PRICE SALES-TAX))
(define TOTAL (+ 5 SALES-TAX))
(define TOTAL (+ 5 0.4))
(define TOTAL 5.4)
TOTAL -> 5.4

