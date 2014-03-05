;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (list=? l1 l2)
  (cond ((and (empty? l1) (empty? l2)) true)
        ((or (empty? l1) (empty? l2)) false)
        (else (and (= (first l1) (first l2))
                   (list=? (rest l1) (rest l2))))))

;; examples

(list=? empty empty)
(not
 (list=? empty (cons 1 empty)))
(not
 (list=? (cons 1 empty) empty))
(list=? (cons 1 (cons 2 (cons 3 empty)))
        (cons 1 (cons 2 (cons 3 empty))))
(not
 (list=? (cons 1 (cons 2 (cons 3 empty)))
         (cons 1 (cons 3 empty))))

