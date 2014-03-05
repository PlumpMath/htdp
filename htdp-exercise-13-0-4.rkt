;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-13-0-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 1
(cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty)))))
(list 'a 'b 'c 'd 'e)

;; 2
(cons (cons 1 (cons 2 empty)) empty)
(list (list 1 2))

;; 3
(cons 'a (cons (cons 1 empty) (cons false empty)))
(list 'a (list 1) false)
