;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-7-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
- exp(scheme-expressions): 함수의 표현

;; fun-for-app
(define (fun-for-app an-app)
  ... (app-name an-app) ...
  ... (app-parameters an-app) ...)
|#
(define-struct app (name exp))

