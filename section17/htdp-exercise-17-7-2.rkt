;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-7-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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



"1. (define (f x) (+ 3 x))"
(make-def 'f 'x (make-add 3 'x))

"2. (define (g x) (* 3 x))"
(make-def 'g 'x (make-mul 3 'x))

"3. (define (h u) (f (* 2 u)))"
(make-def 'h 'u (make-app 'f (make-mul 2 'u)))

"4. (define (i v) (+ (* v v) (* v v)))"
(make-def 'i 'v (make-add (make-mul 'v 'v) (make-mul 'v 'v)))

"5. (define (k w) (* (h w) (i w)))"
(make-def 'k 'w (make-mul (make-app 'h 'w) (make-app 'i 'w)))




