;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-18-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (local ((define x (* y 3)))
     (* x x))

<지역 정의 좌변>
x
<지역 정의 우변>
(* y 3)
<local 구현부>
(* x x)


2. (local ((define (odd an)
             (cond
               [(zero? an) false]
               [else (even (sub1 an))]))
           (define (even an)
             (cond
               [(zero? an) true]
               [else (odd (sub1 an))])))
     (even a-nat-num))

<지역 정의 좌변>
(odd an)

<지역 정의 우변>
(cond
  [(zero? an) false]
  [else (even (sub1 an))])

<지역 정의 좌변>
(even an)

<지역 정의 우변>
(cond
  [(zero? an) true]
  [else (odd (sub1 an))])

<local 구현부>
(even a-nat-num)


3. (local ((define (f x) (g x (+ x 1)))
           (define (g x y) (f (+ x y))))
     (+ (f 10) (g 10 20)))

<지역 정의 좌변>
(f x)

<지역 정의 우변>
(g x (+ x 1))

<지역 정의 좌변>
(g x y)

<지역 정의 우변>
(f (+ x y))

<local 구현부>
(+ (f 10) (g 10 20))

