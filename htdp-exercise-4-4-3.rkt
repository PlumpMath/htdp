;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-4-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 2000달러를 사용한 경우 돌려받는 금액
;; 현재 처리금액 | 남은 처리금액 | 현재 환급비율 | 현재 환급금 | 총 환급금
;; 500         | 1500       | .0025       | 1.25      | 1.25
;; 1000        | 500        | .0050       | 5         | 6.25
;; 500         | 0          | .0075       | 3.75      | 10
;; => 10 달러

;; 2600달러를 사용한 경우 돌려받는 금액
;; 현재 처리금액 | 남은 처리금액 | 현재 환급비율 | 현재 환급금 | 총 환급금
;; 500         | 2100       | .0025       | 1.25      | 1.25
;; 1000        | 1100       | .0050       | 5         | 6.25
;; 1000        | 100        | .0075       | 7.5       | 13.75
;; 100         | 0          | .0100       | 1         | 14.75
;; => 14.75 달러

(define (pay-back-rate payment)
  (cond ((<= payment 500) .0025)
        ((<= payment 1500) .0050)
        ((<= payment 2500) .0075)
        (else .0100)))

(define pay-back-rate1 .0025)
(define pay-back-rate2 .0050)
(define pay-back-rate3 .0075)
(define pay-back-rate4 .0100)
(define pay-back-value1 500)
(define pay-back-value2 (+ pay-back-value1 1000))
(define pay-back-value3 (+ pay-back-value2 1000))

(define (pay-back1 payment)
  (* payment pay-back-rate1))

(define (pay-back2 payment)
  (+ (pay-back1 pay-back-value1)
     (* (- payment pay-back-value1) pay-back-rate2)))

(define (pay-back3 payment)
  (+ (pay-back2 pay-back-value2)
     (* (- payment pay-back-value2) pay-back-rate3)))

(define (pay-back4 payment)
  (+ (pay-back3 pay-back-value3)
     (* (- payment pay-back-value3) pay-back-rate4)))

(define (pay-back payment)
  (cond ((<= payment pay-back-value1) (pay-back1 payment))
        ((<= payment pay-back-value2) (pay-back2 payment))
        ((<= payment pay-back-value3) (pay-back3 payment))
        (else (pay-back4 payment))))

;; 재귀를 사용하면 간단하겠지만, 책에서 아직 재귀를 다루지 않았기 때문에 재귀를 사용하지 않았다.
