;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| wp (웹페이지)
웹페이지는 다음 중 하나다.
1. empty
2. (cons s wp)
   s: symbol
   wp: wp
3. (cons ewp wp)
   ewp: wp
   wp: wp
|#

#| web=?
web-page web-page -> boolean
wp1, wp2가 같은 트리 구조를 가지고 동일한 순서로 기호들을 포함하는지 검사한다.
|#
(define (web=? wp1 wp2)
  (cond
    ((empty? wp1)
     (empty? wp2))
    ((symbol? (first wp1))
     (and (cons? wp2)
          (symbol? (first wp2))
          (symbol=? (first wp1) (first wp2))
          (web=? (rest wp1) (rest wp2))))
    (else
     (and (cons? wp2)
          (cons? (first wp2))
          (web=? (first wp1) (first wp2))
          (web=? (rest wp1) (rest wp2))))))


#| case tables for wp
wp1의 경우
- (empty? wp1)
- (and (cons? wp1) (symbol? (first wp1)))
- (and (cons? wp1) (cons? (first wp1)))

wp2의 경우
- (empty? wp2)
- (and (cons? wp2) (symbol? (first wp2)))
- (and (cons? wp2) (cons? (first wp2)))

wp1의 경우들과 wp2의 경우들을 각각 and로 조합해 총 9가지 경우가 있음.
|#


;; examples
(define wp1 empty)
(define wp2 (cons 'oh empty))
(define wp3 (cons 'ah empty))
(define wp4 (list 'oh 'my 'god))
(define wp5 (list 'oh 'my 'cat))
(define wp6 (list 'oh 'my (list (list 'love-of-my-heart 'love-of-my-soul) 'god 'mom 'cat)))
(define wp7 (list 'oh 'my (list (list 'love-of-my-heart 'lust-of-my-soul) 'god 'mom 'cat)))

(web=? wp1 wp1)
(web=? wp2 wp2)
(web=? wp3 wp3)
(web=? wp4 wp4)
(web=? wp5 wp5)
(web=? wp6 wp6)
(web=? wp7 wp7)
(not (web=? wp1 wp2))
(not (web=? wp2 wp1))
(not (web=? wp2 wp3))
(not (web=? wp4 wp5))
(not (web=? wp6 wp7))
