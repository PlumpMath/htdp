;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-5) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")))))
(define (convert l)
  (cond ((empty? l) 0)
        (else (+ (first l)
                 (* 10 (convert (rest l)))))))

;; examples
(= (convert empty)
   0)
(= (convert (cons 8 empty))
   8)
(= (convert (cons 3 (cons 8 empty)))
   83)
(= (convert (cons 9 (cons 3 (cons 8 empty))))
   839)
(= (convert (cons 4 (cons 9 (cons 3 (cons 8 empty)))))
   8394)

(define (check-guess-for-list l target)
  (cond ((= (convert l) target) 'Perfect)
        ((< (convert l) target) 'TooSmall)
        ((> (convert l) target) 'TooLarge)))

(guess-with-gui-list 7 check-guess-for-list)
