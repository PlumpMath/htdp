;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-15-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
  (cond ((symbol=? (parent-eyes a-parent) 'blue) 0)
        ((number? (how-far-removed-in-children (parent-children a-parent))) ;; same as (how-far-removed-in-children a-parent)
         (add1 (how-far-removed-in-children (parent-children a-parent))))
        (else false)))

(define (how-far-removed-in-children a-loc)
  (cond ((empty? a-loc) false)
        (else (closer-distance (how-far-removed (first a-loc))
                               (how-far-removed-in-children (rest a-loc))))))

(define (closer-distance a b)
  (cond ((and (number? a) (number? b)) (min a b))
        ((and (number? a) (boolean? b)) a)
        ((and (boolean? a) (number? b)) b)
        ((and (boolean? a) (boolean? b)) false)))

#| wrong version
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
|#

;; EXAMPLES OF DATA
(define robby (make-parent empty "Robby" 1972 'blue))
(define ted (make-parent empty "Ted" 1975 'brown))
(define pat (make-parent empty "Pat" 1978 'brown))
(define pete (make-parent empty "Pete" 1982 'brown))
(define alice (make-parent (list robby ted pat pete) "Alice" 1949 'blue))
(define bill (make-parent (list robby ted pat pete) "Bill" 1949 'brown))
(define lolly (make-parent empty "Lolly" 1951 'blue))
(define tutu (make-parent (list alice lolly) "Tutu" 1911 'brown))
(define anna (make-parent (list tutu) "Anna" 1880 'black))
(define dolby (make-parent (list anna) "Dolby" 1850 'black))

;; EXAMPLES AS TESTS
(how-far-removed ted) "should be" false
(how-far-removed robby) "should be" 0
(how-far-removed alice) "should be" 0
(how-far-removed bill) "should be" 1
(how-far-removed tutu) "should be" 1
(how-far-removed anna) "should be" 2
(how-far-removed dolby) "should be" 3
