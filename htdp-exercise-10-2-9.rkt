;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

(define (name-robot lst)
  (cond
    ((empty? lst) empty)
    ((symbol=? 'robot (ir-name (first lst)))
     (cons (make-ir 'r2d3
                    (ir-price (first lst)))
           (name-robot (rest lst))))
    (else (cons (first lst) (name-robot (rest lst))))))

(define (substitute new old lst)
  (cond
    ((empty? lst) empty)
    ((symbol=? old (ir-name (first lst)))
     (cons (make-ir new
                    (ir-price (first lst)))
           (substitute new old (rest lst))))
    (else (cons (first lst) (substitute new old (rest lst))))))

;; examples
(name-robot empty) "should be" empty
(name-robot (cons (make-ir 'doll 1.21) empty)) "should be" 
(cons (make-ir 'doll 1.21) empty)

(name-robot (cons (make-ir 'robot 1.21) empty)) "should be"
(cons (make-ir 'r2d2 1.21) empty)

(name-robot (cons (make-ir 'robot 1.21)
                  (cons (make-ir 'doll 2.12)
                        (cons (make-ir 'robot 2.23)
                              empty))))
"should be"
(cons (make-ir 'r2d2 1.21)
      (cons (make-ir 'doll 2.12)
            (cons (make-ir 'r2d2 2.23)
                  empty)))


;; examples
(substitute 'r2d3 'robot empty) "should be" empty
(substitute 'r2d3 'robot (cons (make-ir 'doll 1.21) empty)) "should be" 
(cons (make-ir 'doll 1.21) empty)

(substitute 'r2d3 'robot (cons (make-ir 'robot 1.21) empty)) "should be"
(cons (make-ir 'r2d2 1.21) empty)

(substitute 'r2d3 'robot (cons (make-ir 'robot 1.21)
                  (cons (make-ir 'doll 2.12)
                        (cons (make-ir 'robot 2.23)
                              empty))))
"should be"
(cons (make-ir 'r2d2 1.21)
      (cons (make-ir 'doll 2.12)
            (cons (make-ir 'r2d2 2.23)
                  empty)))

