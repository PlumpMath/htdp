;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; how-many-symbols
;; counts symbols in list-of-symbols
;; los -> list-of-symbols
(define (how-many-symbols los)
  (cond ((empty? los) 0)
        (else (cond ((symbol? (first los)) (+ 1 (how-many-symbols (rest los))))
                    (else (+ 0 (how-many-symbols (rest los))))))))

;examples
(= (how-many-symbols empty)
   0)
(= (how-many-symbols (cons 'a empty))
   1)
(= (how-many-symbols (cons 'd (cons 'c (cons 'b (cons 'a empty)))))
   4)
(= (how-many-symbols (cons 'd (cons 3 (cons 2 (cons 'a empty)))))
   2)


