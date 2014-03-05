;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; dollar-store?
;; Checks if every value is lower than 1 or equals to 1
;; in a list of price(number).
(define (dollar-store? l)
  (cond ((empty? l) true)
        (else (cond ((< 1.00 (first l)) false)
                    (else (dollar-store? (rest l)))))))

;; examples
(dollar-store? empty)
(not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))))
(dollar-store? (cons .75 (cons .95 (cons .25 empty))))

