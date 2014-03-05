;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-3-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define my-sin-precision 200)
;; 정밀도를 낮게 잡으면 계산 결과가 부정확해짐 (특히 x의 값이 클 경우)

(define (series n term)
  (cond ((= n 0) (term n))
        (else (+ (term n)
                 (series (sub1 n) term)))))

(define (! n)
  (cond ((= n 0) 1)
        (else (* n (! (sub1 n))))))

(define (my-sin-term-of-x x)
  (local ((define (my-sin-term-of-x i)
            (local ((define order (+ (* 2 i) 1))
                    (define numerator (expt x order))
                    (define denominator (! order))
                    (define unsigned (/ numerator denominator)))
              (cond ((even? i) unsigned)
                    ((odd? i) (- unsigned))))))
    my-sin-term-of-x))

(define (my-sin x)
  (series my-sin-precision (my-sin-term-of-x x)))

"sin(0)"
(sin 0)
(my-sin 0)
"sin(20)"
(sin 20)
(my-sin 20)
"sin(45)"
(sin 45)
(my-sin 45)
"sin(90)"
(sin 90)
(my-sin 90)
"sin(180)"
(sin 180)
(my-sin 180)
"sin(360)"
(sin 360)
(my-sin 360)
