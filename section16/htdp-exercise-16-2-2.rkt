;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-16-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| 파일
파일은 기호다.
|#

#| 다렉토리
디렉토리는 리스트이며, 구체적으로 다음 중 하나다.
1. empty
2. (cons f d) : f는 파일, d는 디렉토리
3. (cons d1 d2) d1, d2는 디렉토리

;; template
(define (fun-for-dir a-dir)
  (cond ((empty? a-dir) ...)
        ((cons? a-dir)
         (cond ((symbol? (first a-dir))
                ... (first a-dir) ...
                ... (fun-for-dir (rest a-dir)) ...)
               ((cons? (first (a-dir)))
                ... (fun-for-dir (first a-dir)) ...
                ... (fun-for-dir (rest a-dir)) ...)
               (else (error 'fun-for-dir "invalid directory"))))
        (else (error 'fun-for-dir "invalid directory"))))
|#

(define D44
  (list (list 'part1 'part2 'part3)
        (list (list 'hang 'draw)
              (list 'read!))
        'read!))

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
