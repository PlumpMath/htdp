;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define x (cons 1 x))
;                 ^
밑줄 친 x는 전역적 영역의 x에 바인딩된다.
그러나 x의 우변의 값은 정의되지 않았다.

그런데, 함수 정의에서 재귀 호출은 어떻게 봐야 할까?

