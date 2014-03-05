;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-3-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (create-prices n)
  (cond ((zero? n) empty)
        ((< 10 (* 0.10 n)) (create-prices 100))
        (else (cons (* 0.10 n)
                    (create-prices (sub1 n))))))

;; 문제를 잘못 이해함. 0.10 ~ 10.00 의 리스트가 아니라, 0.10 ~ 10.00 사이의 랜덤 값의 리스트였음.
