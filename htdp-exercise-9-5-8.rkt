;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-8) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (draw-circles p rad-l)
  (cond ((empty? rad-l) true)
        (else (and (draw-circle p (first rad-l) 'black)
                   (draw-circles p (rest rad-l))))))

(start 300 300)
(draw-circles (make-posn 150 150) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 (cons 60 (cons 70 (cons 100 empty)))))))))

