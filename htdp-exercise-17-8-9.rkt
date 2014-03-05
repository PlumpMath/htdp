;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| Slist
Slist는 다음 두 가지 중 하나다.
1. empty
2. (cons s sl)
   s: Sexpr
   sl: Slist
|#

#| Sexpr
Sexpr는 다음 네 가지 중 하나다.
1. number
2. boolean
3. symbol
4. Slist
|#

(define (Slist=? l1 l2)
  (or (and (empty? l1)
           (empty? l2))
      (and (cons? l1)
           (cons? l2)
           (Sexpr=? (first l1) (first l2))
           (Slist=? (rest l1) (rest l2)))))

(define (Sexpr=? e1 e2)
  (or (and (number? e1)
           (number? e2)
           (= e1 e2))
      (and (boolean? e1)
           (boolean? e2)
           (boolean=? e1 e2))
      (and (symbol? e1)
           (symbol? e2)
           (symbol=? e1 e2))
      (and (empty? e1)
           (empty? e2))
      (and (cons? e1)
           (cons? e2)
           (Slist=? e1 e2))))

;Examples as Tests:
(check-expect
 (Slist=?
  empty
  empty)
 true)

(check-expect
 (Slist=?
  empty
  (list 'w 6 6 false))
 false)

(check-expect
 (Slist=?
  (list 'w 6 6 false)
  empty)
 false)

(check-expect
 (Slist=?
  (list 'w 6 6 false)
  (list 'w 6 6 false))
 true)

(check-expect
 (Slist=?
  (list 'w 6 6 false)
  (list 'w 6 false))
 false)

(check-expect
 (Slist=?
  (list 'w 6 6 false (list true 'a 7 'b))
  (list 'w 6 6 false (list true 'a 7 'b)))
 true)

(check-expect
 (Slist=?
  (list 'w 6 6 false (list true 'a 7 'b))
  (list 'w 6 (list true 'a 7 'b) 6 false ))
 false)

(check-expect
 (Slist=?
  (list 'w (list 5) 6 false)
  (list 'w (list 5) 6 false))
 true)

(check-expect
 (Sexpr=? 5 5)
 true)

(check-expect
 (Sexpr=? 5 8)
 false)

(check-expect
 (Sexpr=? 5 true)
 false)

(check-expect
 (Sexpr=? 5 'hello)
 false)

(check-expect
 (Sexpr=? false false)
 true)

(check-expect
 (Sexpr=? false 8)
 false)

(check-expect
 (Sexpr=? false 'hello)
 false)

(check-expect
 (Sexpr=? false 8)
 false)

(check-expect
 (Sexpr=? 'hello 'hello)
 true)

(check-expect
 (Sexpr=? 'hello 8)
 false)

(check-expect
 (Sexpr=? 'hello true)
 false)

(check-expect
 (Sexpr=? 'hello 'goodbye)
 false)

(check-expect
 (Sexpr=? empty
          empty)
 true)

(check-expect
 (Sexpr=? (list 6 'bye true)
          (list 6 'bye true))
 true)

(check-expect
 (Sexpr=? (list 6 'bye true)
          (list true 7 'bye))
 false)

(check-expect
 (Sexpr=? (list 6 'bye true)
          9)
 false)

(check-expect
 (Sexpr=? (list 6 'bye true)
          true)
 false)

(check-expect
 (Sexpr=? (list 6 'bye true)
          'bye)
 false)


(check-expect
 (Sexpr=? (list 6 'bye (list 5 6) true)
          (list 6 'bye (list 5 6) true))
 true)