;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; cross
;; 기호 리스트와 수 리스트를 입력받아 (기호, 수)의 가능한 모든 조합을 출력한다.
(define (cross los lon)
  (cond ((empty? los) empty)
        ((cons? los) (append (combine lon (first los))
                             (cross (rest los) lon)))
        (else (error 'cross "invalid list"))))

(define (combine lon s)
  (cond ((empty? lon) empty)
        ((cons? lon) (append (list (list s (first lon)))
                              (combine (rest lon) s)))))

;; examples for cross
(cross '(a b c) '(1 2))
"should"
(list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list 'c 2))
