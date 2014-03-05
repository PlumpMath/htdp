;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; eliminate-exp
;; parameter: ua(number), lotp(list of numbers)
;; to filter values below ua from lotp
(define (eliminate-exp ua lotp)
  (cond ((empty? lotp) empty)
        ((< ua (first lotp)) (eliminate-exp ua (rest lotp)))
        (else (cons (first lotp) (eliminate-exp ua (rest lotp))))))

(eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty)))))
;; should be: (cons .95 (cons 1.0 empty))
