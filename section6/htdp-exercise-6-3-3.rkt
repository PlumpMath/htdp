;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct fighter (model acceration max-speed range))

(define (within-range a-fighter target-distance)
  (< target-distance (fighter-range a-fighter)))

(define (reduce-range a-fighter)
  (make-fighter (fighter-model a-fighter)
                (fighter-acceration a-fighter)
                (fighter-max-speed a-fighter)
                (* .8 (fighter-range a-fighter))))
