;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-3-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; attendiees : number->number
;; example : (attendees 3.00) -> 420
;;           (attendees 4.00) -> 270
;;           (attendees 5.00) -> 120
(define (attendees ticket-price)
  (+ ;; 기본 관객
     120
     ;; 추가 관객
     (* ;; 0.1 달러당 15명
        (/ 15 0.1)
        ;; 5달러 대비 티켓 할인액
        (- 5 ticket-price))))
