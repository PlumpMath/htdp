;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-6-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| 계수(c)
계수는 수다.
|#

#| 계수 리스트(cs)
계수 리스트는 다음 중 하나다.
1. empty
2. (cons c cs)
   - c: 계수
   - cs: 계수 리스트
|#

#| 변수의 값(v)
변수의 값은 수다.
|#

#| 변수의 값 리스트(vs)
변수의 값 리스트는 다음 중 하나다.
1. empty
2. (cons v vs)
   - v: 변수의 값
   - vs: 변수의 값 리스트
|#

(define (value cs vs)
  (cond ((empty? cs) 0)
        (else (+ (* (first cs) (first vs))
                 (value (rest cs) (rest vs))))))


;Examples as Tests:
(check-expect
 (value (list 7)
        (list 8))
 56)

(check-expect
 (value (list 7 12)
        (list 8 3))
 92)

(check-expect
 (value (list 7 12 8)
        (list 8 3 9))
 164)

