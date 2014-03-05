;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-5-pass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 5번 문제 다시 풀어보아야 할 듯



"1."
(local ((define (x y) (* 3 y)))
  (* (x 2) 5))
(define (x y) (* 3 y))
(* (x 2) 5)
(* (* 3 2) 5)
(* 6 5)
30

"2."
(local ((define (f c) (+ (* 9/5 c) 32)))
  (- (f 0) (f 10)))
(define (f c) (+ (* 9/5 c) 32))
(- (f 0) (f 10))
(- (+ (* 9/5 0) 32) (+ (* 9/5 10) 32))
(- 32 50)
-18

"3."
(local ((define (odd? n)
          (cond
            [(zero? n) false]
            [else (even? (sub1 n))]))
        (define (even? n)
          (cond
            [(zero? n) true]
            [else (odd? (sub1 n))])))
  (even? 1))
(define (odd? n)
  (cond
    [(zero? n) false]
    [else (even? (sub1 n))]))
(define (even? n)
  (cond
    [(zero? n) true]
    [else (odd? (sub1 n))]))
(even? 1)
(cond
  [(zero? 1) true]
  [else (odd? (sub1 1))])
(cond
  [false true]
  [else (odd? (sub1 1))])
(cond
  [else (odd? (sub1 1))])
(odd? (sub1 1))
(odd? 0)
(cond
  [(zero? 0) false]
  [else (even? (sub1 0))])
(cond
  [true false]
  [else (even? (sub1 0))])
false

"4."
(+ (local ((define (f x) (g (+ x 1) 22))
           (define (g x y) (+ x y)))
     (f 10))
   555)
(define (f1 x) (g (+ x 1) 22))
(define (g x y) (+ x y))
(+ (f1 10) 555)
(+ (g (+ 10 1) 22) 555)
(+ (g 11 22) 555)
(+ (+ 11 22) 555)
(+ 33 555)
588

"5."
(define (h n) 
  (cond
    [(= n 0) empty]
    [else (local ((define r (* n n)))
            (cons r (h (- n 1))))]))
(h 2)
(define n1 ...)
(define r (* n1 n1))
(define (h1 n)
  (cond
    [(= n 0) empty]
    [else (cons r (h1 (- n 1)))]))
(h 2)
(cond
    [(= 2 0) empty]
    [else (cons r (h (- 2 1)))])
(cond
    [(= 2 0) empty]
    [else (cons (* 2 2) (h (- 2 1)))])
(cond
    [(= 2 0) empty]
    [else (cons 4 (h (- 2 1)))])
(cond
    [false empty]
    [else (cons 4 (h (- 2 1)))])
(cond
    [else (cons 4 (h (- 2 1)))])
(cons 4 (h (- 2 1)))
(cons 4 (h 1))
(cons 4 (cond
          [(= 1 0) empty]
          [else (cons r (h (- 1 1)))]))
(cons 4 (cond
          [(= 1 0) empty]
          [else (cons (* 1 1) (h (- 1 1)))]))
(cons 4 (cond
          [(= 1 0) empty]
          [else (cons 1 (h (- 1 1)))]))
(cons 4 (cond
          [false empty]
          [else (cons 1 (h (- 1 1)))]))
(cons 4 (cond
          [else (cons 1 (h (- 1 1)))]))
(cons 4 (cons 1 (h (- 1 1))))
(cons 4 (cons 1 (h 0)))
(cons 4 (cons 1 (cond
                  [(= 0 0) empty]
                  [else (local ((define r (* n n)))
                          (cons r (h (- 0 1))))])))
(cons 4 (cons 1 (cond
                  [true empty]
                  [else (local ((define r (* n n)))
                          (cons r (h (- 0 1))))])))
(cons 4 (cons 1 empty))
(cons 4 (cons 1 empty))
