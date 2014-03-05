;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-18-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (local ((define x 10)
           (y (+ x x)))
     y)
local의 정의부에 <def>가 아닌 것이 들어있음.
만일 y를 (+ x x)로 정의하고 싶다면 (define y (+ x x)) 표현으로 수정해야 함.


2. (local ((define (f x) (+ (* x x) (* 3 x) 15))
           (define x 100)
           (define f@100 (f x)))
     f@100 x)
local의 구현부에 두 개의 표현이 들어있음.


3. (local ((define (f x) (+ (* x x) (* 3 x) 14))
           (define x 100)
           (define f (f x)))
     f)
local의 정의부에 f가 중복 정의되었음.



