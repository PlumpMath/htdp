;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-22-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

(define (mapped-f f)
  (local ((define (m l)
            (cond ((empty? l) empty)
                  (else
                   (cons (f (first l))
                         (m (rest l)))))))
    m))

(define convertCF
  (local ((define (C->F C)
            (+ 32 (* 1.8 C))))
    (mapped-f C->F)))

(define names
  (mapped-f ir-name))


(convertCF (list 0 10 20 30 40 50))
