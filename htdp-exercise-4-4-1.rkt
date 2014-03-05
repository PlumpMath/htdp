;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-4-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (interest-rate balance)
  (cond ((<= balance 1000) .04)
        ((<= balance 5000) .045)
        (else .05)))

(define (interest balance)
  (* balance (interest-rate balance)))
