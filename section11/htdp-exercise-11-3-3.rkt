;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; random-n-m : integer integer  ->  integer
;; returns a numeric value which is
;; (and (n <= value)
;;      (value < m))
;; |---[--value--)---|
;;     n         m
;; Assume: n < m
(define (random-n-m n m)
  (+ (random (- m n)) n))

;; create-temps
(define (create-temps n low high)
  (cond ((zero? n) empty)
        (else (cons (random-n-m low high)
                    (create-temps (sub1 n) low high)))))

;; check-range?
(define (check-range? l min max)
  (cond ((empty? l) true)
        ((and (<= min (first l))
              (< (first l) max))
         (check-range? (rest l) min max))
        (else false)))

(check-range? (create-temps 100 20 30) 20 30)

;; create-temps의 결과를 모르더라도 check-range? 의 검사에 적용할 수 있다.
;; create-temps의 결과를 모르더라도 결과를 예측할 수 있는 low와 high의 값이 존재한다.
;; check-range? 함수가 create-temps의 결과를 테스트한다.
;; 자동으로 생성된 데이터를 이용해 다양한 범위의 값을 검사함으로써 실행시간 오류와 논리적 오류를 잡아낼 수 있는 가능성이 있다.
;; 그러나 오류 범위에 해당하지 않는 값이 랜덤으로 생성되는 경우도 있으므로 테스트 결과가 함수의 무결성을 보증하지는 않는다.

;; ==> 틀렸음. 정답 확인: http://htdp.org/2003-09-26/Solutions/random2.html

