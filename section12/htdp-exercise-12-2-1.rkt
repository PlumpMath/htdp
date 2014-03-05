;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-12-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct mail (from date message))

;; 날짜로 정렬
(define (sort-mail-by-date lst)
  (cond ((empty? lst) empty)
        (else (sort-mail-by-date-1 (first lst)
                           (sort-mail-by-date (rest lst))))))

(define (sort-mail-by-date-1 elm dst)
  (cond ((empty? dst) (cons elm dst))
        ((mail-date<? elm (first dst)) (cons elm dst))
        (else (cons (first dst)
                    (sort-mail-by-date-1 elm (rest dst))))))

(define (mail-date<? m1 m2)
  (< (mail-date m1)
     (mail-date m2)))

;; 이름으로 정렬
(define (sort-mail-by-name lst)
  (cond ((empty? lst) empty)
        (else (sort-mail-by-name-1 (first lst)
                           (sort-mail-by-name (rest lst))))))

(define (sort-mail-by-name-1 elm dst)
  (cond ((empty? dst) (cons elm dst))
        ((mail-name<? elm (first dst)) (cons elm dst))
        (else (cons (first dst)
                    (sort-mail-by-name-1 elm (rest dst))))))

(define (mail-name<? m1 m2)
  (string<? (mail-from m1)
            (mail-from m2)))


;; TEST
""
"--- SORT MAIL BY DATE ---"
(define example-list-of-mail-messages
  (cons
   (make-mail "Ronnie" 1980 "Don't forget my number!")
   (cons
    (make-mail "Richard" 1960 "I am not a crook")
    (cons
     (make-mail "George" 1990 "No new taxes")
     empty))))

(sort-mail-by-date empty) "should be" empty
(sort-mail-by-date example-list-of-mail-messages)
"should be"
(cons
 (make-mail "Richard" 1960 "I am not a crook")
 (cons
  (make-mail "Ronnie" 1980 "Don't forget my number!")
  (cons
   (make-mail "George" 1990 "No new taxes")
   empty)))

""
"--- SORT MAIL BY NAME ---"
(sort-mail-by-name
 (cons (make-mail "Tim" 1911 "hi") empty))
"should be"
(cons (make-mail "Tim" 1911 "hi") empty)

(sort-mail-by-name
 (cons
  (make-mail "Pola" 1911 "Chocolate")
  (cons
   (make-mail "Neo" 1900 "Vanilla")
   (cons
    (make-mail "Tin" 1922 "Strawberry")
    empty))))
"should be"
(cons
 (make-mail "Neo" 1900 "Vanilla")
 (cons
  (make-mail "Pola" 1911 "Chocolate")
  (cons
   (make-mail "Tin" 1922 "Strawberry")
   empty)))

(sort-mail-by-name empty) "should be" empty
(sort-mail-by-name example-list-of-mail-messages)
"should be"
(cons
 (make-mail "George" 1990 "No new taxes")
 (cons
  (make-mail "Richard" 1960 "I am not a crook")
  (cons
   (make-mail "Ronnie" 1980 "Don't forget my number!")
   empty)))

