;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; replace-eol-with
;; list-of-numbers list-of-numbers -> list-of-numbers
(define (replace-eol-with alon1 alon2)
  (cond ((empty? alon1) alon2)
        ((cons? alon1) (cons (first alon1) (replace-eol-with (rest alon1) alon2)))
        (else (error 'replace-eol-with "invalid list"))))

;; examples for replace-eol-with
(define L (list 1 2 3 4 5))

(replace-eol-with empty L)
"should"
L

(replace-eol-with (cons 1 empty) L)
"should"
(cons 1 L)

(replace-eol-with (cons 2 (cons 1 empty)) L)
"should"
(cons 2 (cons 1 L))

(replace-eol-with (cons 3 (cons 2 (cons 1 empty))) L)
"should"
(cons 3 (cons 2 (cons 1 L)))

;; our-append
;; list-of-lists list-of-lists -> list-of-lists
(define (our-append lol)
  (cond ((empty? lol) empty)
        ((cons? lol) (replace-eol-with (first lol) (our-append (rest lol))))
        (else (error 'our-append "invalid list"))))

;; examples for our-append
(our-append (list (list 'a) (list 'b 'c) (list 'd 'e 'f)))
"should"
(list 'a 'b 'c 'd 'e 'f)

