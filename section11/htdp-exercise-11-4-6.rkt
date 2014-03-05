;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-4-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; f : number  ->  number
(define (f x)
  (+ (* 3 (* x x)) 
     (+ (* -6 x)
        -1)))

;; tabulate-f : number -> list-of-posn
(define (tabulate-f x)
  (cond ((zero? x)
         empty)
        (else
         (cons (make-posn x
                          (f x))
               (tabulate-f (sub1 x))))))

;; tabulate-f20 : number -> list-of-posn
(define (tabulate-f20 x)
  (cond ((= x 20) empty)
        (else (cons (make-posn x (f x))
                    (tabulate-f20 (sub1 x))))))

;; tabulate-f-lim : number -> list-of-posn
(define (tabulate-f-lim n lim)
  (cond ((= n lim) empty)
        (else (cons (make-posn n (f n))
                    (tabulate-f-lim (sub1 n) lim)))))

;; tabulate-f-up-to-20 : number -> list-of-posn
(define (tabulate-f-up-to-20 n)
  (cond ((= 20 n) empty)
        (else (cons (make-posn n (f n))
                    (tabulate-f-up-to-20 (add1 n))))))

