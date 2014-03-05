;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-4-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; tabulate-f20 : number -> list-of-posn
(define (tabulate-f20 x)
  (cond ((= x 20) empty)
        (else (cons (make-posn x (f x))
                    (tabulate-f20 (sub1 x))))))

;; EXAMPLES AS TESTS
(tabulate-f20 20) "should be" empty
(tabulate-f20 24) "should be"
(cons (make-posn 24 1583)
      (cons (make-posn 23 1448)
            (cons (make-posn 22 1319)
                  (cons (make-posn 21 1196)
                        empty))))
