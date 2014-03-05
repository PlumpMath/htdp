;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-3-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

(define (e-power x)
  (local ((define (e-taylor i)
	    (/ (expt x i) (! i)))
	  (define (! n)
	    (cond
	      [(= n 0) 1]
	      [else (* n (! (sub1 n)))])))
    (series 10 e-taylor)))


(define (ln x)
  (local ((define (ln-term i)
            (exact->inexact
             (* (/ 1
                   (+ (* 2 i)
                      1))
                (expt (/ (- x 1)
                         (+ x 1))
                      (+ (* 2 i)
                         1))))))
    (* 2 (series 100 ln-term))))


