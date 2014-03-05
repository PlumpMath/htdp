;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-20-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
"1. (define (f x) (x 10))"
#|
(define (f x) (x 10))
(define (<var> <var>) (<var> <num>))
(define (<var> <var>) (<exp> <exp>))
(define (<var> <var>) <exp>)
<def>
|#

"2. (define (f x) f)"
#|
(define (f x) f)
(define (<var> <var>) <var>)
(define (<var> <var>) <exp>)
<def>
|#

"3. (define (f x y) (x 'a y 'b))"
#|
(define (f x y) (x 'a y 'b))
(define (<var> <var> <var>) (<var> <sym> <var> <sym>))
(define (<var> <var> <var>) (<exp> <exp> <exp> <exp>))
(define (<var> <var> <var>) <exp>)
<def>
|#
