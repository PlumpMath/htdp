;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct parent (children name date eyes))
#| 부모는 구조체다.
(make-parent loc n d e)
loc는 자식 리스트이고, n(이름)과 e(눈 색깔)는 기호이며, d(생일)는 숫자다.

;; template
(define (fun-for-parent a-parent)
  ... (parent-children a-parent) ...
  ... (parent-name a-parent) ...
  ... (parent-date a-parent) ...
  ... (parent-eyes a-parent) ...)
|#

#|
자식 리스트(list-of-children)는 다음 두 가지 중 하나다.
1. empty
2. (cons p loc): p는 부모이고, loc는 자식 리스트.

;; template
(define (fun-for-loc a-loc)
  (cond ((empty? a-loc) ...)
        (else ... (first a-loc) ... (fun-for-loc (rest a-loc)))))
|#

(define Gustav (make-parent empty 'Gustav 1988 'brown))
(define Fred&Eva (list Gustav))

(define Adam (make-parent empty 'Adam 1950 'yellow))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'blue))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))

(define Carl&Bettina (list Adam Dave Eva))

(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))


;; blue-eyed-descendant?
;; parent -> boolean
;; a-parent나 그 자손들 중에 eyes 필드가 'blue인 항목이 존재하는지 검사한다.
(define (blue-eyed-descendant? a-parent)
  (local ((define (blue-eyed-children? a-loc)
            (cond ((empty? a-loc) false)
                  (else (or (blue-eyed-descendant? (first a-loc))
                            (blue-eyed-children? (rest a-loc)))))))
    (cond ((symbol=? (parent-eyes a-parent) 'blue) true)
          (else (blue-eyed-children? (parent-children a-parent))))))

"(blue-eyed-descendant? Bettina)"
(blue-eyed-descendant? Bettina)

"(blue-eyed-descendant? Fred)"
(blue-eyed-descendant? Fred)

"(blue-eyed-descendant? Adam)"
(blue-eyed-descendant? Adam)

"(blue-eyed-descendant? Dave)"
(blue-eyed-descendant? Dave)

"(blue-eyed-descendant? Carl)"
(blue-eyed-descendant? Carl)

"(blue-eyed-descendant? Gustav)"
(blue-eyed-descendant? Gustav)

