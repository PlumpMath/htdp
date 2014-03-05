;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-4-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 형식: (how-many number number number) -> number
;; 목적: 이차방정식 (ax^2+bx+c=0)에 해당하는 계수 a, b, c 를 입력받아
;; 이차방정식의 해가 몇 개인지 계산하여 반환한다.
;; 올바른 이차방정식이 아닌 경우에는 0을 반환한다.
;; 테스트:
;; (how-many 2 4 2) -> 1
;; (how-many 1 0 -1) -> 2
(define (how-many a b c)
  (cond ((= a 0) 0) ; 올바른 이차방정식이 아닌 경우
        ((> (* b b) (* 4 a c)) 2)
        ((= (* b b) (* 4 a c)) 1)
        ((< (* b b) (* 4 a c)) 0)))
