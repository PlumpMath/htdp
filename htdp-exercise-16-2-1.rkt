;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-16-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#| 파일
파일은 기호다.
|#

#| 다렉토리
디렉토리는 리스트이며, 구체적으로 다음 중 하나다.
1. empty
2. (cons f d) : f는 파일, d는 디렉토리
3. (cons d1 d2) d1, d2는 디렉토리
|#

(define D44
  (list (list 'part1 'part2 'part3)
        (list (list 'hang 'draw)
              (list 'read!))
        'read!))


