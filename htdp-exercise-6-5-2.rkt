;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-5-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; a time is a structure
;; (make-time number number number)
(define-struct time (hours minutes seconds))

(define (time->seconds a-time)
  (+ (hours->seconds (time-hours a-time))
     (minutes->seconds (time-minutes a-time))
     (time-seconds a-time)))

(define (hours->minutes hours)
  (* hours 60))

(define (hours->seconds hours)
  (minutes->seconds (hours->minutes hours)))

(define (minutes->seconds minutes)
  (* minutes 60))

(= (time->seconds (make-time 12 30 2))
   45002)
