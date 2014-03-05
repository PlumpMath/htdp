;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-18-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (define A-CONSTANT
     (not 
      (local ((define (odd an)
                (cond
                  [(= an 0) false]
                  [else (even (- an 1))]))
              (define (even an)
                (cond
                  [(= an 0) true]
                  [else (odd (- an 1))])))
        (even a-nat-num))))
올바르지 않다.
- 정의하지 않은 a-nat-num을 참조하고 있기 때문이다.


2. (+ (local ((define (f x) (+ (* x x) (* 3 x) 15))
              (define x 100)
              (define f@100 (f x)))
        f@100)
      1000)
올바르다.
- (+ <exp> <exp>)는 올바른 <exp>이다.
- (local (<def-1> <def-2> <def-3>) <exp>) 표현 역시 올바르며, 정의한 f@100을 구현부에서 올바르게 참조하고 있다.


3. (local ((define CONST 100)
           (define f x (+ x CONST)))
     (define (g x y z) (f (+ x (* y z)))))

올바르지 않다.
- local 정의부의 (define f x (+ x CONST)) 에서 define에 세 개의 인자가 전달되었으므로 올바른 <def>가 아니다.
- local 구현부에 <exp>가 아닌 <def>가 삽입되었다.

