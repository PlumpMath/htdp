;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-4-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (list-pick0 alos n)
  (cond
    ((empty? alos) (error 'list-pick "ERROR"))
    ((zero? n) (first alos))
    ((< 0 n) (list-pick0 (rest alos) (sub1 n)))
    (else (error 'list-pick "ERROR"))))


;; (list-pick0 empty 0)
(list-pick0 (list 0 1 2 3 4 5 6 7 8 9) 8)
(list-pick0 (list 0 1 2 3 4 5 6 7 8 9) 0)

;; 단순화가 가능하다.
