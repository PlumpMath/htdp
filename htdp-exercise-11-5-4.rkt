;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-5-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; deep-list : 
;; 1. s 
;;    -> s: symbol
;; 2. (cons dl empty)
;;    -> dl: deep-list

(define (count dl)
  (cond ((symbol? dl) 0)
        (else (+ 1 (count (first dl))))))

;; 0
'a
;; 3
(cons (cons (cons 'a empty) empty) empty)
;; 8
(cons (cons (cons (cons (cons (cons (cons (cons 'a empty) empty) empty) empty) empty) empty) empty) empty)

(define (addDL n m)
  (cond ((symbol? n) m)
        (else (addDL (first n) (cons m empty)))))
;; htdp 답에서는, else이하 절에 다음과 같이 작성:
;; (else (cons (addDL (first n-dl) x-dl) empty))


(addDL (cons (cons (cons 'a empty) empty) empty)
       (cons (cons (cons (cons (cons (cons (cons (cons 'a empty) empty) empty) empty) empty) empty) empty) empty))

(count (addDL (cons (cons (cons 'a empty) empty) empty)
       (cons (cons (cons (cons (cons (cons (cons (cons 'a empty) empty) empty) empty) empty) empty) empty) empty)))

