;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-6-5-pass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 연습문제 12-4-2 의 arrangement부터 해결한 후 다시 시도하기로 함


#| 이름 리스트(ns)
이름 리스트는 다음 중 하나다.
1. empty
2. (cons s ns)
   1. s는 기호
   2. ns는 이름 리스트
|#

#| gift-pick
ns -> ns
|#
(define (gift-pick ns)
  ...)
