;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-12-3-1) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; posn 리스트는 다음 두 가지 중 하나다.
;; 1. empty
;; 2. (cons p lop) : p-> posn 구조체, lop -> posn 리스트
;; example:
(cons (make-posn 10 10)
      (cons (make-posn 60 60)
            (cons (make-posn 10 60)
                  empty)))


;; polygon은 다음 두 가지 중 하나다.
;; 1. (cons p empty) : p는 posn
;; 2. (cons p lop) : p는 posn 구조체, lop는 다각형.

(define (connect-dots a-poly)
  (cond
    ((empty? (rest a-poly))
     true)
    (else
     (and (draw-solid-line (first a-poly) (second a-poly))
          (connect-dots (rest a-poly))))))

(define (draw-polygon a-poly)
  (connect-dots (add-at-end (first a-poly) a-poly)))

(define (add-at-end item a-poly)
  (cond ((empty? a-poly) (cons item empty))
        (else (cons (first a-poly)
                    (add-at-end item (rest a-poly))))))

(start 300 300)
(draw-polygon
 (cons (make-posn 10 10)
       (cons (make-posn 60 60)
             (cons (make-posn 10 60)
                   empty))))
