;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-8) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
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
(define (draw-polygon a-poly)
  (local ((define (connect-dots a-poly last-p)
            (cond
              ((empty? (rest a-poly))
               (and (draw-solid-line (first a-poly) last-p)
                    true))
              (else
               (and (draw-solid-line (first a-poly) (second a-poly))
                    (connect-dots (rest a-poly) last-p))))))
    (connect-dots a-poly (first a-poly))))

(start 300 300)
(draw-polygon
 (cons (make-posn 10 10)
       (cons (make-posn 60 60)
             (cons (make-posn 10 60)
                   empty))))

