;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; random-n-m : integer integer  ->  integer
;; returns a numeric value which is
;; (and (n <= value)
;;      (value < m))
;; |---[--value--)---|
;;     n         m
;; Assume: n < m
(define (random-n-m n m)
  (+ (random (- m n)) n))
