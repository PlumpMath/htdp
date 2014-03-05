;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (x)
(x) -> (<var>)
이므로 <def>에도, <exp>에도 해당되지 않는다.
문법적으로 올바르지 않다.

2. (+ 1 (not x))
(+ 1 (not x)) -> (<var> <exp> <exp)
1 -> <con>
(not x) -> (<var> <exp>)
x -> <var>
문법적으로 올바르다. (하지만 실행시간 오류가 발생할 것이다.)

3. (+ 1 2 3)
(+ 1 2 3) -> (<var> <exp> <exp> <exp>)
1, 2, 3 -> <con>
문법적으로 올바르다.
