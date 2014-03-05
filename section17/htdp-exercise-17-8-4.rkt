;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (contains-same-numbers l1 l2)
  (and (subset? l1 l2)
       (subset? l2 l1)))

#| subset? 보조함수 단순화 전
(define (subset? l1 l2)
  (cond ((and (empty? l1) (empty? l2)) true)
        ((and (empty? l1) (cons? l2)) true)
        ((and (cons? l1) (empty? l2)) false)
        ((and (cons? l1) (cons? l2))
         (and (contains? (first l1) l2)
              (subset? (rest l1) l2)))))
|#

(define (subset? l1 l2)
  (cond ((empty? l1) true)
        ((empty? l2) false)
        (else (and (contains? (first l1) l2)
                   (subset? (rest l1) l2)))))

(define (contains? e l)
  (cond ((empty? l) false)
        ((= e (first l)) true)
        (else (contains? e (rest l)))))


;; examples
(contains-same-numbers empty empty)
(not
 (contains-same-numbers empty (list 1)))
(not
 (contains-same-numbers (list 1) empty))
(contains-same-numbers (list 1) (list 1))
(not
 (contains-same-numbers (list 1) (list 2)))
(contains-same-numbers (list 1 2 3) (list 3 2 1))
(contains-same-numbers (list 1 2 3 4 5 6 7 8 9 10) (list 3 8 2 1 7 6 5 4 9 10))


