;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-5-1-3) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")))))
(define (combine a b c)
  (+ a
     (* 10 b)
     (* 100 c)))

(define (check-guess3 a b c target)
  (cond ((= (combine a b c) target) 'Perfect)
        ((< (combine a b c) target) 'TooSmall)
        ((> (combine a b c) target) 'TooLarge)))

(guess-with-gui-3 check-guess3)
