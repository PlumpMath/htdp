;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-5-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
