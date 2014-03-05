;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-22-3-1) (read-case-sensitive #t) (teachpacks ((lib "gui.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.rkt" "teachpack" "htdp")))))
;; Options
(define number-of-digits 3)
(define target-number (random (expt 10 number-of-digits)))

;; Model:
;; build-number : (listof digit)  ->  number
;; to translate a list of digits into a number
;; example: (build-number (list 1 2 3)) = 123
(define (build-number x)
  (local ((define (calc l)
            (cond ((empty? l) 0)
                  (else (+ (first l)
                           (* 10 (calc (rest l))))))))
    (calc (reverse x))))

;; check-guess
(define (check-guess l target)
  (cond ((= (build-number l) target) 'Perfect)
        ((< (build-number l) target) 'TooSmall)
        ((> (build-number l) target) 'TooLarge)))




;; View:
;; the ten digits as strings
(define DIGITS
  (build-list 10 number->string))

;; a list of three digit choice menus
(define digit-choosers
  (local ((define (builder i) (make-choice DIGITS)))
    (build-list number-of-digits builder)))

;; a message field for saying hello and displaying the number
(define a-msg
  (make-message "Welcome"))

;;



;; Controller:
;; check-call-back : X  ->  true
;; to get the current choices of digits, convert them to a number,
;; and to draw this number as a string into the message field
(define (check-call-back b)
  (draw-message a-msg
                (symbol->string
                (check-guess (map choice-index digit-choosers)
                             target-number))))

(create-window
 (list
  (append digit-choosers (list a-msg))
  (list (make-button "Check Guess" check-call-back))))
