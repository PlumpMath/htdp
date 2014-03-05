;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-22-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (make-fold f init)
  (local ((define (fold l)
            (cond ((empty? l) init)
                  (else (f (first l)
                           (fold (rest l)))))))
    fold))

;; sum : (listof number)  ->  number
;; to compute the sum of alon
(define sum (make-fold + 0))
     	
;; product : (listof number)  ->  number
;; to compute the product of alon
(define product (make-fold * 1))

(define L (list 1 1 2 3 5 7 9 11 13 17 19 21))

(sum L)
(product L)

