;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-3-3-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (Fahrenheit->Celsius f)
  (/ (* (- f 32)
        5)
     9))

(define (Celsius->Fahrenheit c)
  (+ (* (/ 9 5)
        c)
     32))

(define (I f)
  (Celsius->Fahrenheit (Fahrenheit->Celsius f)))

(I 32)

;; 두 함수는 서로 역함수 관계다.
