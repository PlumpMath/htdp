;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-21-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (convert-euro dollar-list)
  (local ((define euro-per-dollar 1.22)
          (define (dollar->euro dollar)
            (* dollar euro-per-dollar)))
  (map dollar->euro dollar-list)))

(convert-euro (list 100 200 300 400 500))

(define (convertFC loF)
  (local ((define (F->C F)
            (/ (* (- F 32)
                  5)
               9)))
    (map F->C loF)))

(convertFC (list 0 20 40 60 80 100))

(define (move-all lop)
  (local ((define (move-to-x-by-3 p)
            (make-posn (posn-x p)
                       (- (posn-y p) 3))))
    (map move-to-x-by-3 lop)))

(move-all (list (make-posn 0 0)
                (make-posn 10 20)
                (make-posn 30 40)))

