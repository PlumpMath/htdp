;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

(define (sum an-inv)
  (cond
    [(empty? an-inv) 0]
    [else (+ (ir-price (first an-inv)) (sum (rest an-inv)))]))

(define (contains-doll? an-inv)
  (cond
    ((empty? an-inv) false)
    ((symbol=? (ir-name (first an-inv)) 'doll) true)
    (else (contains-doll? (rest an-inv)))))

(define (contains? asymbol an-inv)
  (cond
    ((empty? an-inv) false)
    ((symbol=? (ir-name (first an-inv)) asymbol) true)
    (else (contains? asymbol (rest an-inv)))))

(contains-doll? empty)
    
(contains-doll?
 (cons (make-ir 'robot 10)
       (cons (make-ir 'gun 99)
             (cons (make-ir 'doll 20)
                   empty))))

(contains-doll?
 (cons (make-ir 'doll 10)
       (cons (make-ir 'gun 99)
             (cons (make-ir 'game 20)
                   empty))))

(contains-doll?
 (cons (make-ir 'robot 10)
       (cons (make-ir 'gun 99)
             (cons (make-ir 'game 20)
                   empty))))

(contains? 'robot empty)
    
(contains?
 'robot
 (cons (make-ir 'robot 10)
       (cons (make-ir 'gun 99)
             (cons (make-ir 'doll 20)
                   empty))))

(contains?
 'robot
 (cons (make-ir 'doll 10)
       (cons (make-ir 'gun 99)
             (cons (make-ir 'game 20)
                   empty))))

(contains?
 'robot
 (cons (make-ir 'robot 10)
       (cons (make-ir 'gun 99)
             (cons (make-ir 'game 20)
                   empty))))
