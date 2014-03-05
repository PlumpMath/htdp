;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-14-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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


(blue-eyed-ancestor? Carl)
(cond
  ((empty? Carl) false)
  (else (or (symbol=? 'blue (child-eyes Carl))
              (blue-eyed-ancestor? (child-father Carl))
              (blue-eyed-ancestor? (child-mother Carl)))))
(cond
  (false false)
  (else (or (symbol=? 'blue 'green)
              (blue-eyed-ancestor? empty)
              (blue-eyed-ancestor? empty))))
(or false false false)
false

(blue-eyed-ancestor? empty)
(cond
  ((empty? empty) false)
  (else (or (symbol=? 'blue (child-eyes empty))
              (blue-eyed-ancestor? (child-father empty))
              (blue-eyed-ancestor? (child-mother empty)))))
(cond
  (true false))
false

(blue-eyed-ancestor? Gustav)
(cond
  ((empty? Gustav) false)
  (else (or (symbol=? 'blue (child-eyes Gustav))
              (blue-eyed-ancestor? (child-father Gustav))
              (blue-eyed-ancestor? (child-mother Gustav)))))
(cond
  (false false)
  (else (or (symbol=? 'blue (child-eyes Gustav))
              (blue-eyed-ancestor? (child-father Gustav))
              (blue-eyed-ancestor? (child-mother Gustav)))))
(or (symbol=? 'blue (child-eyes Gustav))
    (blue-eyed-ancestor? (child-father Gustav))
    (blue-eyed-ancestor? (child-mother Gustav)))
(or (symbol=? 'blue 'green)
    (blue-eyed-ancestor? Fred)
    (blue-eyed-ancestor? Eva))
(or false
    (blue-eyed-ancestor? Fred)
    (blue-eyed-ancestor? Eva))
(or false
    false
    (blue-eyed-ancestor? Eva))
(or false
    false
    (cond
      (false false)
      (else (or (symbol=? 'blue (child-eyes Eva))
                (blue-eyed-ancestor? (child-father Eva))
                (blue-eyed-ancestor? (child-mother Eva))))))
(or false
    false
   (or (symbol=? 'blue (child-eyes Eva))
       (blue-eyed-ancestor? (child-father Eva))
       (blue-eyed-ancestor? (child-mother Eva))))
(or false
    false
   (or (symbol=? 'blue 'blue)
       (blue-eyed-ancestor? (child-father Eva))
       (blue-eyed-ancestor? (child-mother Eva))))
(or false
    false
   (or true
       (blue-eyed-ancestor? (child-father Eva))
       (blue-eyed-ancestor? (child-mother Eva))))
(or false
    false
    true)
true
