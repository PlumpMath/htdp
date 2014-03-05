;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct worker (name ssn wph))
#| worker
worker는 다음 구조체다.
(make-worker name ssn wph)
필드 내용
- name(symbol) : 이름
- ssn(symbol) : 주민번호
- wph(number) : 근로시간당 급여

;; template
(define (fun-for-worker a-worker)
  ... (worker-name a-worker) ...
  ... (worker-ssn a-worker) ...
  ... (worker-wph a-worker) ...)
|#

#| 근로자 리스트(LOW)
근로자 리스트는 리스트이며, 다음 중 하나다.
1. empty
2. (cons w low) : w: worker / low: list-of-workers

;; template
(define (fun-for-low a-low)
  (cond ((empty? a-low) ...)
        (else (first a-low) (fun-for-low (rest a-low)))))
|#

(define-struct task (name-of-worker worked-hours))
#| task
task는 다음 구조체다.
(make-task name-of-worker worked-hours)
필드 내용
- name-of-worker(symbol) : 근로자의 이름
- worked-hours : 근로자가 1주일간 일한 시간

;; template
(define (fun-for-task a-task)
  ... (task-name-of-worker a-task) ...
  ... (task-worked-hours a-task) ...)
|#

#| 작업 리스트(LOT)
작업 리스트는 리스트이며, 다음 중 하나다.
1. empty
2. (cons t lot) : t: task / lot: list-of-tasks

;; template
(define (fun-for-lot a-lot)
  (cond ((empty? a-lot) ...)
        (else (first a-lot) (fun-for-lot (rest a-lot)))))
|#

(define-struct wage (name w))
#| wage
wage는 다음 구조체다.
(make-wage name w)
필드 내용
- name : 근로자의 이름
- w : 봉급
|#

#| 봉급 리스트(LOWAGE)
봉급 리스트(LOWAGE)는 다음 중 하나다.
1. empty
2. (cons w lowage) : w는 wage, lowage는 LOWAGE
|#

;; hours->wages
;; list-of-workers list-of-tasks -> list-of-wages
;; 근로자 리스트와 작업 리스트를 입력받아, 봉급 리스트를 반환한다.
;; 가정: 두 리스트의 길이는 같다.
(define (hours->wages workers tasks)
  (cond ((empty? workers) empty)
        (else (cons (worker/task->wage (first workers) (first tasks))
                    (hours->wages (rest workers) (rest tasks))))))

(define (worker/task->wage w t)
  (make-wage (worker-name w)
             (* (worker-wph w) (task-worked-hours t))))

;; examples for hours->wages



;define some list-of-employees to be used in the tests
(define twoEmployees
  (list (make-worker 'john '123-78-6548 12.50)
        (make-worker 'mary '892-46-3891 14.25)))

(define fiveEmployees
  (list (make-worker 'john '123-78-6548 12.50)
        (make-worker 'mary '892-46-3891 14.25)
        (make-worker 'bill '654-78-9665 14.80)
        (make-worker 'walter '564-89-9659 15.95)
        (make-worker 'sally '567-78-9658 16.15)))

;define some list-of-work-records to be used in the tests
(define twoWorkRecords
  (list (make-task 'john 36.5)
        (make-task 'mary 42)))

(define fiveWorkRecords
  (list (make-task 'john 36.5)
        (make-task 'mary 42)
        (make-task 'bill 32)
        (make-task 'walter 38)
        (make-task 'sally 37.5)))




;Examples as Tests:
(hours->wages empty empty)
"should"
empty

(hours->wages
 (list (make-worker 'john '123-78-6548 12.50))
 (list (make-task 'john 36.5)))
"should"
(list (make-wage 'john 456.25))

(hours->wages twoEmployees twoWorkRecords)
"should"
(list
 (make-wage 'john 456.25)
 (make-wage 'mary 598.5))

(hours->wages fiveEmployees fiveWorkRecords)
"should"
(list
 (make-wage 'john 456.25)
 (make-wage 'mary 598.5)
 (make-wage 'bill 473.6)
 (make-wage 'walter 606.1)
 (make-wage 'sally 605.625))
