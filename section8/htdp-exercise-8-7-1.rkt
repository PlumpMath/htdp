;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-8-7-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
구조체의 정의 문법: (define-struct <var-0> (<var-1> ... <var-n>))

1. (define-struct personnel-record (name salary dob ssn))
(define-struct <var> (<var> <var> <var> <var>))
올바른 구조체 정의다.

2. (define-struct oops ())
(define-struct <var> ())
잘못된 구조체 정의다. 구조체 구성 요소에 해당하는 <var>가 최소한 하나 이상 있어야 한다.
--> 틀림. 올바른 구조체 정의다. 구조체 구성 요소가 없어도 유효한 정의다.

3. (define-struct child (dob date (- date dob)))
(define-struct <var> (<var> <var> <exp>))
잘못된 구조체 정의다. 구조체 구성 요소에는 <var>만 사용할 수 있다.

4. (define-struct (child person) (dob date))
(define-struct <exp> (<var> <var>))
잘못된 구조체 정의다. 구조체 이름은 <var> 이어야 한다.

5. (define-struct child (parents dob date))
(define-struct <var> (<var> <var> <var>))
올바른 구조체 정의다.

