;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-3-5) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define balloon-radius 5)
(define rows 10)
(define cols 10)
(define cell-side 30)
(define width (* cols cell-side))
(define height (* rows cell-side))

(define (draw-cols cols)
  (cond ((zero? cols) true)
        (else (and (draw-solid-line (make-posn (* cell-side cols) 0)
                                    (make-posn (* cell-side cols) height)
                                    'black)
                   (draw-cols (sub1 cols))))))

(define (draw-rows rows)
  (cond ((zero? rows) true)
        (else (and (draw-solid-line (make-posn 0 (* cell-side rows))
                                    (make-posn width (* cell-side rows))
                                    'black)
                   (draw-rows (sub1 rows))))))

(define (draw-balloons n)
  (cond ((zero? n) true)
        (else (and (draw-solid-disk (make-posn (random width) (random height))
                                    balloon-radius
                                    'red)
                   (draw-balloons (sub1 n))))))

;; demo
(start width height)
(draw-cols cols)
(draw-rows rows)
(draw-balloons 20)
