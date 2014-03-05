;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (define (f x) 'x)
(define (<var> <var>) <exp>)
'x -> <con>
문법적으로 올바르다.

2. (define (f 'x) x)
(define (<var> <con>) <exp>)
헤더에 <con>이 있으므로 문법적으로 올바르지 않다.

3. (define (f x y) (+ 'y (not x)))
(define (<var> <var> <var>) <exp>)
(+ 'y (not x)) -> (<var> <exp> <exp>)
'y -> <con>
(not x) -> (<var> <exp>)
x -> <var>
문법적으로 올바르다.
