;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; maxi : non-empty-lon  ->  number
;; to determine the largest number on alon
(define (maxi alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (cond
            [(> (first alon) (maxi (rest alon))) (first alon)]
            [else (maxi (rest alon))])]))

(define (maxi2 alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else 
     (local ((define rest-max (maxi2 (rest alon))))
       (cond
         [(> (first alon) rest-max) (first alon)]
         [else rest-max]))]))

(define example (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23))
;(maxi example)
(maxi2 example)

;; local을 이용하여 재귀 호출을 확연히 줄임으로써 성능이 향상되었다.
;; maxi는 O(2^n), maxi2는 O(n^2)의 성능인 것 같다.

