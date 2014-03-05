;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (a-fives n)
  (cond ((= n 0) (+ 3 5))
        (else (+ (a-fives (sub1 n))
                 5))))

(build-list 10 a-fives)
