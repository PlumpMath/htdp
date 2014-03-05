;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-5-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (add n x)
  (cond ((zero? n) x)
        (else (add1 (add (sub1 n) x)))))

(define (multiply-by-pi n)
  (cond ((zero? n) 0)
        (else (+ 3.14 (multiply-by-pi (sub1 n))))))

(define (multiply n x)
  (cond ((zero? n) 0)
        (else (add x (multiply (sub1 n) x)))))

(define (exponent n x)
  (cond ((zero? n) 1)
        (else (multiply x (exponent (sub1 n) x)))))
