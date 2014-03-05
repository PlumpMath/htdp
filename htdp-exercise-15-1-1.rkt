;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-15-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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



"(blue-eyed-descendant? Eva)의 연산 과정"
(blue-eyed-descendant? Eva)
(cond ((symbol=? (parent-eyes (make-parent Fred&Eva 'Eva 1965 'blue)) 'blue) true)
      (else (blue-eyed-children? (parent-children (make-parent Fred&Eva 'Eva 1965 'blue)))))
(cond ((symbol=? 'blue 'blue) true)
      (else (blue-eyed-children? (parent-children (make-parent Fred&Eva 'Eva 1965 'blue)))))
(cond (true true)
      (else (blue-eyed-children? (parent-children (make-parent Fred&Eva 'Eva 1965 'blue)))))
true

"(blue-eyed-descendant? Bettina)의 연산 과정"
(blue-eyed-descendant? Bettina)
(cond ((symbol=? (parent-eyes (make-parent Carl&Bettina 'Bettina 1926 'green)) 'blue) true)
      (else (blue-eyed-children? (parent-children (make-parent Carl&Bettina 'Bettina 1926 'green)))))
(cond ((symbol=? 'green 'blue) true)
      (else (blue-eyed-children? (parent-children (make-parent Carl&Bettina 'Bettina 1926 'green)))))
(cond (false true)
      (else (blue-eyed-children? (parent-children (make-parent Carl&Bettina 'Bettina 1926 'green)))))
(cond (else (blue-eyed-children? (parent-children (make-parent Carl&Bettina 'Bettina 1926 'green)))))
(blue-eyed-children? (parent-children (make-parent Carl&Bettina 'Bettina 1926 'green)))
(blue-eyed-children? Carl&Bettina)
(blue-eyed-children? (list Adam Dave Eva))
(cond ((empty? (list Adam Dave Eva)) false)
      (else (or (blue-eyed-descendant? (first (list Adam Dave Eva)))
                (blue-eyed-children? (rest (list Adam Dave Eva))))))
(cond (false false)
      (else (or (blue-eyed-descendant? (first (list Adam Dave Eva)))
                (blue-eyed-children? (rest (list Adam Dave Eva))))))
(cond (else (or (blue-eyed-descendant? (first (list Adam Dave Eva)))
                (blue-eyed-children? (rest (list Adam Dave Eva))))))
(or (blue-eyed-descendant? (first (list Adam Dave Eva)))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (blue-eyed-descendant? Adam)
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (cond ((symbol=? (parent-eyes (make-parent empty 'Adam 1950 'yellow)) 'blue) true)
          (else (blue-eyed-children? (parent-children (make-parent empty 'Adam 1950 'yellow)))))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (cond ((symbol=? 'yellow 'blue) true)
          (else (blue-eyed-children? (parent-children (make-parent empty 'Adam 1950 'yellow)))))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (cond (false true)
          (else (blue-eyed-children? (parent-children (make-parent empty 'Adam 1950 'yellow)))))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (cond (else (blue-eyed-children? (parent-children (make-parent empty 'Adam 1950 'yellow)))))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (blue-eyed-children? (parent-children (make-parent empty 'Adam 1950 'yellow)))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (blue-eyed-children? empty)
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (blue-eyed-children? empty)
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (cond ((empty? empty) false)
          (else (or (blue-eyed-descendant? (first a-loc))
                    (blue-eyed-children? (rest a-loc)))))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or (cond (true false)
          (else (or (blue-eyed-descendant? (first a-loc))
                    (blue-eyed-children? (rest a-loc)))))
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(or false
    (blue-eyed-children? (rest (list Adam Dave Eva))))
(blue-eyed-children? (rest (list Adam Dave Eva)))
(blue-eyed-children? (list Dave Eva))
;; ...
;; Dave의 경우 eyes: black / children: empty 이므로,
;; Adam의 경우와 연산과정이 동일하므로 생략함.
;; ...
(blue-eyed-children? (list Eva))
(cond ((empty? (list Eva)) false)
        (else (or (blue-eyed-descendant? (first (list Eva)))
                  (blue-eyed-children? (rest (list Eva))))))
(cond false false)
        (else (or (blue-eyed-descendant? (first (list Eva)))
                  (blue-eyed-children? (rest (list Eva))))))
(cond (else (or (blue-eyed-descendant? (first (list Eva)))
                (blue-eyed-children? (rest (list Eva))))))
(or (blue-eyed-descendant? (first (list Eva)))
    (blue-eyed-children? (rest (list Eva))))
(or (blue-eyed-descendant? (first (list Eva)))
    (blue-eyed-children? (rest (list Eva))))
(or (blue-eyed-descendant? Eva)
    (blue-eyed-children? (rest (list Eva))))
(or (cond ((symbol=? (parent-eyes (make-parent Fred&Eva 'Eva 1965 'blue)) 'blue) true)
          (else (blue-eyed-children? (parent-children (make-parent Fred&Eva 'Eva 1965 'blue)))))
    (blue-eyed-children? (rest (list Eva))))
(or (cond ((symbol=? 'blue 'blue) true)
          (else (blue-eyed-children? (parent-children (make-parent Fred&Eva 'Eva 1965 'blue)))))
    (blue-eyed-children? (rest (list Eva))))
(or (cond (true true)
          (else (blue-eyed-children? (parent-children (make-parent Fred&Eva 'Eva 1965 'blue)))))
    (blue-eyed-children? (rest (list Eva))))
(or true
    (blue-eyed-children? (rest (list Eva))))
true
