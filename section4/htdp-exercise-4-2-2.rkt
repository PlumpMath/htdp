;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Contract: number->boolean
;; Purpose: x 가 -3 초과하면서 0 미만임을 검사한다.
(define (in-interval-1? x)
  (and (< -3 x) (< x 0)))
;; 수직선으로 나타낸 범위:
;;      (-----)
;; -5 . . . . 0 . . . . 5 . . . . 10

;; Contract: number->boolean
;; Purpose: x 가 1 미만이거나 2 초과함을 검사한다.
(define (in-interval-2? x)
  (or (< x 1) (> x 2)))
;; 수직선으로 나타낸 범위:
;; -------------) (-----------------
;; -5 . . . . 0 . . . . 5 . . . . 10

;; Contract: number->boolean
;; Purpose: x 가 1 이상이면서 5 이하인 값이 아님을 검사한다.
(define (in-interval-3? x)
  (not (and (<= 1 x) (<= x 5))))
;; 수직선으로 나타낸 범위:
;; -------------)       (-----------
;; -5 . . . . 0 . . . . 5 . . . . 10

(in-interval-1? -2) ; true
(in-interval-2? -2) ; true
(in-interval-3? -2) ; true

