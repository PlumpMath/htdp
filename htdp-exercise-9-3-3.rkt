;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (contains? s l)
  (cond ((empty? l) false)
        (else (cond ((symbol=? 's (first l)) true)
                    (else (contains? s (rest l)))))))

;; examples
(boolean=? (contains? 's empty)
           false)
(boolean=? (contains? 's (cons 'a empty))
           false)
(boolean=? (contains? 's (cons 's empty))
           true)
(boolean=? (contains? 's (cons 'a (cons 'b (cons 'c empty))))
           false)
(boolean=? (contains? 's (cons 'a (cons 's (cons 'c empty))))
           true)

