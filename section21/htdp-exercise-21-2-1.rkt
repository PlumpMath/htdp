;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-21-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
"1."
(build-list 4 identity)
(build-list 4 add1)

"2."
(local ((define (shift n)
          (expt 0.1 (add1 n))))
  (build-list 4 shift))

"3."
(define (evens n)
  (local ((define (twice n)
            (* 2 n)))
  (build-list n twice)))
(evens 10)

"4."
;; tabulate : f number  ->  (listof number)
;; to tabulate f between n 
;; and 0 (inclusive) in a list
(define (tabulate f n)
  (local ((define (mirror m)
            (abs (- m n)))
          (define (mirrored-f m)
            (f (mirror m))))
    (build-list (add1 n) mirrored-f)))
(tabulate sin 5)
(tabulate sqrt 5)

"5."
(define (diagonal n)
  (local ((define (row y)
            (local ((define (cell x)
                      (cond ((= x y) 1)
                            (else 0))))
            (build-list n cell))))
  (build-list n row)))

(diagonal 3)
(diagonal 4)
(diagonal 5)
