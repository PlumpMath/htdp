;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct square (nw length))
(define-struct circle (center radius))

;; perimeter : shape  ->  number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(square? a-shape) (* (square-length a-shape) 4)]
    [(circle? a-shape) (* (* 2 (circle-radius a-shape)) pi)]))

(define example1 (make-square (make-posn 20 20) 3))
(define example2 (make-square (make-posn 2 20) 3))
(define example3 (make-circle (make-posn 10 99) 1))

(perimeter example1)
(perimeter example2)
(perimeter example3)
