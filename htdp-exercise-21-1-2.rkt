;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-21-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; sum : (listof number)  ->  number
;; to compute the sum of 
;; the numbers on alon
(define (sum alon)
  (cond
    [(empty? alon) 0]
    [else (+ (first alon)
	     (sum (rest alon)))]))
     	
;; product : (listof number)  ->  number
;; to compute the product of 
;; the numbers on alon
(define (product alon)
  (cond
    [(empty? alon) 1]
    [else (* (first alon)
	     (product (rest alon)))]))

;; fold : f number (listof number)  ->  number
;; to compute the f of 
;; init and the numbers on alon
(define (fold f init alon)
  (cond
    [(empty? alon) init]
    [else (f (first alon)
	     (fold f init (rest alon)))]))

;; append : (listof number) (listof number) -> (listof number)
(define (new-append l1 l2)
  (fold cons l2 l1))

;; map : (number -> X) (listof number) -> (listof X)
(define (new-map f l)
  (local ((define (apply-f-and-cons e r)
            (cons (f e) r)))
    (fold apply-f-and-cons empty l)))

(define L (list 1 1 2 3 5 7 9 11 13 17 19 21))

(equal? (sum L) (fold + 0 L))
(equal? (product L) (fold * 1 L))

(equal? (new-append (list 1 2 3) (list 4 5 6 7 8))
        (list 1 2 3 4 5 6 7 8))
