;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct pair (left right))
#|
(pair X Y)는 다음 구조체다.
(make-pair l r)
l은 X이고, r은 Y다.
|#


"1. (listof (pair number number)), the list of pairs of numbers"
;; examples
(list empty)
(list (make-pair 1 1))
(list (make-pair 0 0) (make-pair 2 2))

"2. (listof (pair symbol number)), the list of pairs of symbols and numbers"
;; examples
(list empty)
(list (make-pair 'a 1))
(list (make-pair 'a 0) (make-pair 'b 2))

"3. (listof (pair symbol symbol)), the list of pairs of symbols"
;; examples
(list empty)
(list (make-pair 'a 'a))
(list (make-pair 'a 'b) (make-pair 'b 'd))


(define (lefts pairs)
  (cond ((empty? pairs) empty)
        (else (cons (pair-left (first pairs))
                    (lefts (rest pairs))))))


(lefts (list (make-pair 0 0) (make-pair 2 2)))
(lefts (list (make-pair 'a 0) (make-pair 'b 2)))
(lefts (list (make-pair 'a 'b) (make-pair 'b 'd)))

