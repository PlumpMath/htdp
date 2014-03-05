;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-22-3-2) (read-case-sensitive #t) (teachpacks ((lib "gui.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.rkt" "teachpack" "htdp")))))
;; model
(define-struct book-entry (name number))
(define book-example (list (make-book-entry '철수 47004747)
                           (make-book-entry '영희 72980192)
                           (make-book-entry '경진 39102065)
                           (make-book-entry '명순 29410203)
                           (make-book-entry '영은 10205141)
                           (make-book-entry '망고 30533547)))

(define (search name book)
  (cond ((empty? book) false)
        ((symbol=? name (book-entry-name (first book)))
         (book-entry-number (first book)))
        (else (search name (rest book)))))

(define (search-number number book)
  (cond ((empty? book) false)
        ((= number (book-entry-number (first book)))
         (book-entry-name (first book)))
        (else (search-number number (rest book)))))

(define (search-for-gui keyword book)
  (local ((define r
            (cond ((number? (string->number keyword))
                   (search-number (string->number keyword) book))
                  (else
                   (search (string->symbol keyword) book)))))
    (cond ((false? r) "항목을 찾지 못했습니다.")
          ((number? r) (number->string r))
          ((symbol? r) (symbol->string r)))))


;; control
(define (search-button-callback event)
  (draw-message result-message
                (search-for-gui (text-contents keyword-text) book-example)))
;; view
(define result-message (make-message "검색할 이름 또는 번호를 입력하세요"))
(define keyword-text (make-text ""))
(define search-button (make-button "검색" search-button-callback))
(define dialog (create-window (list (list result-message)
                                    (list keyword-text)
                                    (list search-button))))

