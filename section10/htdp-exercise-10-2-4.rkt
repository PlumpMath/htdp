;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct phonebook (name number))

(define (whose-number number l)
  (cond ((empty? l) empty)
        ((= (phonebook-number (first l)) number) (phonebook-name (first l)))
        (else (whose-number number (rest l)))))

(define (phone-number name l)
  (cond ((empty? l) empty)
        ((symbol=? (phonebook-name (first l)) name) (phonebook-number (first l)))
        (else (phone-number name (rest l)))))

(whose-number 0 empty)

(whose-number 0 (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(whose-number 1000 (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(whose-number 2000 (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(whose-number 3000 (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(phone-number 'rat empty)

(phone-number 'rat (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(phone-number 'cat (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(phone-number 'dog (cons (make-phonebook 'cat 1000)
                         (cons (make-phonebook 'dog 2000)
                               (cons (make-phonebook 'dragon 3000)
                                     empty))))

(phone-number 'dragon (cons (make-phonebook 'cat 1000)
                            (cons (make-phonebook 'dog 2000)
                                  (cons (make-phonebook 'dragon 3000)
                                        empty))))
