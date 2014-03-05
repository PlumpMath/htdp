;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-5-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; area-of-disk : number  ->  number
;; to compute the area of a disk with radius r
(define (area-of-disk r) 
  (* 3.14 (* r r)))

;; checked-area-of-disk : Scheme-value  ->  number
;; to compute the area of a disk with radius v, 
;; if v is a number
(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (< 0 v)) (area-of-disk v)]
    [(number? v) (error 'checked-area-of-disk "the number should be higher than 0")]
    [else (error 'checked-area-of-disk "number expected")]))

