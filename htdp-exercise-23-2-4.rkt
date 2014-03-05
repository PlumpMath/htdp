;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (series n term)
  (cond ((= n 0) (term n))
        (else (+ (term n)
                 (series (sub1 n) term)))))

(define (a-fives n)
  (cond ((= n 0) (+ 3 5))
        (else (+ (a-fives (sub1 n))
                 5))))

(define (a-fives-closed n)
  (+ 3 (* 5 (add1 n))))

(define (seq-a-fives n)
  (build-list n a-fives-closed))

(seq-a-fives 1)
(seq-a-fives 2)
(seq-a-fives 3)
(seq-a-fives 4)
(seq-a-fives 5)



;; 무한 등차수열의 합은 존재하지 않는다. (발산한다.)
