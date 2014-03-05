;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| version 1
|#
(define (posn=? p1 p2)
  (or (and (empty? p1)
           (empty? p2))
      (and (posn? p1)
           (posn? p2)
           (= (posn-x p1) (posn-x p2))
           (= (posn-y p1) (posn-y p2)))))

#| version 2
(define (posn=? p1 p2)
  (cond ((empty? p1)
         (empty? p2))
        ((posn? p1)
         (and (posn? p2)
              (= (posn-x p1) (posn-x p2))
              (= (posn-y p1) (posn-y p2))))
        (else false)))
|#

;Examples as Tests:
(check-expect
 (posn=? (make-posn 8 12) (make-posn 8 12))
 true)

(check-expect
 (posn=? (make-posn 7 12) (make-posn 8 12))
 false)

(check-expect
 (posn=? (make-posn 8 3) (make-posn 8 12))
 false)

(check-expect
 (posn=? (make-posn 8 3) (make-posn 3 8))
 false)

(check-expect
 (posn=? (make-posn 3 5) (make-posn 3 5))
 true)