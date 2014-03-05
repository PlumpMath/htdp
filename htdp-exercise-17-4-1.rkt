;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-4-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 문제가 좀 이상함. 17.2절의 전략이 아니라, 17.3절의 전략을 따라야 맞음.
;; 그렇게 가정하고 진행하였음.

#| template
(define (replace-eol-with alon1 alon2)
  (cond ((and (empty? alon1) (empty? alon2)) ...)
        ((and (empty? alon1) (cons? alon2)) ...)
        ((and (cons? alon1) (empty? alon2)) ...)
        ((and (cons? alon1) (cons? alon2)) ...)
        (else ...)))
|#

(define (replace-eol-with alon1 alon2)
  (cond ((and (empty? alon1) (empty? alon2)) empty)
        ((and (empty? alon1) (cons? alon2)) alon2)
        ((and (cons? alon1) (empty? alon2)) alon1)
        ((and (cons? alon1) (cons? alon2)) (cons (first alon1) (replace-eol-with (rest alon1) alon2)))
        (else (error 'replace-eol-with "unknown error."))))

(replace-eol-with empty empty)
(replace-eol-with (list 1 2 3 4 5 6 7) empty)
(replace-eol-with empty (list 8 9 10))
(replace-eol-with (list 1 2 3 4 5 6 7) (list 8 9 10))


(define (simplified-replace-eol-with alon1 alon2)
  (cond ((empty? alon1) alon2)
        ((empty? alon2) alon1)
        (else (cons (first alon1) (simplified-replace-eol-with (rest alon1) alon2)))))
;; alon1과 alon2가 둘 다 empty인 경우에는 둘 중 하나만 empty임을 확인한 후 다른 하나를 반환할 경우 empty가 반환.

(simplified-replace-eol-with empty empty)
(simplified-replace-eol-with (list 1 2 3 4 5 6 7) empty)
(simplified-replace-eol-with empty (list 8 9 10))
(simplified-replace-eol-with (list 1 2 3 4 5 6 7) (list 8 9 10))
