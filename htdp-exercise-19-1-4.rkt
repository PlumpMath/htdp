;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-1-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; squared10? : number number  ->  boolean
(define (squared10? x c)
  (> (sqr x) 10))

(define (filter- predicate alon)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(predicate (first alon))
             (cons (first alon)
                   (filter- predicate (rest alon)))]
            [else
             (filter predicate (rest alon))])]))

(define (below alon n)
  (local ((define (less-than-n e)
            (< e n)))
  (filter less-than-n alon)))

(define (above alon n)
  (local ((define (more-than-n e)
            (> e n)))
  (filter more-than-n alon)))


(below (list 1 2 3 4 5 6) 4)
(below (list 4 2 6 1 3 5) 4)
(above (list 1 2 3 4 5 6) 4)
(above (list 4 2 6 1 3 5) 4)
