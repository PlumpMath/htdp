;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-5-2) (read-case-sensitive #t) (teachpacks ((lib "graphing.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.rkt" "teachpack" "htdp")))))
(define (line-from-point+slope p slope)
  (local ((define (y x)
            (+ (* slope
                  (- x (posn-x p)))
               (posn-y p))))
    y))


(define (q1 x) (+ x 4))
(graph-line q1 'blue)
(graph-line (line-from-point+slope (make-posn 0 4) 1) 'red)
