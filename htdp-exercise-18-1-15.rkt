;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; extract1 : inventory  ->  inventory
;; to create an inventory from an-inv for all
;; those items that cost less than $1
#|
;; original
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(<= (ir-price (first an-inv)) 1.00)
             (cons (first an-inv) (extract1 (rest an-inv)))]
            [else (extract1 (rest an-inv))])]))
|#
;; modified
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (local ((define car (first an-inv))
                  (define cdr (rest an-inv)))
            (cond
              [(<= (ir-price car) 1.00)
               (cons car (extract1 cdr))]
              [else (extract1 cdr)]))]))
