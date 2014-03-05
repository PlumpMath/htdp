;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

(define (raise-prices lst)
  (cond
    ((empty? lst) empty)
    (else (cons (make-ir (ir-name (first lst))
                         (* 1.05 (ir-price (first lst))))
                (raise-prices (rest lst))))))

;; EXAMPLES AS TESTS
(raise-prices empty) "should be" empty
(raise-prices (cons (make-ir 'rocket 1.00) empty)) "should be" (cons (make-ir 'rocket 1.05) empty)
(raise-prices (cons (make-ir 'rocket 1.00) (cons (make-ir 'doll 1.40) empty))) "should be"
(cons (make-ir 'rocket 1.05) (cons (make-ir 'doll 1.47) empty))
