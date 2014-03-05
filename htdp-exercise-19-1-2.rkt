;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(rel-op (first alon) t)
             (cons (first alon)
                   (filter1 rel-op (rest alon) t))]
            [else
             (filter1 rel-op (rest alon) t)])]))

(filter1 > (cons 8 (cons 6 (cons 4 empty))) 5)
(cond
  [(empty? (cons 8 (cons 6 (cons 4 empty)))) empty]
  [else (cond
          [(< (first (cons 8 (cons 6 (cons 4 empty)))) 5)
           (cons (first (cons 8 (cons 6 (cons 4 empty))))
                 (filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5))]
          [else
           (filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5)])])
(cond
  [(< (first (cons 8 (cons 6 (cons 4 empty)))) 5)
   (cons (first (cons 8 (cons 6 (cons 4 empty))))
         (filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5))]
  [else
   (filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5)])
(cond
  [(< 8 5)
   (cons (first (cons 8 (cons 6 (cons 4 empty))))
         (filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5))]
  [else
   (filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5)])
(filter1 < (rest (cons 8 (cons 6 (cons 4 empty)))) 5)
(filter1 < (cons 6 (cons 4 empty)) 5)
(cond
  [(empty? (cons 6 (cons 4 empty))) empty]
  [else (cond
          [(< (first (cons 6 (cons 4 empty))) 5)
           (cons (first (cons 6 (cons 4 empty)))
                 (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
          [else
           (filter1 < (rest (cons 6 (cons 4 empty))) 5)])]))
(cond
  [(< (first (cons 6 (cons 4 empty))) 5)
   (cons (first (cons 6 (cons 4 empty)))
         (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
  [else
   (filter1 < (rest (cons 6 (cons 4 empty))) 5)])
(filter1 < (cons 4 empty) 5)
(cond
  [(empty? (cons 4 empty)) empty]
  [else (cond
          [(< (first (cons 4 empty)) 5)
           (cons (first (cons 4 empty))
                 (filter1 < (rest (cons 4 empty)) 5))]
          [else
           (filter1 < (rest (cons 4 empty)) 5)])])
(cond
  [(< (first (cons 4 empty)) 5)
   (cons (first (cons 4 empty))
         (filter1 < (rest (cons 4 empty)) 5))]
  [else
   (filter1 < (rest (cons 4 empty)) 5)])
(cons (first (cons 4 empty))
      (filter1 < (rest (cons 4 empty)) 5))
(cons 4 (filter1 < empty 5))
(cons 4 (cond
          [(empty? empty) empty]
          [else (cond
                  [(< (first empty) 5)
                   (cons (first empty)
                         (filter1 < (rest empty) 5))]
                  [else
                   (filter1 < (rest empty) 5)])]))
(cons 4 empty)
