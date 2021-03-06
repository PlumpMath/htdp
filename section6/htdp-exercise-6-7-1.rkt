;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-7-1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "hangman.rkt" "teachpack" "htdp")))))
(define (draw-next-part part)
  (cond ((symbol=? part 'noose)
         (and (draw-solid-line (make-posn 40 20) (make-posn 134 20) 'black)
              (draw-solid-line (make-posn 40 20) (make-posn 40 400) 'black)
              (draw-circle (make-posn 180 60) 60 'black)
              (draw-solid-line (make-posn 180 40) (make-posn 200 60) 'black)
              (draw-solid-line (make-posn 200 40) (make-posn 180 60) 'black)
              (draw-solid-line (make-posn 220 40) (make-posn 240 60) 'black)
              (draw-solid-line (make-posn 240 40) (make-posn 220 60) 'black)))
        ((symbol=? part 'head)
         (draw-circle (make-posn 180 100) 20 'black))
        ((symbol=? part 'body)
         (draw-solid-line (make-posn 180 120) (make-posn 180 240) 'black))
        ((symbol=? part 'left-arm)
         (draw-solid-line (make-posn 180 150) (make-posn 150 200) 'black))
        ((symbol=? part 'right-arm)
         (draw-solid-line (make-posn 180 150) (make-posn 210 200) 'black))
        ((symbol=? part 'left-leg)
         (draw-solid-line (make-posn 180 240) (make-posn 170 360) 'black))
        ((symbol=? part 'right-leg)
         (draw-solid-line (make-posn 180 240) (make-posn 190 360) 'black))
        (else #true)))

(start 500 500)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'left-arm)
(draw-next-part 'right-arm)
(draw-next-part 'left-leg)
(draw-next-part 'right-leg)
