;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-15-3-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct wp (header body))
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

;; occurs
;; symbol, web-page -> boolean
;; 기호와 웹 페이지를 입력받아 해당 기호가 웹페이지에 나타나는지 검사한다.
;; 내장된 웹 페이지도 함께 검사한다.
(define (occurs s a-wp)
  (occurs-in-wd s (wp-body a-wp)))

(define (occurs-in-wd s a-wd)
  (cond ((empty? a-wd) false)
        ((cons? a-wd)
         (cond ((symbol? (first a-wd))
                (or (symbol=? (first a-wd) s)
                    (occurs-in-wd s (rest a-wd))))
               ((wp? (first a-wd))
                (or (occurs s (first a-wd))
                    (occurs-in-wd s (rest a-wd))))))
        (else (error 'occurs-in-wd "wrong web-document"))))

;; find
;; web-page, symbol -> boolean or list-of-symbols
;; 이 함수는 웹 페이지와 기호를 입력받는다.
;; 만일 기호가 웹페이지의 body나 내장된 웹페이지의 body에 나타나지 않는다면 false를 출력한다.
;; 만일 기호가 한 번 이상 나타난다면, 해당 기호가 존재하는 웹페이지의 header들을 리스트로 묶어 출력한다.
(define (find a-wp s)
  (cond ((occurs s a-wp)
         (append (list (wp-header a-wp))
                 (find-in-wd (wp-body a-wp) s)))
        (else false)))

(define (find-in-wd a-wd s)
  (cond ((empty? a-wd) empty)
        ((symbol? (first a-wd))
         (find-in-wd (rest a-wd) s))
        ((wp? (first a-wd))
         (cond ((boolean? (find (first a-wd) s))
                (find-in-wd (rest a-wd) s))
               ((occurs-in-wd s a-wd)
                (find (first a-wd) s))
               (else
                (append (find (first a-wd) s)
                        (find-in-wd (rest a-wd) s)))))))


;; data examples:
(define empty-page (make-wp 'empty-page empty))
(define page-1-word (make-wp 'page-1-word (cons 'w1 empty)))
(define page-2-words (make-wp 'page-2-words (list 'w1 'w2)))
(define with-1-word-subpage (make-wp 'page-1-word-with-subpage (cons page-1-word empty)))
(define with-2-words-subpage (make-wp 'with-2-words-subpage (cons page-2-words empty)))
(define dense-page1 (make-wp 'realistic (list 'w3  page-2-words 'w4 page-1-word 'w5)))
(define dense-page2 (make-wp 'realistic (list 'w3  empty-page 'w4 with-1-word-subpage 'w5)))

;; test for 'find'
(find empty-page 'w1) "should" false
(find page-1-word 'w1) "should" (list 'page-1-word)
(find page-2-words 'w3) "should" false
(find with-2-words-subpage 'w2) "should" (list 'with-2-words-subpage 'page-2-words)
(find dense-page1 'no-in-there) "should" false
(find dense-page1 'w1) "should" (list 'realistic 'page-2-words)
(find dense-page1 'w2) "should" (list 'realistic 'page-2-words)
(find dense-page2 'w1) "should" (list 'realistic 'page-1-word-with-subpage 'page-1-word)
(find dense-page1 'w5) "should" (list 'realistic)
