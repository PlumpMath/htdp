;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| last
입력: (non-empty-listof ITEM)
출력: ITEM
|#
(define (last l)
  (cond ((empty? (rest l)) (first l))
        (else (last (rest l)))))

(last (list (make-pair 0 0) (make-pair 2 2)))
(last (list (make-pair 'a 0) (make-pair 'b 2)))
(last (list (make-pair 'a 'b) (make-pair 'b 'd)))
