;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (make-even n)
  (* 2 n))

(define (make-odd n)
  (add1 (* 2 n)))

(define (series-even n)
  (cond ((= n 0) (make-even n))
        (else (+ (make-even n)
                 (series-even (sub1 n))))))

(define (series n term)
  (cond ((= n 0) (term n))
        (else (+ (term n)
                 (series (sub1 n) term)))))

(define (series-local n term)
  (cond ((= n 0) (term n))
        (else (local ((define series-of-rest
                        (series-local (sub1 n) term)))
                (+ (term n) series-of-rest)))))

(series-even 10)
(series 10 make-even)
(series-local 10 make-even)


;; 증명 생략

