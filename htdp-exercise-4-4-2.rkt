;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-4-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (tax-rate income)
  (cond ((<= income 240) 0)
        ((<= income 480) 0.15)
        (else 0.28)))

(define (tax income)
  (* income (tax-rate income)))

(define (income hours)
  (* hours wage-per-hour))

(define wage-per-hour 12)

(define (netpay hours)
  (- (income hours)
     (tax (income hours))))

