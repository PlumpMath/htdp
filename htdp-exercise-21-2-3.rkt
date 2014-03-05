;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-21-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct toy (name price))

(define (eliminate-exp ua lot)
  (local ((define (below-than-ua t)
          (< ua (toy-price t))))
    (filter below-than-ua lot)))

(define (recall ty lon)
  (local ((define (not-ty n)
            (not (symbol=? ty n))))
    (filter not-ty lon)))

(define (selection lon1 lon2)
  (local ((define (has? e)
            (local ((define (e? n)
                      (symbol=? e n)))
              (cons? (filter e? lon1)))))
    (filter has? lon2)))


(define toys
  (list (make-toy 'a 10)
        (make-toy 'b 20)
        (make-toy 'c 30)
        (make-toy 'd 110)
        (make-toy 'e 120)
        (make-toy 'f 130)
        (make-toy 'g 210)))
(define toy-names
  (list 'robot
        'r2d2
        'c3po
        'doll
        'rpg
        'rocket))
(define toy-names-2
  (list 'robot
        'r2d2
        'doll
        'trpg
        'rocket
        'car))
(eliminate-exp 100 toys)
(recall 'doll toy-names)
(selection toy-names toy-names-2)


