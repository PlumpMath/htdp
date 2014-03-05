;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; check-range1?
(define (check-range1? l)
  (cond ((empty? l) true)
        ((and (<= 5 (first l))
              (<= (first l) 95))
         (check-range1? (rest l)))
        (else false)))

;; examples
(check-range1? empty)
(check-range1? (cons 10 empty))
(not (check-range1? (cons 3 empty)))
(not (check-range1? (cons 97 empty)))
(check-range1? (cons 94 (cons 90 (cons 10 empty))))
(not (check-range1? (cons 94 (cons 90 (cons -3 (cons 10 empty))))))

;; check-range
(define (check-range? l min max)
  (cond ((empty? l) true)
        ((and (<= min (first l))
              (<= (first l) max))
         (check-range? (rest l) min max))
        (else false)))

;; examples
(check-range? empty 10 90)
(check-range? (cons 10 empty) 3 11)
(not (check-range? (cons 10 empty) 3 8))
(not (check-range? (cons 10 empty) 11 20))
(not (check-range? (cons 97 empty) 80 90))
(check-range? (cons 94 (cons 90 (cons 10 empty))) 1 100)
(not (check-range? (cons 94 (cons 90 (cons -3 (cons 10 empty)))) 5 100))
