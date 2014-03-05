;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-16-2-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 번역본에 오류가 있음. 268쪽 박스 안, 8째줄, d1은 LOFD가 아닌 디렉토리임.

#| 파일
파일은 기호다.
|#

(define-struct dir (name content size os-support?))
#| 디렉토리
디렉토리는 다음 구조체다.
(make-dir n c s os?) : n은 심볼, c는 파일/디렉토리 리스트, s는 수, os?는 진위값이다.

;; template
(define (fun-for-dir a-dir)
  ... (dir-name a-dir) ...
  ... (dir-content a-dir) ...
  ... (dir-size a-dir) ...
  ... (dir-os-support? a-dir) ...)
|#


#| 파일/디렉토리 리스트(LOFD)는 리스트이며, 구체적으로 다음 중 하나다.
1. empty
2. (cons f d) : f는 파일, d는 디렉토리
3. (cons d1 d2) : d1은 디렉토리, d2는 파일/디렉토리 리스트

;; template
(define (fun-for-lofd a-lofd)
  (cond ((empty? a-lofd) ...)
        ((cons? a-lofd)
         (cond ((symbol? (first a-lofd))
                ... (first a-lofd) ...
                ... (fun-for-lofd (rest a-lofd)) ...)
               ((dir? (first a-lofd))
                ... (first a-lofd) ...
                ... (fun-for-lofd (rest a-lofd)) ...)
               (else (error 'fun-for-lofd "invalid list of file/directories"))))
        (else (error 'fun-for-lofd "invalid list of file/directories"))))
|#

(define D44
  (make-dir 'TS
            (list (make-dir 'Text
                            (list 'part1
                                  'part2
                                  'part3)
                            0
                            true)
                  (make-dir 'Libs
                            (list (make-dir 'Code
                                            (list 'hang
                                                  'draw)
                                            0
                                            true)
                                  (make-dir 'Docs
                                            (list 'read!)
                                            0
                                            true))
                            0
                            true)
                  'read!)
            0
            true))

(define (how-many a-dir)
  (how-many-in-lofd (dir-content a-dir)))

(define (how-many-in-lofd a-lofd)
  (cond ((empty? a-lofd) 0)
        ((cons? a-lofd)
         (cond ((symbol? (first a-lofd))
                (+ 1 (how-many-in-lofd (rest a-lofd))))
               ((dir? (first a-lofd))
                (+ (how-many (first a-lofd)) (how-many-in-lofd (rest a-lofd))))
               (else (error 'how-many-in-lofd "invalid list of file/directories"))))
        (else (error 'how-many-in-lofd "invalid list of file/directories"))))


(how-many (make-dir 'D1 empty 0 true))
(how-many (make-dir 'D2 (list 'a) 0 true))
(how-many (make-dir 'D3 (list (make-dir 'D3-1 empty 0 true)) 0 true))
(how-many (make-dir 'D4 (list (make-dir 'D3-1 empty 0 true) 'b) 0 true))
(how-many (make-dir 'D4 (list 'a (make-dir 'D3-1 empty 0 true) 'b) 0 true))
(how-many (make-dir 'D4 (list 'a (make-dir 'D3-1 (list 'c) 0 true) 'b) 0 true))
(how-many D44)
