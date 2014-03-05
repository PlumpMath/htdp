;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

(define (list-pick0 alos n)
  (cond
    ((and (zero? n) (empty? alos)) (error 'list-pick "ERROR"))
    ((and (< 0 n) (empty? alos)) (error 'list-pick "ERROR"))
    ((and (zero? n) (cons? alos)) (first alos))
    ((and (< 0 n) (cons? alos)) (list-pick0 (rest alos) (sub1 n)))
    (else (error 'list-pick "ERROR"))))


;; (list-pick0 empty 0)
(list-pick0 (list 0 1 2 3 4 5 6 7 8 9) 8)
(list-pick (list 1 2 3 4 5 6 7 8 9) 8)
(list-pick0 (list 0 1 2 3 4 5 6 7 8 9) 0)
(list-pick (list 1 2 3 4 5 6 7 8 9) 0)
