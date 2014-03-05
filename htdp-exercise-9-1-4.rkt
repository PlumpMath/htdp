;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-1-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; l2: a list consists of 2 elements.
;; (cons e2 (cons e1 empty))

;; template
;; (first l2)
;; (rest (first l2))

(define (contains-2-doll? l2)
  (or (symbol=? 'doll (first l2))
      (symbol=? 'doll (first (rest l2)))))

(contains-2-doll? (cons 'doll (cons 'rocket empty)))
(contains-2-doll? (cons 'candy (cons 'doll empty)))
(not (contains-2-doll? (cons 'candy (cons 'rocket empty))))

