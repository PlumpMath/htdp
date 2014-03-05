;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-15-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
  (cond ((symbol=? (parent-eyes a-parent) 'blue) true)
        (else (blue-eyed-children? (parent-children a-parent)))))

(define (blue-eyed-children? a-loc)
  (cond ((empty? a-loc) false)
        (else (or (blue-eyed-descendant? (first a-loc))
                  (blue-eyed-children? (rest a-loc))))))

;; how-far-removed
;; parent -> number/boolean
(define (how-far-removed a-parent)
  (cond ((blue-eyed-descendant? a-parent) (how-far-removed-in-parent a-parent))
        (else false)))

(define (how-far-removed-in-parent a-parent)
  (cond ((symbol=? (parent-eyes a-parent) 'blue) 0)
        (else (how-far-removed-in-children (parent-children a-parent)))))

(define (how-far-removed-in-children a-loc)
  (cond ((empty? a-loc) 0)
        (else (max (+ 1 (how-far-removed-in-parent (first a-loc)))
                   (how-far-removed-in-children (rest a-loc))))))

;; count-descendants
(define (count-descendants a-parent)
  (+ 1 (count-descendants-in-children (parent-children a-parent))))

(define (count-descendants-in-children a-loc)
  (cond ((empty? a-loc) 0)
        (else (+ (count-descendants (first a-loc))
                 (count-descendants-in-children (rest a-loc))))))

(define (count-proper-descendants a-parent)
  (+ (count-descendants-in-children (parent-children a-parent))))

;; EXAMPLES OF DATA
(count-descendants Gustav)
(count-descendants Adam)
(count-descendants Eva)
(count-descendants Fred)
(count-descendants Carl)
(count-descendants Bettina)
(count-proper-descendants Gustav)
(count-proper-descendants Adam)
(count-proper-descendants Eva)
(count-proper-descendants Fred)
(count-proper-descendants Carl)
(count-proper-descendants Bettina)
