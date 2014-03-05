;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-9-pass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; cons 만으로는 너무 복잡해져서 list와 append를 사용하였음.
;; rest로 인해 잘린 앞부분을 어떻게 복원할 것인가? -> insert-heads 참고


#| w (word)
w는 단어를 의미하는 기호 리스트이며, 다음 중 하나다.
1. empty
2. (cons s w)
   - s = symbol
   - w = word
|#

#| low (list-of-words)
low는 단어 리스트이며, 다음 중 하나다.
1. empty
2. (cons w low)
   - w = word
   - low = list-of-words
|#

;; word examples
(define w1 empty)
(define w2 (list 'a 'd 'e 'r))
(define w3 (list 'e 'x 'a 'm 'p 'l 'e))

;; list-of-words example
(define low1 empty)
(define low2 (list empty))
(define low3 (list (list 'a)))
(define low4 (list (list 'a) (list 'b)))
(define low5 (list (list 'a) (list 'b) (list 'a 'd 'e 'r)))

;; arrangements
;; w -> low
(define (arrangements w)
  (local
     ;; insert-everywhere/in-all-words
     ;; symbol low -> low
    ((define (insert-everywhere/in-all-words s low)
       (cond
         ((empty? low) empty)
         (else
          (append (insert s (first low))
                  (insert-everywhere/in-all-words s (rest low))))))
     ;; insert
     ;; symbol w -> low
     (define (insert s w)
       (cond
         ((empty? w)
          (list (list s)))
         (else
          (cons (cons s w)
                (insert-heads (first w) (insert s (rest w)))))))
     ;; insert-heads
     ;; symbol low -> low
     (define (insert-heads head low)
       (cond
         ((empty? low)
          empty)
         (else
          (append (list (cons head (first low)))
                  (insert-heads head (rest low)))))))
    (cond
      ((empty? w) (cons empty empty))
      (else (insert-everywhere/in-all-words (first w)
                                            (arrangements (rest w)))))))

;; example
(arrangements empty)
(cons empty empty)

(arrangements (cons 'a empty))
(cons (cons 'a
            empty)
      empty)

(arrangements (cons 'a (cons 'd empty)))
(cons (cons 'a
            (cons 'd
                  empty))
      (cons (cons 'd
                  (cons 'a
                        empty))
            empty))

(arrangements (cons 'e (cons 'r empty)))
(cons (cons 'e
            (cons 'r
                  empty))
      (cons (cons 'r
                  (cons 'e
                        empty))
            empty))
