;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (sum a-list-of-nums)
  (cond ((empty? a-list-of-nums) 0)
        (else (+ (first a-list-of-nums)
                 (sum (rest a-list-of-nums))))))

(= (sum empty)
   0)
(= (sum (cons 1 empty))
   1)
(= (sum (cons 19.28 (cons 10 (cons 98.3 empty))))
   (+ 19.28 10 98.3))

(sum empty)
(sum (cons 1.00 empty))
(sum (cons 17.05 (cons 1.22 (cons 2.59 empty))))

(sum empty)
(sum (cons 2.59 empty))
(sum (cons 1.22 (cons 2.59 empty)))


(define (delta l1 l2)
  (- (sum l2)
     (sum l1)))

(= (delta empty empty)
   0)
(= (delta empty (cons 10 empty))
   10)
(= (delta empty (cons 8 (cons 10 empty)))
   18)
(= (delta (cons 5 empty) empty)
   -5)
(= (delta (cons 5 empty) (cons 2 (cons 2 (cons 1 empty))))
   0)
(= (delta (cons 10 (cons 9 (cons 1005 empty))) (cons 1002 (cons 802 (cons 991 empty))))
   1771)
