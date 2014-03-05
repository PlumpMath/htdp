;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; add-up-3 : list-of-3-numbers  ->  number
;; to add up the three numbers in a-list-of-3-numbers
(define (add-up-3 a-list-of-3-numbers)
  (+ (first a-list-of-3-numbers)
     (first (rest a-list-of-3-numbers))
     (first (rest (rest a-list-of-3-numbers)))))

(= (add-up-3 (cons 2 (cons 1 (cons 3 empty)))) 6)
(= (add-up-3 (cons 0 (cons 1 (cons 0 empty)))) 1)

(define (distance-to-0-for-3 a-list-of-3-numbers)
  (distance3d (first a-list-of-3-numbers)
              (first (rest a-list-of-3-numbers))
              (first (rest (rest a-list-of-3-numbers)))))

(define (distance3d x y z)
  (sqrt (+ (sqr x)
           (sqr y)
           (sqr z))))

(= (distance-to-0-for-3 (cons 1 (cons 1 (cons 1 empty)))) (sqrt 3))
(= (distance-to-0-for-3 (cons -1 (cons 2 (cons -1 empty)))) (sqrt 6))
