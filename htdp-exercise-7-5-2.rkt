;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-5-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (checked-profit ticket-price)
  (cond ((and (number? ticket-price) (<= 0 ticket-price)) (profit ticket-price))
        ((number? ticket-price) (error 'checked-profit "the ticket price should be higher than 0"))
        (else (error 'checked-profit "number expected"))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (+ 180
     (* .04 (attendees ticket-price))))

(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.00 ticket-price))))


(define (checked-is-between-5-6? n)
  (cond ((number? n) (is-between-5-6? n))
        (else (error 'checked-is-between-5-6? "number expected"))))

(define (is-between-5-6? n)
  (and (< 5 n) (< n 6)))

(define (checked-reply s)
  (cond ((symbol? s) (reply s))
        (else (error 'checked-reply "symbol expected"))))

(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]))

(define (checked-distance-to-0 a-posn)
  (cond ((posn? a-posn) (distance-to-0 a-posn))
        (else (error 'checked-distance-to-0 "posn expected"))))

(define (distance-to-0 a-posn)
  (sqrt
    (+ (sqr (posn-x a-posn))
       (sqr (posn-y a-posn)))))

;; Data Definition:
(define-struct circle (center radius))
(define-struct square (nw length))
;; A shape is either
;; 1. a structure: (make-circle p s)
;;    where p is a posn, s a number;
;; 2. a structure: (make-square p s)
;;    where p is a posn, s a number.

;; Final Definition: 
;; perimeter : shape  ->  number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(circle? a-shape)
     (* (* 2 (circle-radius a-shape)) pi)]
    [(square? a-shape)
     (* (square-length a-shape) 4)]))

(define (checked-perimeter a-shape)
  (cond ((or (circle? a-shape) (square? a-shape)) (perimeter a-shape))
        (else (error 'checked-perimeter "shape expected"))))

