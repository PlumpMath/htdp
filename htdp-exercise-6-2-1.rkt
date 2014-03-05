;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-2-1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(start 300 300)
(draw-solid-line (make-posn 10 10) (make-posn 110 10) 'red)
(draw-solid-rect (make-posn 10 30) 100 50 'blue)
(draw-circle (make-posn 110 30) 30 'yellow)
(draw-solid-disk (make-posn 10 80) 50 'green)
(stop)
