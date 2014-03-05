;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-6-2) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")))))
(define (draw-next-part part)
  (cond ((symbol=? part 'noose)
         (and (draw-solid-line (make-posn 40 20) (make-posn 134 20) 'black)
              (draw-solid-line (make-posn 40 20) (make-posn 40 400) 'black)
              (draw-circle (make-posn 180 60) 60 'black)
              (draw-solid-line (make-posn 180 40) (make-posn 200 60) 'black)
              (draw-solid-line (make-posn 200 40) (make-posn 180 60) 'black)
              (draw-solid-line (make-posn 220 40) (make-posn 240 60) 'black)
              (draw-solid-line (make-posn 240 40) (make-posn 220 60) 'black)))
        ((symbol=? part 'head)
         (draw-circle (make-posn 180 100) 20 'black))
        ((symbol=? part 'body)
         (draw-solid-line (make-posn 180 120) (make-posn 180 240) 'black))
        ((symbol=? part 'left-arm)
         (draw-solid-line (make-posn 180 150) (make-posn 150 200) 'black))
        ((symbol=? part 'right-arm)
         (draw-solid-line (make-posn 180 150) (make-posn 210 200) 'black))
        ((symbol=? part 'left-leg)
         (draw-solid-line (make-posn 180 240) (make-posn 170 360) 'black))
        ((symbol=? part 'right-leg)
         (draw-solid-line (make-posn 180 240) (make-posn 190 360) 'black))
        (else #true)))

#| 단어(w)
단어는 리스트이며 다음 중 하나다.
1. empty
2. (cons s w)
   s: 'a ~ 'z 또는 '_의 심볼
   w: 단어

;; template
(define (fun-for-w w)
  (cond ((empty? w) ...)
        (else ... (first w) ... (fun-for-w (rest w) ...))))
|#

#| reveal-list
w w symbol -> w
입력: 맞혀야 단어, 지금까지 맞힌 정보를 보여 주는 상태 단어, 이번에 추측하는 글자
출력: 새 단어의 글자들을 다음 조건에 따라 조합하여 출력한다.
     1. 추측한 단어의 글자와 맞혀야 할 단어의 글자가 동일한 경우: 맞혀야 할 단어의 글자
     2. 그렇지 않은 경우: 기존 상태 단어의 글자
|#
(define (reveal-list target current guess)
  (cond ((empty? target) empty)
        (else (cons (check-c (first target) (first current) guess)
                    (reveal-list (rest target) (rest current) guess)))))

(define (check-c c1 c2 c3)
  (cond ((symbol=? c1 c3) c1)
        ((not (symbol=? c2 '_)) c2)
        (else '_)))

;; examples
(reveal-list (list 't 'e 'a) (list '_ 'e '_) 'u)
"should"
(list '_ 'e '_)

(reveal-list (list 'a 'l 'e) (list 'a '_ '_) 'e)
"should"
(list 'a '_ 'e)

(reveal-list (list 'a 'l 'l) (list '_ '_ '_) 'l)
"should"
(list '_ 'l 'l)

(start 500 500)
(hangman-list reveal-list draw-next-part)

