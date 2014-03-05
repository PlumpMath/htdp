;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(rel-op (first alon) t)
             (cons (first alon)
                   (filter1 rel-op (rest alon) t))]
            [else
             (filter1 rel-op (rest alon) t)])]))

;; squared>? : number number  ->  boolean
(define (squared>? x c)
  (> (* x x) c))

(filter1 squared>? (list 4 5) 10)
(cond
  [(empty? (list 4 5)) empty]
  [else (cond
          [(squared>? (first (list 4 5)) 10)
           (cons (first (list 4 5))
                 (filter1 squared>? (rest (list 4 5)) 10))]
          [else
           (filter1 squared>? (rest (list 4 5)) 10)])])
(cond
  [(squared>? (first (list 4 5)) 10)
   (cons (first (list 4 5))
         (filter1 squared>? (rest (list 4 5)) 10))]
  [else
   (filter1 squared>? (rest (list 4 5)) 10)])
(cons (first (list 4 5))
      (filter1 squared>? (rest (list 4 5)) 10))
(cons 4 (filter1 squared>? (list 5) 10))


#| 즉, 다음은 성립한다.
(filter1 squared>? (list 4 5) 10)
= (cons 4 (filter1 squared>? (list 5) 10))
|#
