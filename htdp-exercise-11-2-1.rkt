;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-11-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; hellos : N->list-of-symbols
;; n개의 'hello가 들어 있는 리스트를 생성한다.
(define (hellos n)
  (cond ((zero? n) empty)
        (else (cons 'hello (hellos (sub1 n))))))

(hellos 0)
(hellos 1)
(hellos 2)
(hellos 3)


;; repeat : N->list-of-symbols
;; n개의 s가 들어 있는 리스트를 생성한다.
(define (repeat n s)
  (cond ((zero? n) empty)
        (else (cons s (repeat (sub1 n) s)))))


(repeat 0 'hi)
(repeat 1 'hi)
(repeat 2 'hi)
(repeat 3 'hell)
