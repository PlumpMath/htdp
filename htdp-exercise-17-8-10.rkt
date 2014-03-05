;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; replace-eol-with
;; list-of-numbers list-of-numbers -> list-of-numbers
(define (replace-eol-with alon1 alon2)
  (cond ((empty? alon1) alon2)
        ((cons? alon1) (cons (first alon1) (replace-eol-with (rest alon1) alon2)))
        (else (error 'replace-eol-with "invalid list"))))

(define (test-replace-eol-with alon1 alon2 target)
  (equal? (replace-eol-with alon1 alon2) target))

;; examples for replace-eol-with
(define L (list 1 2 3 4 5))

(test-replace-eol-with empty
                       L
                       L)

(test-replace-eol-with (cons 1 empty)
                       L
                       (cons 1 L))

(test-replace-eol-with (cons 2 (cons 1 empty))
                       L
                       (cons 2 (cons 1 L)))

(test-replace-eol-with (cons 3 (cons 2 (cons 1 empty)))
                       L
                       (cons 3 (cons 2 (cons 1 L))))

