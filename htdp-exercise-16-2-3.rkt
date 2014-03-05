;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-16-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
               ((cons? (first a-lofd))
                ... (fun-for-lofd (first a-lofd)) ...
                ... (fun-for-lofd (rest a-lofd)) ...)
               (else (error 'fun-for-lofd "invalid directory"))))
        (else (error 'fun-for-lofd "invalid directory"))))
|#

(define (how-many a-dir)
  (cond ((empty? a-dir) 0)
        ((cons? a-dir)
         (cond ((symbol? (first a-dir))
                (+ 1 (how-many (rest a-dir))))
               ((cons? (first a-dir))
                (+ (how-many (first a-dir)) (how-many (rest a-dir))))
               (else (error 'how-many "invalid directory"))))
        (else (error 'how-many "invalid directory"))))

(how-many D44)
