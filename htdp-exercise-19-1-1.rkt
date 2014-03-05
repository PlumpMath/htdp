;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(rel-op (first alon) t)
             (cons (first alon)
                   (filter1 rel-op (rest alon) t))]
            [else
             (filter1 rel-op (rest alon) t)])]))

(filter1 < (cons 6 (cons 4 empty)) 5)
(cond
  [false empty]
  [else (cond
          [(< (first (cons 6 (cons 4 empty))) 5)
           (cons (first (cons 6 (cons 4 empty)))
                 (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
          [else
           (filter1 < (rest (cons 6 (cons 4 empty))) 5)])])
(cond
  [else (cond
          [(< (first (cons 6 (cons 4 empty))) 5)
           (cons (first (cons 6 (cons 4 empty)))
                 (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
          [else
           (filter1 < (rest (cons 6 (cons 4 empty))) 5)])])
(cond
  [(< (first (cons 6 (cons 4 empty))) 5)
   (cons (first (cons 6 (cons 4 empty)))
         (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
  [else
   (filter1 < (rest (cons 6 (cons 4 empty))) 5)])
(cond
  [(< 6 5)
   (cons (first (cons 6 (cons 4 empty)))
         (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
  [else
   (filter1 < (rest (cons 6 (cons 4 empty))) 5)])
(cond
  [false
   (cons (first (cons 6 (cons 4 empty)))
         (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
  [else
   (filter1 < (rest (cons 6 (cons 4 empty))) 5)])
(cond
  [else
   (filter1 < (rest (cons 6 (cons 4 empty))) 5)])
(filter1 < (rest (cons 6 (cons 4 empty))) 5)
(filter1 < (cons 4 empty) 5)

#|
즉, 다음 등식은 성립한다.
(filter1 < (cons 6 (cons 4 empty)) 5)
= (filter1 < (cons 4 empty) 5)
|#
