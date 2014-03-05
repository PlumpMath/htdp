;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-4-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-structure circle (center radius))
;; A circle is a structure:
;; (make-circle (center radius))
;; where center is a posn, radius a number.

(define-structure rectangle (nw width height))
;; A rectangle is a structure:
;; (make-rectangle (nw width height)
;; where nw is a posn, width a number, height a number.

;; A shape is either
;; 1. circle, or
;; 2. rectangle.

;; template for shape
;; shape -> ???
(define (fun-for-shape a-shape)
  (cond ((circle? a-shape) ...)
        ((rectangle? a-shape) ...)))

