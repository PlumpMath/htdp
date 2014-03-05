;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-14-4-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| scheme-expression is either:
- number
- symbol
- (make-add l r) : l and r are scheme-expressions.
- (make-mul l r) : l and r are scheme-expressions.
|#

#| add
'add'는 구조체다.
좌변과 우변의 덧셈을 표현한다.
다음을 구성요소로 한다.
- left(수): 좌변
- right(수): 우변
|#
(define-struct add (left right))

#| add 함수 템플릿
;; fun-for-add
(define (fun-for-add an-add)
  ... (add-left an-add) ...
  ... (add-right an-add) ...)
|#

#| mul
'mul'은 구조체다.
좌변과 우변의 곱셈을 표현한다.
다음을 구성요소로 한다.
- left(수): 좌변
- right(수): 우변
|#
(define-struct mul (left right))

#| mul 함수 템플릿
;; fun-for-mul
(define (fun-for-mul an-mul)
  ... (mul-left an-mul) ...
  ... (mul-right an-mul) ...)
|#

;; numeric
(define (numeric? exp)
  (cond
    ((number? exp) true)
    ((symbol? exp) false)
    ((add? exp) (and (numeric? (add-left exp))
                     (numeric? (add-right exp))))
    ((mul? exp) (and (numeric? (mul-left exp))
                     (numeric? (mul-right exp))))
    (else false)))

;; numeric-expression is either:
;; 1. number
;; 2. (make-add numeric-expression numeric-expression)
;; 3. (make-mul numeric-expression numeric-expression)

(define (evaluate-expression exp)
  (cond
    ((number? exp) exp)
    ((add? exp) (+ (evaluate-expression (add-left exp))
                   (evaluate-expression (add-right exp))))
    ((mul? exp) (* (evaluate-expression (mul-left exp))
                   (evaluate-expression (mul-right exp))))
    (else (error 'evaluate-expression "it's not numeric expression"))))

;; subst
(define (subst v n exp)
  (cond ((symbol? exp) (cond ((symbol=? exp v) n)
                             (else exp)))
        ((number? exp) exp)
        ((add? exp) (make-add (subst v n (add-left exp))
                              (subst v n (add-right exp))))
        ((mul? exp) (make-mul (subst v n (mul-left exp))
                              (subst v n (mul-right exp))))
        (else exp)))



;; EXAMPLES AS TESTS
(subst 'x 2 1)
"should be"
1

(subst 'x 2 'x)
"should be"
2

(subst 'y 2 'x)
"should be"
'x

(subst 'x 2 (make-mul 'x 'y))
"should be"
(make-mul 2 'y)


(subst 'x 2 (make-add 'x 'y))
"should be"
(make-add 2 'y)
