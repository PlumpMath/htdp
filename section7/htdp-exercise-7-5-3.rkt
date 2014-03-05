;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-5-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct vec (x y))
;; A speed-vector (vec) is a structure:
;;   (make-vec x y)
;; where both x and y are positive numbers.

(define (checked-make-vec x y)
  (cond ((and (<= 0 x) (<= 0 y)) (make-vec x y))
        (else (error 'checked-make-vec "values should be positive"))))
