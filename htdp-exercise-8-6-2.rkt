;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-6-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define RADIUS 10)
RADIUS -> 10

(define DIAMETER (* 2 RADIUS))
(define DIAMETER (* 2 10))
(define DIAMETER 20)
DIAMETER -> 20

(define CIRCUMFERENCE (* 3.14 DIAMETER))
(define CIRCUMFERENCE (* 3.14 20))
(define CIRCUMFERENCE 62.8)
CIRCUMFERENCE -> 62.8
