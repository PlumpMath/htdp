;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-5-3) (read-case-sensitive #t) (teachpacks ((lib "graphing.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.rkt" "teachpack" "htdp")))))
;; 수학 난해해서 일단 보류

(define (line-from-point+slope p slope)
  (local ((define (y x)
            (+ (* slope
                  (- x (posn-x p)))
               (posn-y p))))
    y))

(define (y x)
  (+ (sqr x)
     (* -4 x)
     7))

(graph-fun y 'red)



