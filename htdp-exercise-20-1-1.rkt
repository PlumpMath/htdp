;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-20-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (f x) x)
; <val> = <boo> | <sym> | <num> | empty | <lst> | <var> | <prm>

"1. (cons f empty)"
;         ^ ^
; (cons f empty) -> <exp>
; f -> <var> -> <val>
; empty -> <val>

"2. (f f)"
;      ^
; (f f) -> <exp>
; f -> <val>

"3. (cons f (cons 10 (cons f 10) empty)))"
;         ^       ^        ^ ^   ^
; (cons ...) -> <exp>
; f -> <var> -> <val>
; 10 -> <num> -> <val>
; empty -> <val>

