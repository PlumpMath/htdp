;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-14-1-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 자식 항목(child)는 (make-child f m na da ec)이고, 각 필드는 다음과 같다.
;; 1. f와 m은 (a) empty이거나, (b) child이다.
;; 2. na와 ec는 기호다.
;; 3. da는 숫자다.
(define-struct child (father mother name date eyes))

;; 가계도 항목 family-tree-node(ftn)는 다음 두 가지 중 하나다.
;; 1. empty
;; 2. (make-child f m na da ec)
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Dave 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))

#|
;; fun-fo-ftn : ftn->???
(define (fun-for-ftn a-ftree)
  (cond
    ((empty? a-ftree) ...)
    ((child? a-ftree) ...
     ... (fun-for-ftn (child-father a-ftree)) ...
     ... (fun-for-ftn (child-mother a-ftree)) ...
     ... (child-name a-ftree) ...
     ... (child-date a-ftree) ...
     ... (child-eyes a-ftree) ...)))
|#

;; blue-eyed-ancestor? : ftn->boolean
(define (blue-eyed-ancestor? a-ftree)
  (cond
    ((empty? a-ftree) false)
    (else (or (symbol=? 'blue (child-eyes a-ftree))
              (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree))))))


;; count-persons : ftn->number
(define (count-persons a-ftree)
  (cond
    ((empty? a-ftree) 0)
    (else (+ 1
             (count-persons (child-father a-ftree))
             (count-persons (child-mother a-ftree))))))

;; age : child->number
(define (age child current-year)
  (- current-year (child-date child)))

;; sum-age : ftn, number->number
(define (sum-age a-ftree current-year)
  (cond
    ((empty? a-ftree) 0)
    (else (+ (age a-ftree current-year)
             (sum-age (child-father a-ftree) current-year)
             (sum-age (child-mother a-ftree) current-year)))))

;; average-age : ftn, number->number
(define (average-age a-ftree current-year)
  (/ (sum-age a-ftree current-year) (count-persons a-ftree)))

;; eye-colors : ftn, list-of-symbols
(define (eye-colors a-ftree)
  (cond
    ((empty? a-ftree) empty)
    (else
     (append (list (child-eyes a-ftree))
           (eye-colors (child-father a-ftree))
           (eye-colors (child-mother a-ftree))))))

;; proper-blue-eyed-ancestor? : ftn  ->  boolean
;; to determine whether a-ftree has a blue-eyed ancestor
;; (define (proper-blue-eyed-ancestor? a-ftree)
;;   (cond
;;     [(empty? a-ftree) false]
;;     [else (or (proper-blue-eyed-ancestor? (child-father a-ftree))
;;               (proper-blue-eyed-ancestor? (child-mother a-ftree)))]))
;; -> 이 함수의 반환값은 항상 false다.
;;    true에 대한 경우를 검사하지 않기 때문이다.
;;    따라서, 아래와 같이 proper-blue-eyed-ancestor?에 대한 재귀 호출을
;;    blue-eyed-ancestor?로 변경한다.

;; proper-blue-eyed-ancestor? : ftn  ->  boolean
;; to determine whether a-ftree has a blue-eyed ancestor
(define (proper-blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree)))]))

(blue-eyed-ancestor? Eva)
(proper-blue-eyed-ancestor? Eva)
