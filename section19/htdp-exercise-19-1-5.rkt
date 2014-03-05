;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-1-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; mini : nelon  ->  number
;; to determine the smallest number
;; on alon
(define (mini alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (cond
            [(< (first alon)
                (mini (rest alon)))
             (first alon)]
            [else
             (mini (rest alon))])]))

;; maxi : nelon  ->  number
;; to determine the largest number
;; on alon
(define (maxi alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (cond
            [(> (first alon)
                (maxi (rest alon)))
             (first alon)]
            [else
             (maxi (rest alon))])]))

(define (most predicate alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (cond
            [(predicate (first alon)
                        (most predicate (rest alon)))
             (first alon)]
            [else
             (most predicate (rest alon))])]))

(define (min1 alon)
  (most < alon))
(define (max1 alon)
  (most > alon))

(define L1 (list 3 7 6 2 9 8))
(define L2 (list 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1))
(define L3 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))

(mini L1)
(min1 L1)
(mini L2)
(min1 L2)
(mini L3)
(min1 L3)

(maxi L1)
(max1 L1)
(maxi L2)
(max1 L2)
(maxi L3)
(max1 L3)


;; 이것들이 길이가 긴 리스트를 다룰 때 느린 이유는 조건절에서 자신을 2번씩 재귀 호출함으로써 리스트의 길이에 따라 연산 비용이 O(2^n)으로 증가하기 때문이다.

;; local 사용 버전
(define (cached-most predicate alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (local ((define most-so-far (most predicate (rest alon)))
                  (define (more a b)
                    (cond [(predicate a b) a]
                          [else b])))
            (more (first alon) most-so-far))]))

(define (cached-min1 alon)
  (cached-most < alon))
(define (cached-max1 alon)
  (cached-most > alon))

(cached-min1 L1)
(cached-min1 L2)
(cached-min1 L3)

(cached-max1 L1)
(cached-max1 L2)
(cached-max1 L3)

