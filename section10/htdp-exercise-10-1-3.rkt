;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; convertFC
;; parameter: list of numbers (Fahrenheit values)
;; return: list of numbers (Celsius values)
;; to create a list of Celsius values from Fahrenheit values
(define (convertFC F)
  (cond ((empty? F) empty)
        (else (cons (Fahrenheit->Celsius (first F))
                    (convertFC (rest F))))))

;; Fahrenheit->Celsius
;; parameter: number (Fahrenheit value)
;; return: number (Celsius value)
;; convert a Fahrenheit value to Celsius value.
(define (Fahrenheit->Celsius f)
  (/ (* (- f 32)
        5)
     9))
