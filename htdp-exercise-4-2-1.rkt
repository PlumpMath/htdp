;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (range1 x)
  (and (< 3 x)
       (<= x 7)))

(define (range2 x)
  (and (<= 3 x)
       (<= x 7)))

(define (range3 x)
  (and (<= 3 x)
       (< x 9)))

(define (range4 x)
  (or (and (< 1 x)
           (< x 3))
      (and (< 9 x)
           (< x 11))))

(define (range5 x)
  (or (< x 1)
      (< 3 x)))
