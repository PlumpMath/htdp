;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (quadric-roots a b c)
  (cond ((= a 0) 'degenerate)
        ((< (* b b) (* 4 a c)) 'none)
        ((= (* b b) (* 4 a c)) (quadric-roots-1 a b c))
        ((> (* b b) (* 4 a c)) (cons (quadric-roots-2-1 a b c)
                                     (cons (quadric-roots-2-2 a b c)
                                           empty)))))

;; 해가 하나인 이차방정식의 해
(define (quadric-roots-1 a b c)
  (/ (- b)
     (* 2 a)))

;; 해가 둘인 이차방정식의 첫번째 해
(define (quadric-roots-2-1 a b c)
  (/ (+ (- b)
        (sqrt (- (sqr b)
                 (* 4 a c))))
     (* 2 a)))

;; 해가 둘인 이차방정식의 두번째 해
(define (quadric-roots-2-2 a b c)
  (/ (- (- b)
        (sqrt (- (sqr b)
                 (* 4 a c))))
     (* 2 a)))

(quadric-roots 1 0 -1)
(quadric-roots 2 4 2)
(quadric-roots 0 4 2)
