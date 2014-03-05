;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-2-4-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (somef x)
  (sin x x))

(somef 10 20)
; somef: expects only 1 argument, but found 2

(somef 10)
; sin: expects only 1 argument, but found 2

