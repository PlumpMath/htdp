;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; f : number  ->  number
(define (f x)
  (+ (* 3 (* x x)) 
     (+ (* -6 x)
        -1)))

;; tabulate-f : number -> list-of-posn
(define (tabulate-f x)
  (cond ((zero? x)
         empty)
        (else
         (cons (make-posn x
                          (f x))
               (tabulate-f (sub1 x))))))

;; EXAMPLES AS TESTS
(tabulate-f 0) "should be" empty
(tabulate-f 4) "should be"
(cons (make-posn 4 23)
      (cons (make-posn 3 8)
            (cons (make-posn 2 -1)
                  (cons (make-posn 1 -4)
                        empty))))
