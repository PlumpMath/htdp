;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| atom
원자는 다음 중 하나다.
1. number
2. boolean
3. symbol
|#

#| list-equal?
list-of-atom list-of-atom -> boolean
두 원자 리스트가 동일한지 검사
|#
(define (list-equal? l1 l2)
  (and (subset? l1 l2)
       (subset? l2 l1)))

(define (subset? l1 l2)
  (cond ((empty? l1) true)
        ((empty? l2) false)
        (else (and (contains? (first l1) l2)
                   (subset? (rest l1) l2)))))

(define (contains? e l)
  (cond ((empty? l) false)
        ((atom=? e (first l)) true)
        (else (contains? e (rest l)))))

(define (atom=? a1 a2)
  (or (and (number? a1) (number? a2) (= a1 a2))
      (and (symbol? a1) (symbol? a2) (symbol=? a1 a2))
      (and (boolean? a1) (boolean? a2) (boolean=? a1 a2))))

;Examples as Tests:
(check-expect
 (atom=? 5 5)
 true)

(check-expect
 (atom=? 5 7)
 false)

(check-expect
 (atom=? 5 true)
 false)

(check-expect
 (atom=? 5 'a)
 false)

(check-expect
 (atom=? true true)
 true)

(check-expect
 (atom=? true false)
 false)

(check-expect
 (atom=? true 5)
 false)

(check-expect
 (atom=? true 'a)
 false)

(check-expect
 (atom=? 'w 'w)
 true)

(check-expect
 (atom=? 'w 's)
 false)

(check-expect
 (atom=? 'w 5)
 false)

(check-expect
 (atom=? 'w false)
 false)

