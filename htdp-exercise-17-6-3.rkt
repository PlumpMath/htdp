;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-6-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct worker (name sn wr))
#| 직원 정보(worker)
직원 정보(worker)는 다음 구조체다.
(make-worker name sn wr)
- name: 이름
- sn: 사원번호
- wr: 급여율

;; template
(define (fun-for-worker w)
  ... (worker-name w) ...
  ... (worker-sn w) ...
  ... (worker-wr w) ...)
|#

#| 직원 정보 리스트(ws)
직원 정보 리스트는 다음 중 하나다.
1. empty
2. (cons w ws)
   w: 직원 정보
   ws: 직원 정보 리스트

;; template
(define (fun-for-ws ws)
  (cond ((empty? ws) ...)
        (else ... (first ws) ... (rest ws) ...)))
|#

(define-struct card (sn whs))

#| 출퇴근 카드(card)
출퇴근 카드는 다음 구조체다.
(make-card sn whs)
- sn: 사원번호
- whs: 근무시간
|#

#| 출퇴근 카드 리스트(cs)
출퇴근 카드 리스트는 다음 중 하나다.
1. empty
2. (cons c cs)
   c: 출퇴근 카드
   cs: 출퇴근 카드 리스트

;; template
(define (fun-for-cs cs)
  (cond ((empty? cs) ...)
        (else ... (first cs) ... (rest cs) ...)))
|#


#| hours->wages2
ws cs -> list-of-numbers
입력: 직원 정보 리스트와 출퇴근 카드 리스트
출력: 주급 리스트
|#
(define (hours->wages2 ws cs)
  (hours->wages2-loop (sort-ws ws) (sort-cs cs)))

(define (hours->wages2-loop ws cs)
  (cond ((and (empty? ws) (empty? cs)) empty)
        ((and (cons? ws) (cons? cs)) (cons (calc-wage (first ws) (first cs))
                                           (hours->wages2-loop (rest ws) (rest cs))))
        (else (error 'hours->wages2-loop "wrong data"))))

#| calc-wage
w c -> number
입력: 직원 정보와 출퇴근 카드
출력: 주급
|#
(define (calc-wage w c)
  (cond ((= (worker-sn w) (card-sn c)) (* (worker-wr w) (card-whs c)))
        (else (error 'calc-wage "serial numbers aren't match"))))

#| sort-ws
ws -> ws
직원 정보 리스트를 사원번호(sn)으로 정렬함
|#
(define (sort-ws ws)
  (cond ((empty? ws) empty)
        (else (insert-ws (sort-ws (rest ws)) (first ws)))))

(define (insert-ws l e)
  (cond ((empty? l) (cons e empty))
        ((< (worker-sn e) (worker-sn (first l))) (cons e l))
        (else (cons (first l) (insert-ws (rest l) e)))))

#| sort-cs
ws -> ws
출퇴근 카드 리스트를 사원번호(sn)로 정렬함
|#
(define (sort-cs cs)
  (cond ((empty? cs) empty)
        (else (insert-cs (sort-cs (rest cs)) (first cs)))))

(define (insert-cs l e)
  (cond ((empty? l) (cons e empty))
        ((< (card-sn e) (card-sn (first l))) (cons e l))
        (else (cons (first l) (insert-cs (rest l) e)))))

;; examples
(define ws1 (list (make-worker 'Andre 1004 10) (make-worker 'Baker 1008 20) (make-worker 'Christine 1007 9) (make-worker 'Drake 1003 8)))
(define cs1 (list (make-card 1004 40) (make-card 1003 30) (make-card 1007 25) (make-card 1008 32)))
(define cs2 (list (make-card 1005 37) (make-card 1003 30) (make-card 1007 25) (make-card 1008 32)))
(sort-ws ws1)
(sort-cs cs1)
(hours->wages2 empty empty)
(hours->wages2 ws1 cs1)

;; error examples
;; (hours->wages2 ws1 cs2)
;; (hours->wages2 empty cs1)
;; (hours->wages2 ws1 empty)

