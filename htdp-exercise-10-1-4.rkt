;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; convert-euro
;; parameter: list of number(Dollar currency)s
;; return: list of number(Euro currency)s
;; to create a list of Euro values from Dollar values
(define (convert-euro dollar-list)
  (cond ((empty? dollar-list) empty)
        (else (cons (dollar->euro (first dollar-list))
                    (convert-euro (rest dollar-list))))))

;; dollar->euro dollar
(define (dollar->euro dollar)
  (* dollar euro-per-dollar))

(define euro-per-dollar 1.22)

;; convert-euro-1
(define (convert-euro-1 exchange-rate dollar-list)
  (cond ((empty? dollar-list) empty)
        (else (cons (* exchange-rate (first dollar-list))
                    (convert-euro-1 (rest dollar-list))))))

