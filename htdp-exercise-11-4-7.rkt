;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-4-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (is-not-divisible-by<=i i m)
  (cond ((= i 1) true)
        ((zero? (remainder m i)) false)
        (else (is-not-divisible-by<=i (sub1 i) m))))

(define (prime? n)
  (and (not (= n 1))
       (is-not-divisible-by<=i (sub1 n) n)))


;; EXAMPLES AS TESTS
(is-not-divisible-by<=i 5 35) "should be" false
(is-not-divisible-by<=i 4 35) "should be" true

(prime? 1) "should be" false
(prime? 2) "should be" true
(prime? 3) "should be" true
(prime? 4) "should be" false