;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-3-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define cm-per-inch 2.54)
(define inches-per-foot 12)
(define feet-per-yard 3)
(define yards-per-rod (+ 5 (/ 1 2)))
(define rods-per-furlong 40)
(define furlongs-per-mile 8)

(define (inches->cm x)
  (* x cm-per-inch))

(define (feet->inches x)
  (* x inches-per-foot))

(define (yards->feet x)
  (* x feet-per-yard))

(define (rods->yards x)
  (* x yards-per-rod))

(define (furlongs->rods x)
  (* x rods-per-furlong))

(define (miles->furlongs x)
  (* x furlongs-per-mile x))

(define (feet->cm x)
  (inches->cm (feet->inches x)))

(define (yards->cm x)
  (feet->cm (yards->feet x)))

(define (rods->inches x)
  (feet->inches (yards->feet (rods->yards x))))

(define (miles->feet x)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs x)))))
