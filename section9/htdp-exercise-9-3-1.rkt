;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; contains-doll? : list-of-symbols->boolean
;; 'doll 기호가 a-list-of-symbols에 들어 있는지 판단한다.
;; 프로토타입
; (define (contains-doll? a-list-of-symbols) ...)


;; 구현
(define (contains-doll? a-list-of-symbols)
  (cond ((empty? a-list-of-symbols) false)
        ((symbol=? (first a-list-of-symbols) 'doll) true)
        (else (contains-doll? (rest a-list-of-symbols)))))

;; contains-doll?의 목적에 따른 예들
;; empty의 경우
(boolean=? (contains-doll? empty)
           false)

;; 하나의 데이터가 들어 있는 리스트 ('doll이 있는 경우와 없는 경우)
(boolean=? (contains-doll? (cons 'ball empty))
           false)
(boolean=? (contains-doll? (cons 'doll empty))
           true)

;; 여러 데이터가 들어 있는 리스트
(boolean=? (contains-doll? (cons 'bow (cons 'ax (cons 'ball empty))))
           false)
(boolean=? (contains-doll? (cons 'arrow (cons 'doll (cons 'ball empty))))
           true)

;; 연습문제
(boolean=? (contains-doll? empty)
           false)
(boolean=? (contains-doll? (cons 'ball empty))
           false)
(boolean=? (contains-doll? (cons 'arrow (cons 'doll empty)))
           true)
(boolean=? (contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty))))
           false)
