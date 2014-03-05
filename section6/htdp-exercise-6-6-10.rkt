;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-6-10) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; circle: structure (center: posn / radius: number / color: symbol)
(define-struct circle (center radius color))

;; circle-template
;;(define (fun-for-circle a-circle)
;;  ... (circle-center a-circle) ...
;;  ... (circle-radius a-circle) ...
;;  ... (circle-color a-circle) ...)

;; rectangle: structure (pos: posn / width: number / height: number / color: symbol)
(define-struct rectangle (pos width height color))

;; rectangle-template
;;(define (fun-for-rectangle a-rectangle)
;;  ... (rectangle-pos a-rectangle) ...
;;  ... (rectangle-width a-rectangle) ...
;;  ... (rectangle-height a-rectangle) ...
;;  ... (rectangle-color a-rectangle) ...)

;; fuctions
(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle)
               (circle-radius a-circle)
               (circle-color a-circle)))

(define (in-circle? a-circle a-posn)
  (<= (distance-posn (circle-center a-circle)
                     a-posn)
      (circle-radius a-circle)))

(define (distance-posn posn1 posn2)
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

(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-pos a-rectangle)
                   (rectangle-width a-rectangle)
                   (rectangle-height a-rectangle)
                   (rectangle-color a-rectangle)))

(define (in-rectangle? a-rectangle a-posn)
  (and (<= 0 (- (posn-x a-posn) (posn-x (rectangle-pos a-rectangle))))
       (<= (distance (posn-x (rectangle-pos a-rectangle)) (posn-x a-posn)) (rectangle-width a-rectangle))
       (<= 0 (- (posn-y a-posn) (posn-y (rectangle-pos a-rectangle))))
       (<= (distance (posn-y (rectangle-pos a-rectangle)) (posn-y a-posn)) (rectangle-height a-rectangle))))

(define (distance x y)
  (abs (- x y)))

(define (translate-rectangle a-rectangle delta)
  (make-rectangle (make-posn (+ (posn-x (rectangle-pos a-rectangle)) delta)
                             (posn-y (rectangle-pos a-rectangle)))
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

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

(define my-rectangle (make-rectangle (make-posn 50 70)
                                     100
                                     35
                                     'blue))

;; draw
(start 300 300)
(draw-a-rectangle my-rectangle)

