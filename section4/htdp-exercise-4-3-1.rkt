;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; cond-expression-1
(cond
  [(< n 10) 20]
  [(> n 20) 0]
  [else 1])

;; cond-expression-2
(cond
  [(< n 10) 20]
  [(and (> n 20) (<= n 30))]
  [else 1])

;; cond-expression-3
(cond [(< n 10) 20]
      [* 10 n]
      [else 555]);

;; cond-expression-1은 올바르다.
;; cond-expression-2는 올바르지 않다. 2번째 조건에 대응하는 반환값이 정의되지 않았기 때문이다.
;; cond-expression-3은 올바르지 않다. 2번째 조건에서 조건과 반환값 외에 세 번째 값(n)이 지정되었기 때문이다.
