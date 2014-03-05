;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; list-pick
;; list-of-symbols N[>=1] -> symbol
;; alos 에서 n번째 위치에 있는 기호를 출력
;; n번째 항목이 없으면 오류를 발생시킨다
(define (list-pick alos n)
  (cond
    ((and (= n 1) (empty? alos)) (error 'list-pick "ERROR"))
    ((and (< 1 n) (empty? alos)) (error 'list-pick "ERROR"))
    ((and (= n 1) (cons? alos)) (first alos))
    ((and (< 1 n) (cons? alos)) (list-pick (rest alos) (sub1 n)))
    (else (error 'list-pick "ERROR"))))

(define (test-list-pick alos n target)
  (equal? (list-pick alos n) target))

;; (list-pick0 empty 0)
(test-list-pick (list 1 2 3 4 5 6 7 8 9) 7 7)
(test-list-pick (list 1 2 3 4 5 6 7 8 9) 1 1)
