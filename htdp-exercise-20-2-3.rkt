;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-20-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| filter1
(X -> boolean) (listof X) X -> (listof X)
|#
(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else
     (local ((define first-item (first alon))
             (define rest-filtered
               (filter1 rel-op (rest alon) t)))
       (cond
         [(rel-op first-item t)
          (cons first-item rest-filtered)]
         [else
          rest-filtered]))]))

(define (not-symbol=? a b)
  (not (symbol=? a b)))

(define (without-car l)
  (filter1 not-symbol=? l 'car))


(without-car (list 'apple 'banana 'car 'desk 'envelop 'fog))
(without-car (list 'car 'cdr 'cadr 'caar 'cddar))
