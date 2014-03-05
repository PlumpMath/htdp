;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; name-robot
(define (name-robot toy-list)
  (cond ((empty? toy-list) empty)
        (else (cons (cond ((symbol=? (first toy-list) 'robot) 'r2d2)
                          (else (first toy-list)))
                    (name-robot (rest toy-list))))))

;; example
(name-robot (cons 'robot (cons 'doll (cons 'dress empty))))

;; substitute
(define (substitute new old toy-list)
  (cond ((empty? toy-list) empty)
        (else (cons (cond ((symbol=? (first toy-list) old) new)
                          (else (first toy-list)))
                    (substitute new old (rest toy-list))))))

;; example
(substitute 'Barbie 'doll (cons 'robot (cons 'doll (cons 'dress empty))))
