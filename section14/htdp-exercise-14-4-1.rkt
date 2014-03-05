;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-14-4-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

"1. (+ 10 -10)"
(make-add 10 -10)

"2. (+ (* 20 3) 33)"
(make-add (make-mul 20 3) 33)

"3. (* 3.14 (* r r))"
(make-mul 3.14 (make-mul r r))

"4. (+ (* 9/5 c) 32)"
(make-add (make-mul 9/5 c) 32)

"5. (+ (* 3.14 (* o o)) (* 3.14 (* i i)))"
(make-add (make-mul 3.14 (make-mul o o)) (make-mul 3.14 (make-mul i i)))

