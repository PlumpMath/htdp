;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-7-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ball (x y speed-x speed-y))

(number? (make-ball 1 2 3 4))
false

(ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3))
3

(ball-y (make-ball (+ 1 2) (+ 3 3) 2 3))
6

(number? (make-ball 1 3 4))
-> error! make-ball: expects 4 arguments, but found only 3

(ball-x (make-posn 1 2))
-> error! ball-x: expects a ball, given (make-posn 1 2)

(ball-speed-y 5)
-> error! ball-speed-y: expects a ball, given 5
