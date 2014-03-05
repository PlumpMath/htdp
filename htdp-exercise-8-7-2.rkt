;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-7-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (make-point 1 2 3)
구조체 값이다.

2. (make-point (make-point 1 2 3) 4 5)
구조체를 포함한 구조체 값이다.

3. (make-point (+ 1 2) 3 4)
표현식이다.
표현식 내에 구조체 값을 포함하고 있으며, 표현식을 전개하면 구조체 값이 된다.
그러나 그 자체는 값이 아니다.
