;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; sort : list-of-numbers  ->  list-of-numbers
(define (sort alon)
  (local ((define (sort alon)
            (cond
              [(empty? alon) empty]
              [(cons? alon) (insert (first alon)
                                    (sort (rest alon)))]))
          (define (insert an alon)
            (cond
              [(empty? alon) (list an)]
              [else (cond
                      [(> an (first alon)) (cons an alon)]
                      [else (cons (first alon)
                                  (insert an (rest alon)))])])))
    (sort alon)))


(sort (list 2 1 3))
(local ((define (sort1 alon)
          (cond
            [(empty? alon) empty]
            [(cons? alon) (insert (first alon)
                                   (sort1 (rest alon)))]))
        (define (insert an alon)
          (cond
            [(empty? alon) (list an)]
            [else (cond
                    [(> an (first alon)) (cons an alon)]
                    [else (cons (first alon)
                                (insert an (rest alon)))])])))
  (sort1 (list 2 1 3)))
(define (sort1 alon)
          (cond
            [(empty? alon) empty]
            [(cons? alon) (insert (first alon)
                                   (sort1 (rest alon)))]))
(define (insert an alon)
          (cond
            [(empty? alon) (list an)]
            [else (cond
                    [(> an (first alon)) (cons an alon)]
                    [else (cons (first alon)
                                (insert1 an (rest alon)))])]))
(sort1 (list 2 1 3))
(cond
  [(empty? (list 2 1 3)) empty]
  [(cons? (list 2 1 3)) (insert (first (list 2 1 3))
                                (sort1 (rest (list 2 1 3))))])

(equal? (sort (list 1)) (sort (list 2)))

(equal? (local ((define (sort alon)
                  (cond
                    [(empty? alon) empty]
                    [(cons? alon) (insert (first alon)
                                          (sort (rest alon)))]))
                (define (insert an alon)
                  (cond
                    [(empty? alon) (list an)]
                    [else (cond
                            [(> an (first alon)) (cons an alon)]
                            [else (cons (first alon)
                                        (insert an (rest alon)))])])))
          (sort alon))
        (sort (list 2)))

(define (sort2 alon)
                  (cond
                    [(empty? alon) empty]
                    [(cons? alon) (insert (first alon)
                                          (sort1 (rest alon)))]))
(define (insert2 an alon)
  (cond
    [(empty? alon) (list an)]
    [else (cond
            [(> an (first alon)) (cons an alon)]
            [else (cons (first alon)
                        (insert2 an (rest alon)))])]))
(equal? (sort2 (list 1)) (sort (list 2)))
(equal? (sort2 (list 1)) (sort (list 2)))
