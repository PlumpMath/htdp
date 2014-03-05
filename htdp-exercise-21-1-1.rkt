;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-21-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; tabulate-sin : number  ->  lon
;; to tabulate sin between n 
;; and 0 (inclusive) in a list
(define (tabulate-sin n)
  (cond
    [(= n 0) (list (sin 0))]
    [else
      (cons (sin n)
	(tabulate-sin (sub1 n)))]))
     	
;; tabulate-sqrt : number  ->  lon
;; to tabulate sqrt between n 
;; and 0 (inclusive) in a list
(define (tabulate-sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
      (cons (sqrt n)
	(tabulate-sqrt (sub1 n)))]))

;; tabulate : f number  ->  (listof number)
;; to tabulate f between n 
;; and 0 (inclusive) in a list
(define (tabulate f n)
  (cond
    [(= n 0) (list (f 0))]
    [else
      (cons (f n)
	(tabulate f (sub1 n)))]))

(define (tabulate-sqr n)
  (tabulate sqr n))

(define (tabulate-tan n)
  (tabulate tan n))

(tabulate-sin 5)
(tabulate sin 5)
(tabulate-sqrt 5)
(tabulate sqrt 5)
(tabulate-sqr 5)
(tabulate sqr 5)
(tabulate-tan 5)
(tabulate tan 5)

