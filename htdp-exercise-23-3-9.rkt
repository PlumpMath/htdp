;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-3-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (series n term)
  (cond ((= n 0) (term n))
        (else (+ (term n)
                 (series (sub1 n) term)))))

(define (greg i)
  (local ((define order (+ (* 2 i) 1))
          (define unsigned (/ 1 order)))
    (cond ((even? i) unsigned)
          ((odd? i) (- unsigned)))))

(define (calc-pi precision)
  (* 4 (series precision greg)))

"DrRacket Defined PI:"
pi
"precision 1:"
(calc-pi 1)
"precision 2:"
(calc-pi 2)
"precision 4:"
(calc-pi 4)
"precision 8:"
(calc-pi 8)
"precision 16:"
(calc-pi 16)
"precision 32:"
(calc-pi 32)
"precision 64:"
(calc-pi 64)
"precision 128:"
(calc-pi 128)
"precision 256:"
(calc-pi 256)
"precision 512:"
(calc-pi 512)
"precision 1024:"
(calc-pi 1024)
"precision 2048:"
(calc-pi 2048)
"precision 4096:"
(calc-pi 4096)
"precision 8192:"
(calc-pi 8192)
