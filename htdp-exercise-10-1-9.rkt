;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-1-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (controller amount)
  (cons (quotient amount 100)
        (cons (dollar-or-dollars amount)
              (cons 'and
                    (cons (remainder amount 100)
                          (cons (cent-or-cents amount)
                                empty))))))

(define (dollar-or-dollars amount)
  (cond ((= 1 (quotient amount 100)) 'dollar)
        (else 'dollars)))

(define (cent-or-cents amount)
  (cond ((= 1 (remainder amount 100)) 'cent)
        (else 'cents)))

(define (checked-controller amount)
  (cond ((and (<= 0 amount)
              (<= amount 99.99))
         (controller amount))
        (else (checked-controller 0)(checked-controller 0)(error 'checked-controller
                     "the value should be 0 ~ 99.99"))))
