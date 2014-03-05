;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

(define (recall lst ty)
  (cond
    ((empty? lst) empty)
    ((symbol=? ty (ir-name (first lst))) (recall (rest lst) ty))
    (else (cons (first lst) (recall (rest lst) ty)))))

;; test
(recall empty 'doll) "should be" empty
(recall (cons (make-ir 'doll 2.31) empty) 'doll) "should be" empty
(recall (cons (make-ir 'rocket 1.21) empty) 'doll) "should be" 
(cons (make-ir 'rocket 1.21) empty)

(recall (cons (make-ir 'rocket 1.21)
              (cons (make-ir 'rocket 1.21)
                    (cons (make-ir 'doll 2.31)
                          (cons (make-ir 'rocket 1.21)
                                empty))))
        'rocket)
"should be"
(cons (make-ir 'doll 2.31) empty)
