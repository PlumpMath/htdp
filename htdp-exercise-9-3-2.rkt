;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-3-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (contains-doll? a-list-of-symbols)
  (cond ((empty? a-list-of-symbols) false)
        (else (or (symbol=? (first a-list-of-symbols) 'doll)
                  (contains-doll? (rest a-list-of-symbols))))))

;; examples
(boolean=? (contains-doll? empty)
           false)
(boolean=? (contains-doll? (cons 'ball empty))
           false)
(boolean=? (contains-doll? (cons 'doll empty))
           true)
(boolean=? (contains-doll? (cons 'bow (cons 'ax (cons 'ball empty))))
           false)
(boolean=? (contains-doll? (cons 'arrow (cons 'doll (cons 'ball empty))))
           true)
(boolean=? (contains-doll? (cons 'arrow (cons 'doll empty)))
           true)
(boolean=? (contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty))))
           false)
