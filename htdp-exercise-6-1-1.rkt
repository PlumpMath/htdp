;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (distance-to-0 a-posn)
  (sqrt
   (+ (sqr (posn-x a-posn))
      (sqr (posn-y a-posn)))))

(distance-to-0 (make-posn 3 4))
;; 풀이
(sqrt (+ (sqr 3) (sqr 4)))
(sqrt (+ 9 16))
(sqrt 25)
5

(distance-to-0 (make-posn (* 2 3) (* 2 4)))
;; 풀이
(sqrt (+ (sqr (* 2 3)) (sqr (* 2 4))))
(sqrt (+ (sqr 6) (sqr 8)))
(sqrt (+ 36 64))
(sqrt 100)
10

(distance-to-0 (make-posn 12 (- 6 1)))
;; 풀이
(sqrt (+ (sqr 12) (sqr (- 6 1))))
(sqrt (+ (sqr 12) (sqr 5)))
(sqrt (+ 144 25))
(sqrt 169)
13

