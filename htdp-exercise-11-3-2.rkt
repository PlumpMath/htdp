;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-3-2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; random-n-m : integer integer  ->  integer
;; returns a numeric value which is
;; (and (n <= value)
;;      (value < m))
;; |---[--value--)---|
;;     n         m
;; Assume: n < m
(define (random-n-m n m)
  (+ (random (- m n)) n))

;; tie-dyed : integer -> list
;; a list of random numbers between 20 ~ 120
(define (tie-dyed n)
  (cond ((zero? n) empty)
        (else (cons (random-n-m 20 120)
                    (tie-dyed (sub1 n))))))

(define (draw-circles p rad-l)
  (cond ((empty? rad-l) true)
        (else (and (draw-circle p (first rad-l) 'black)
                   (draw-circles p (rest rad-l))))))

(start 300 300)
(draw-circles (make-posn 150 150) (tie-dyed 20))

