;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (g-fives n)
  (cond ((= n 0) 3)
        (else (* (g-fives (sub1 n)) 5))))

(define (g-fives-closed n)
  (* 3 (expt 5 n)))

(define (seq-g-fives n)
  (build-list n g-fives-closed))

(build-list 10 g-fives)
(build-list 10 g-fives-closed)
(seq-g-fives 10)
