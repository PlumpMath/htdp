;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-15-3-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| 웹 페이지(WP)
웹 페이지(WP)는 다음 구조체다.
(make-wp h p) : h는 기호고, p는 웹 문서다.

;; template
(define (fun-for-wp a-wp)
  ... (wp-header a-wp) ...
  ... (wp-body a-wp) ...)
|#


#| 웹 문서(WD)
웹 문서(WD)는 리스트 형태의 자료구조이며, 다음 세 가지 중 하나다.
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
        (else (error 'fun-for-wd "wrong web-document"))))
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

;; wp-to-file
;; web-page -> list-of-symbols
;; 웹 페이지를 입력받아 기호 리스트를 출력한다.
;; 리스트에는 body에 들어 있는 모든 단어와, 내장된 웹 페이지의 모든 header가 들어있다.
;; 내장된 웹 페이지의 body 부분은 무시한다.
(define (wp-to-file a-wp)
  (append (collect-symbols-in-body (wp-body a-wp))
          (collect-wp-headers-in-wd (wp-body a-wp))))

(define (collect-symbols-in-body a-wd)
  (cond ((empty? a-wd) empty)
        ((cons? a-wd)
         (cond ((symbol? (first a-wd))
                (cons (first a-wd) (collect-symbols-in-body (rest a-wd))))
               ((wp? (first a-wd))
                (collect-symbols-in-body (rest a-wd)))))
        (else (error 'collect-symbols-in-body "wrong web-document"))))

(define (collect-wp-headers-in-wd a-wd)
  (cond ((empty? a-wd) empty)
        ((cons? a-wd)
         (cond ((symbol? (first a-wd))
                (collect-wp-headers-in-wd (rest a-wd)))
               ((wp? (first a-wd))
                (append (list (wp-header (first a-wd))) (collect-wp-headers-in-wd (rest a-wd))))))
        (else (error 'fun-for-wd "wrong web-document"))))

;; data examples:
(define empty-page (make-wp 'empty-page empty))
(define page-1-word (make-wp 'page-1-word (cons 'w1 empty)))
(define page-2-words (make-wp 'page-2-words (list 'w1 'w2)))
(define with-1-word-subpage (make-wp 'page-1-word-with-subpage (cons page-1-word empty)))
(define with-2-words-subpage (make-wp 'with-2-words-subpage (cons page-2-words empty)))
(define dense-page1 (make-wp 'realistic (list 'w3  page-2-words 'w4 page-1-word 'w5)))
(define dense-page2 (make-wp 'realistic (list 'w3  empty-page 'w4 with-1-word-subpage 'w5)))

;; test cases

;; test for 'wp-to-file'
(wp-to-file empty-page) "should" (list)
(wp-to-file page-1-word) "should" (list 'w1)
(wp-to-file page-2-words) "should" (list 'w1 'w2)
(wp-to-file with-1-word-subpage) "should" (list 'page-1-word)
(wp-to-file with-2-words-subpage) "should" (list 'page-2-words)
(wp-to-file dense-page1) "should" (list 'w3 'page-2-words 'w4 'page-1-word 'w5)
(wp-to-file dense-page2) "should" (list 'w3 'empty-page 'w4 'page-1-word-with-subpage 'w5)

;; --- end test code
