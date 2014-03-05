;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-3-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (series n term)
  (cond ((= n 0) (term n))
        (else (+ (term n)
                 (series (sub1 n) term)))))

(define (g-fives n)
  (cond ((= n 0) 3)
        (else (* (g-fives (sub1 n)) 5))))

(define (g-fives-closed n)
  (* 3 (expt 5 n)))

(define (seq-g-fives n)
  (build-list n g-fives-closed))

(define (geometric-series start s)
  (local ((define (series n)
            (cond ((= n 0) start)
                  (else (* (series (sub1 n)) s)))))
    series))

(define (e-taylor x i)
  (/ (expt x i)
     (! i)))

(define (get-e-taylor-of-x x)
  (local ((define (e-tayilor-of-x i)
            (e-taylor x i)))
    e-tayilor-of-x))

(define (! n)
  (cond ((= n 0) 1)
        (else (* n (! (sub1 n))))))

(series 10 (get-e-taylor-of-x 1))

(define (e-power x)
  (local ((define (e-taylor i)
	    (/ (expt x i) (! i)))
	  (define (! n)
	    (cond
	      [(= n 0) 1]
	      [else (* n (! (sub1 n)))])))
    (series 10 e-taylor)))

(e-power 1)

(define (e-power-3 x)
  (local ((define (e-taylor i)
	    (/ (expt x i) (! i)))
	  (define (! n)
	    (cond
	      [(= n 0) 1]
	      [else (* n (! (sub1 n)))])))
    (series 3 e-taylor)))

"e-power 3"
(e-power-3 1)
(local ((define (e-taylor i)
          (/ (expt 1 i) (! i)))
        (define (! n)
          (cond
            [(= n 0) 1]
            [else (* n (! (sub1 n)))])))
  (series 3 e-taylor))
"i = 3: "
(/ (expt 1 3) (! 3))
(/ 1 6)
"i = 2: "
(/ (expt 1 2) (! 2))
(/ 1 2)
"i = 1: "
(/ (expt 1 1) (! 1))
(/ 1 1)
(+ 1/6 1/2 1/1)
"i = 0: "
(/ (expt 1 0) (! 0))
(/ 1 1)
"summery : "
(+ 1/6 1/2 1/1 1/1)
"inexact : "
(+ (exact->inexact 1/6)
   (exact->inexact 1/2)
   (exact->inexact 1/1)
   (exact->inexact 1/1))


