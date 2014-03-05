;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-6-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| DNAprefix
list list -> boolean
입력: DNA 패턴 심볼 리스트, 검색 대상 심볼 리스트
출력: 1. DNA 패턴이 검색 대상 심볼 리스트의 접두사일 경우 true
     2. 그렇지 않은 경우 false
|#
(define (DNAprefix pattern ss)
  (cond ((and (empty? pattern) (empty? ss)) true)
        ((and (empty? pattern) (cons? ss)) true)
        ((and (cons? pattern) (empty? ss)) false)
        ((and (cons? pattern) (cons? ss))
         (and (symbol=? (first pattern) (first ss))
              (DNAprefix (rest pattern) (rest ss))))))

(DNAprefix (list 'a 't) (list 'a 't 'c))
(not (DNAprefix (list 'a 't) (list 'a)))
(DNAprefix (list 'a 't) (list 'a 't))
(not (DNAprefix (list 'a 'c 'g 't) (list 'a 'g)))
(not (DNAprefix (list 'a 'a 'c 'c) (list 'a 'c)))

;; 축약된 버전
(define (simplified-DNAprefix pattern ss)
  (cond ((and (empty? pattern) (empty? ss)) true)
        ((empty? pattern) true)
        ((empty? ss) false)
        (else (and (symbol=? (first pattern) (first ss))
                   (simplified-DNAprefix (rest pattern) (rest ss))))))

;; examples
(simplified-DNAprefix (list 'a 't) (list 'a 't 'c))
(not (simplified-DNAprefix (list 'a 't) (list 'a)))
(simplified-DNAprefix (list 'a 't) (list 'a 't))
(not (simplified-DNAprefix (list 'a 'c 'g 't) (list 'a 'g)))
(not (simplified-DNAprefix (list 'a 'a 'c 'c) (list 'a 'c)))

;; 축약할 때 주의할 점
;; - 두 리스트가 모두 empty인지 검사했을 때 false가 나온 상황에서,
;;   남은 조건에서 empty 검사를 생략해도 되는 것이 아니라, cons 검사를 생략해도 된다.
;;   A, B 둘다 empty인 것이 아니라면,
;;   [A, B가 모두 cons인 경우, A만 cons인 경우, B만 cons인 경우] 세 가지 경우가 있기 때문이다.
;;   따라서 A, B 중 무엇이 cons인지가 아니라, 무엇이 empty인지를 검사해야 한다.

;; 둘 다 빈 경우를 false로 본 경우의 축약 버전
(define (other-simplified-DNAprefix pattern ss)
  (cond ((or (empty? pattern) (empty? ss)) false)
        ((empty? (rest pattern)) (symbol=? (first pattern) (first ss)))
        (else (and (symbol=? (first pattern) (first ss))
                   (other-simplified-DNAprefix (rest pattern) (rest ss))))))

;; examples
(other-simplified-DNAprefix (list 'a 't) (list 'a 't 'c))
(not (other-simplified-DNAprefix (list 'a 't) (list 'a)))
(other-simplified-DNAprefix (list 'a 't) (list 'a 't))
(not (other-simplified-DNAprefix (list 'a 'c 'g 't) (list 'a 'g)))
(not (other-simplified-DNAprefix (list 'a 'a 'c 'c) (list 'a 'c)))


#| 수정된 버전 (modified-DNAprefix)
list list -> symbol or boolean
입력: DNA 패턴 심볼 리스트, 검색 대상 심볼 리스트
출력: 1. DNA 패턴이 검색 대상 심볼 리스트의 접두사일 경우, 접두사를 제외한 나머지 부분의 첫 글자
     2. 패턴이 문자열의 접두사가 아닌 경우, false
     3. 패턴의 길이가 문자열의 길이보다 긴 경우, false
     4. 두 리스트의 길이가 동일하고 리스트가 서로 같은 경우, true
|#
(define (modified-DNAprefix pattern ss)
  (cond ((and (empty? pattern) (empty? ss)) true)
        ((and (empty? pattern) (cons? ss)) (first ss))
        ((and (cons? pattern) (empty? ss)) false)
        ((and (cons? pattern) (cons? ss))
         (cond ((boolean? (DNAprefix (rest pattern) (rest ss))) (modified-DNAprefix (rest pattern) (rest ss)))
               ((symbol=? (first pattern) (first ss)) (modified-DNAprefix (rest pattern) (rest ss)))
               (else (modified-DNAprefix (rest pattern) (rest ss)))))))


;; examples
(modified-DNAprefix (list 'a 't) (list 'a 't 'c))
"should"
'c

(modified-DNAprefix (list 'a 't) (list 'a))
"should"
false

(modified-DNAprefix (list 'a 't) (list 'a 't))
"should"
true

(modified-DNAprefix (list 'a 'c 'g 't) (list 'a 'g))
"shoule"
false

(modified-DNAprefix (list 'a 'a 'c 'c) (list 'a 'c))
"shoule"
false


#| 수정된 버전의 축약 버전 (simplified-modified-DNAprefix)
list list -> symbol or boolean
입력: DNA 패턴 심볼 리스트, 검색 대상 심볼 리스트
출력: 1. DNA 패턴이 검색 대상 심볼 리스트의 접두사일 경우, 접두사를 제외한 나머지 부분의 첫 글자
     2. 패턴이 문자열의 접두사가 아닌 경우, false
     3. 패턴의 길이가 문자열의 길이보다 긴 경우, false
     4. 두 리스트의 길이가 동일하고 리스트가 서로 같은 경우, true
|#
(define (simplified-modified-DNAprefix pattern ss)
  (cond ((and (empty? pattern) (empty? ss)) true)
        ((empty? pattern) (first ss))
        ((empty? ss) false)
        (else
         (cond ((symbol=? (first pattern) (first ss))
                (simplified-modified-DNAprefix (rest pattern) (rest ss)))
               (else false)))))

;; 마지막 조건절에서, 불린값 여부 검사를 수행할 필요 없음.

;; examples
(simplified-modified-DNAprefix (list 'a 't) (list 'a 't 'c))
"should"
'c

(simplified-modified-DNAprefix (list 'a 't) (list 'a))
"should"
false

(simplified-modified-DNAprefix (list 'a 't) (list 'a 't))
"should"
true

(simplified-modified-DNAprefix (list 'a 'c 'g 't) (list 'a 'g))
"shoule"
false

(simplified-modified-DNAprefix (list 'a 'a 'c 'c) (list 'a 'c))
"shoule"
false
