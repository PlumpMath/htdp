;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-3-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 올바른 디자인 방법
(define (profit1 ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* (attendees ticket-price)
     ticket-price))

(define (cost ticket-price)
  (+ basic-cost
     (* additional-cost-per-attendee
        (attendees ticket-price))))

(define (attendees ticket-price)
  (+ attendees-at-standard-price
     (* (/ increase-of-attendees-by-standard-discount
           standard-discount)
        (- standard-price ticket-price))))

;; 잘못된 디자인 방법
(define (profit2 price)
  (- (* (+ attendees-at-standard-price
           (* (/ increase-of-attendees-by-standard-discount
                 standard-discount)
              (- standard-price price)))
        price)
     (+ basic-cost
        (* additional-cost-per-attendee
           (+ attendees-at-standard-price
              (* (/ increase-of-attendees-by-standard-discount
                    standard-discount)
                 (- standard-price price)))))))

;; 상수 정의
(define basic-cost 180)
(define additional-cost-per-attendee .04)
(define attendees-at-standard-price 120)
(define increase-of-attendees-by-standard-discount 15)
(define standard-discount .10)
(define standard-price 5.00)
