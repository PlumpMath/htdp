;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-15-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| 웹 페이지(WP)
웹 페이지(WP)는 다음 구조체다.
(make-wp h p) : h는 기호고, p는 웹 문서다.

;; template
(define (fun-for-wp a-wp)
  ... (wp-header a-wp) ...
  ... (wp-body a-wp) ...)
|#


#| 웹 문서(WD)
웹 문서(WD)는 다음 세 가지 중 하나다.
1. empty
2. (cons s p) : s는 기호고, p는 웹 문서다.
3. (cons w p) : w는 웹 페이지고, p는 웹 문서다.

;; template
(define (fun-for-wd a-wd)
  (cond ((empty? a-wd) ...)
        ((cons? a-wd)
         (cond ((symbol? (first a-wd))
                ... (first a-wd) ... (fun-for-wd (rest a-wd)) ...)
               ((wp? (first a-wd))
                ... (first a-wd) ... (fun-for-wd (rest a-wd)) ...)))
        (else (error fun-for-wd "wrong web-document"))))
|#

(define-struct wp (header body))

;; size
;; web-page -> number
;; 웹 페이지를 입력받아 여기에 기호(단어)가 몇 개 포함되어 있는지 계산한다.
(define (size a-wp)
  (number-of-symbols-in-wd (wp-body a-wp)))

;; number-of-symbols-in-wd
;; web-document -> number
;; 웹 문서를 입력받아 여기에 기호(단어)가 몇 개 포함되어 있는지 계산한다.
(define (number-of-symbols-in-wd a-wd)
  (cond ((empty? a-wd) 0)
        ((cons? a-wd)
         (cond ((symbol? (first a-wd))
                (+ 1 (number-of-symbols-in-wd (rest a-wd))))
               ((wp? (first a-wd))
                (number-of-symbols-in-wd (rest a-wd)))))
        (else (error 'number-of-symbols-in-wd "wrong web-document"))))


;; EXAMPLE WEB PAGES
(define dogs-wp
  (make-wp 'dogs-wp 
           (list 'my 'dogs 'web 'page)))

(define cats-wp
  (make-wp 'cats-wp
           (list 'my 'cats 'web 'page)))

(define my-wp
  (make-wp 'my-wp
           (list 'see 'my 'dog dogs-wp
                 'see 'my 'cat cats-wp)))

;; EXAMPLES AS TESTS
(size dogs-wp) "should be" 4
(size cats-wp) "should be" 4
(size my-wp) "should be" 6

