;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (recall ty lon)
  (cond ((empty? lon) empty)
        ((symbol=? (first lon) ty) (recall ty (rest lon)))
        (else (cons (first lon) (recall ty (rest lon))))))

(recall 'robot (cons 'robot (cons 'doll (cons 'dress (cons 'robot (cons 'robot empty))))))
