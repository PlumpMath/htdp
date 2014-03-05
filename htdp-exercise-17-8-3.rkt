;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (sym-list=? l1 l2)
  (cond ((and (empty? l1) (empty? l2)) true)
        ((or (empty? l1) (empty? l2)) false)
        (else (and (symbol=? (first l1) (first l2))
                   (sym-list=? (rest l1) (rest l2))))))

(sym-list=? empty empty)
(not
 (sym-list=? empty 'a))
(not
 (sym-list=? 'a empty))
(not
 (sym-list=? (list 'a) (list 'b)))
(not
 (sym-list=? (list 'a 'b 'c 'd) (list 'a 'b 'c)))
(not
 (sym-list=? (list 'a 'b 'c) (list 'a 'b 'c 'd)))
(sym-list=? (list 'a 'b 'c 'd) (list 'a 'b 'c 'd))
