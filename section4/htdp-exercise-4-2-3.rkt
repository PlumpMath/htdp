;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (square x)
  (* x x))

(define (equation1 n)
  (= 62
     (+ (* 4 n)
        2)))

(define (equation2 n)
  (= 102
     (* 2
        (square n))))

(define (equation3 n)
  (= 462
     (+ (* 4 (square n))
        (* 6 n)
        2)))

;; 10: 세 번째 등식의 해가 됨

;; 12: 세 등식 모두의 해가 되지 못함.

;; 14: 세 등식 모두의 해가 되지 못함.

