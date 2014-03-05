;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-6-6) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; circle: structure (center: posn / radius: number / color: symbol)
(define-struct circle (center radius color))

;; circle-template
;;(define (fun-for-circle a-circle)
;;  ... (circle-center a-circle) ...
;;  ... (circle-radius a-circle) ...
;;  ... (circle-color a-circle) ...)

(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (in-circle? a-circle a-posn)
  (<= (distance (circle-center a-circle)
                a-posn)
      (circle-radius a-circle)))

(define (distance posn1 posn2)
  (sqrt (+ (sqr (- (posn-x posn1)
                   (posn-x posn2)))
           (sqr (- (posn-y posn1)
                   (posn-y posn2))))))

(define (translate-circle a-circle delta)
  (make-circle (make-posn (+ (posn-x (circle-center a-circle)) delta)
                          (posn-y (circle-center a-circle)))
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (clear-a-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               'white))

(define (draw-and-clear-circle a-circle)
  (and (draw-a-circle a-circle)
       (sleep-for-a-while 1)
       (clear-a-circle a-circle)))

;; move-circle : number circle  ->  circle
;; to draw and clear a circle, translate it by delta pixels
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

;; test data
(define my-circle (make-circle (make-posn 100 80)
                               20
                               'red))

(define my-posn (make-posn 105 90))

;; draw
(start 300 300)
(draw-a-circle 
  (move-circle 10
    (move-circle 10
      (move-circle 10
	(move-circle 10 my-circle)))))
