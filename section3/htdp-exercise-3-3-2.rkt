;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-3-3-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (square x)
  (* x x))

(define (area-of-disk radius)
  (* pi (square radius)))

(define (volume-cylinder bottom-radius height)
  (* height (area-of-disk bottom-radius)))
