;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (sum a-list-of-nums)
  (cond ((empty? a-list-of-nums) 0)
        (else (+ (first a-list-of-nums)
                 (sum (rest a-list-of-nums))))))

(define (count l)
  (cond ((empty? l) 0)
        (else (+ 1 (count (rest l))))))

(define (average-price l)
  (/ (sum l) (count l)))

(define (checked-average-price l)
  (cond ((empty? l) (error 'checked-average-price "list is empty"))
        (else (average-price l))))

(= (checked-average-price (cons 0 empty))
   0)
(= (checked-average-price (cons 5 empty))
   5)
(= (checked-average-price (cons 10 empty))
   10)
(= (checked-average-price (cons 8 (cons 10 empty)))
   9)
(= (checked-average-price (cons 2 (cons 2 (cons 8 empty))))
   4)
(= (checked-average-price (cons 10 (cons 9 (cons 1005 (cons 1002 (cons 802 (cons 994 empty)))))))
   637)
(checked-average-price empty) ; -> error
