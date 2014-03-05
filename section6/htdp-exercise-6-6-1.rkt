;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-6-1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; circle: structure (center: posn / radius: number / color: symbol)
(define-struct circle (center radius color))

;; circle-template
(define (fun-for-circle a-circle)
  ... (circle-center a-circle) ...
  ... (circle-radius a-circle) ...
  ... (circle-color a-circle) ...)
