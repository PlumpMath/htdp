;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-6-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#|
처음 짠 비효율적인 방법

;; merge
;; 오름차순으로 정렬된 두 개의 수 리스트를 입력받아,
;; 두 리스트에 들어 있는 모든 수를 갖는 하나의 정렬된 리스트
;; 중복된 수는 중복되어 포함됨.
(define (merge l1 l2)
  (cond ((and (cons? l1) (cons? l2)) (insert2 (merge (rest l1) (rest l2))
                                              (first l1)
                                              (first l2)))
        ((cons? l2) (insert1 (merge empty (rest l2))
                             (first l2)))
        ((cons? l1) (insert1 (merge empty (rest l1))
                             (first l1)))
        (else empty)))

(define (smaller a b)
  (cond ((< a b) a)
        (else b)))

(define (bigger a b)
  (cond ((> a b) a)
        (else b)))

(define (insert1 l e)
  (cond ((empty? l) (list e))
        ((< e (first l)) (cons e l))
        (else (cons (first l) (insert1 (rest l) e)))))

(define (insert2 l e1 e2)
  (cond ((empty? l) (list (smaller e1 e2) (bigger e1 e2)))
        ((< (smaller e1 e2) (first l) ) (insert1 (cons (smaller e1 e2) l) (bigger e1 e2)))
        (else (cons (first l) (insert2 (rest l) e1 e2)))))
|#


;; merge
;; 오름차순으로 정렬된 두 개의 수 리스트를 입력받아,
;; 두 리스트에 들어 있는 모든 수를 갖는 하나의 정렬된 리스트
;; 중복된 수는 중복되어 포함됨.
(define (merge l1 l2)
  (cond ((and (cons? l1) (cons? l2))
         (cond ((< (first l1) (first l2))
                (cons (first l1) (merge (rest l1) l2)))
               (else
                (cons (first l2) (merge l1 (rest l2))))))
        ((cons? l2) l2)
        ((cons? l1) l1)
        (else empty)))

(define (smaller a b)
  (cond ((< a b) a)
        (else b)))

(define (bigger a b)
  (cond ((> a b) a)
        (else b)))

;; examples
(merge empty empty)
"should"
empty

(merge (list 1) empty)
"should"
(list 1)

(merge empty (list 0))
"should"
(list 0)

(merge (list 1) (list 0))
"should"
(list 0 1)

(merge (list 1 3 5 7 9) (list 2))
"should"
(list 1 2 3 5 7 9)

(merge (list 1) (list 0 2 4 6 8))
"should"
(list 0 1 2 4 6 8)

(merge (list 1 3 5 7 9) (list 0 2 4 6 8))
"should"
(list 0 1 2 3 4 5 6 7 8 9)

(merge (list 1 3 5 7 9) (list 10 12 14 16 18))
"should"
(list 1 3 5 7 9 10 12 14 16 18)

(merge (list 11 13 15 17 19) (list 0 2 4 6 8))
"should"
(list 0 2 4 6 8 11 13 15 17 19)
