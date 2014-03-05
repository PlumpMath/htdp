;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-2-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (arithmetic-series start s)
  (local ((define (series n)
            (cond ((= n 0) (+ start s))
                  (else (+ (series (sub1 n))
                           s)))))
    series))

(define (a-fives n)
  (cond ((= n 0) (+ 3 5))
        (else (+ (a-fives (sub1 n))
                 5))))

(build-list 10 a-fives)
(build-list 10 (arithmetic-series 3 5))
(build-list 10 (arithmetic-series 0 2))

;; 무한 등차수열의 합은 존재하지 않는다. (발산한다.)
