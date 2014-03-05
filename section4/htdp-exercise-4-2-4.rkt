;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (Fahrenheit->Celsius f)
  (/ (* (- f 32)
        5)
     9))

(define euro-per-dollar 0.7236)

(define (dollar->euro dollar)
  (* dollar euro-per-dollar))

(define (triangle bottom height)
  (/ (* bottom height) 2))

(define (convert3 n0 n1 n2)
  (+ n0
     (* n1 10)
     (* n2 100)))


(= (Fahrenheit->Celsius 32)
   0)

(= (dollar->euro 100)
   72.36)

(= (triangle 10 5)
   25)

(= (convert3 1 2 3)
   321)
