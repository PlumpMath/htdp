;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct phone-record (name number))

(define (zip names numbers)
  (cond ((empty? names) empty)
        (else (cons (make-phone-record (first names) (first numbers))
                    (zip (rest names) (rest numbers))))))

;Examples as Tests:
(check-expect 
 (zip empty empty)
 empty)

(check-expect
 (zip (list 'john) (list 8739287))
 (list (make-phone-record 'john 8739287)))

(check-expect
 (zip (list 'john 'mary 'carol) 
      (list 8739287 4569354 4159654))
 (list (make-phone-record 'john 8739287)
       (make-phone-record 'mary 4569354)
       (make-phone-record 'carol 4159654)))
