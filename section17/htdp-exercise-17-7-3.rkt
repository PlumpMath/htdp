;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-7-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| scheme-expression is either:
- number
- symbol
- (make-add l r) : l and r are scheme-expressions.
- (make-mul l r) : l and r are scheme-expressions.
- (make-application n exp) : n is a symbol and exp is a scheme-expression.
|#

#| add
'add'는 구조체다.
좌변과 우변의 덧셈을 표현한다.
다음을 구성요소로 한다.
- left(scheme-expressions): 좌변
- right(scheme-expressions): 우변
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
- left(scheme-expressions): 좌변
- right(scheme-expressions): 우변
|#
(define-struct mul (left right))

#| mul 함수 템플릿
;; fun-for-mul
(define (fun-for-mul an-mul)
  ... (mul-left an-mul) ...
  ... (mul-right an-mul) ...)
|#

#| app
'app'은 구조체다.
다음을 구성요소로 한다.
- name(symbol): 함수의 이름
- exp(scheme-expression): 함수의 표현

;; fun-for-app
(define (fun-for-app an-app)
  ... (app-name an-app) ...
  ... (app-parameters an-app) ...)
|#
(define-struct app (name exp))

#| def
'def'는 구조체다.
다음을 구성요소로 한다.
- name(symbol): 바인딩
- arg(symbol): 매개변수 목록
- body(scheme-expression): 정의할 표현
|#
(define-struct def (name arg body))

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
        ((app? exp) (make-app (app-name exp)
                              (subst (app-exp exp) v n)))
        (else exp)))

;; evaluate-with-one-def
(define (evaluate-with-one-def exp P)
  (cond
    ((number? exp) exp)
    ((add? exp) (+ (evaluate-expression (add-left exp))
                   (evaluate-expression (add-right exp))))
    ((mul? exp) (* (evaluate-expression (mul-left exp))
                   (evaluate-expression (mul-right exp))))
    ((app? exp) (cond ((symbol=? (app-name exp) (def-name P))
                       (subst (def-body P)
                              (def-arg P)
                              (evaluate-with-one-def (app-name exp) P)))
                      (else
                       (error 'evaluate-with-one-def "undefined function call"))))
    (else (error 'evaluate-with-one-def "it's not numeric expression"))))






;; EXAMPLES AS TESTS
(subst 1 'x 2)
"should be"
1

(subst 'x 'x 2)
"should be"
2

(subst 'x 'y 2)
"should be"
'x

(subst (make-mul 'x 'y) 'x 2)
"should be"
(make-mul 2 'y)

(subst (make-add 'x 'y) 'x 2)
"should be"
(make-add 2 'y)

(subst (make-app 'f 'x) 'x 2)
"should be"
(make-app 'f 2)

(define f2c-def (make-def 'f2c 'f (make-mul 5/9 (make-add 'f -32))))

(evaluate-with-one-def (make-app 'f2c 32) f2c-def)
"should be"
0

(evaluate-with-one-def (make-app 'f2c 212) f2c-def)
"should be"
100

(evaluate-with-one-def (make-app 'f2c -40) f2c-def)
"should be"
-40

; (evaluate-with-one-def (make-app 'radius 3) f2c-def)
; error!