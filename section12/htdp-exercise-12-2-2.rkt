;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-12-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (search n alon)
  (cond ((empty? alon) false)
        ((= n (first alon)) true)
        (else  (search n (rest alon)))))

(define (search-sorted n alon)
  (cond ((empty? alon) false)
        ((= n (first alon)) true)
        ((< n (first alon)) false)
        (else (search-sorted n (rest alon)))))

;; example
(define example-1 empty)

(define example-2 (cons 4 (cons 5 (cons 6 (cons 7 empty)))))

(define example-3 (cons 0 (cons 3 (cons 6 (cons 8 (cons 9 (cons 10 (cons 12 (cons 14 (cons 15 (cons 19 empty)))))))))))

(define example-4 (cons 4 (cons 5 (cons 15 (cons 6 empty)))))

(search 6 example-1)
(search 6 example-2)
(search 6 example-3)
(search 6 example-4)

(search-sorted 6 example-1)
(search-sorted 6 example-2)
(search-sorted 6 example-3)
(search-sorted 6 example-4) ;; -> example-4 contains 6, but is not sorted
