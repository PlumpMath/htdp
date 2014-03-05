;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-13-0-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 1
(cons 'a (list 0 false))
(cons 'a (cons 0 (cons false empty)))
(list 'a 0 false)

;; 2
(list (cons 1 (cons 13 empty)))
(cons (cons 1 (cons 13 empty)) empty)
(list (list 1 13))

;; 3
(list empty empty (cons 1 empty))
(cons empty (cons empty (cons (cons 1 empty) empty)))
(list empty empty (list 1))

;; 4
(cons 'a (cons (list 1) (list false empty)))
(cons 'a
      (cons (cons 1 empty)
            (cons false
                  (cons empty empty))))
(list 'a (list 1) false empty)

