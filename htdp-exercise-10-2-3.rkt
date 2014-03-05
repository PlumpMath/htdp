;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-10-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct toy (name price))

(define (price-of target-toy-name toy-list)
  (cond ((empty? toy-list) (error 'price-of "no such toy found"))
        ((symbol=? (toy-name (first toy-list)) target-toy-name) (toy-price (first toy-list)))
        (else (price-of target-toy-name (rest toy-list)))))

(price-of 'robot
          (cons (make-toy 'doll 1000)
                (cons (make-toy 'robot 2000)
                      (cons (make-toy 'book 3000)
                            empty))))

(price-of 'doll
          (cons (make-toy 'doll 1000)
                (cons (make-toy 'robot 2000)
                      (cons (make-toy 'book 3000)
                            empty))))

(price-of 'book
          (cons (make-toy 'doll 1000)
                (cons (make-toy 'robot 2000)
                      (cons (make-toy 'book 3000)
                            empty))))


(price-of 'jar
          (cons (make-toy 'doll 1000)
                (cons (make-toy 'robot 2000)
                      (cons (make-toy 'book 3000)
                            empty))))

