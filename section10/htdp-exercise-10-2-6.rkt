;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-6-pass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

;; extract1 : inventory  ->  inventory
;; to create an inventory from an-inv for all
;; those items that cost less than $1
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(<= (ir-price (first an-inv)) 1.00)
             (cons (first an-inv) (extract1 (rest an-inv)))]
            [else (extract1 (rest an-inv))])]))

(define (extract>1 an-inv)
  (cond
    ((empty? an-inv) empty)
    ((> (ir-price (first an-inv)) 1) (cons (first an-inv) (extract>1 (rest an-inv))))
    (else (extract>1 (rest an-inv)))))

#| inventory1
inventory1은 다음 중 하나다.
1. empty
2. (cons ir1 inv1)
   - ir1: 가격이 1달러 이상인 재고 항목
   - inv1: inventory1
|#

#| extract1
inventory -> inventory1
|#
(define (extract1 an-inv)
  (cond
    ((empty? an-inv) empty)
    ((> (ir-price (first an-inv)) 1) (cons (first an-inv) (extract1 (rest an-inv))))
    (else (extract1 (rest an-inv)))))

;; 데이터 정의가 변경됐지만 함수 구현은 extract>1과 달라진 부분이 없다.
