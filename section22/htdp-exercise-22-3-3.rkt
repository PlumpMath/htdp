;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-22-3-3) (read-case-sensitive #t) (teachpacks ((lib "gui.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.rkt" "teachpack" "htdp")))))
#| gui-table
(listof (listof cell))
|#

#| cell
cell은 다음 두 가지 중 하나다.
1. number
2. symbol
|#

(define (idle-callback event)
  true)

(define (pad->gui pad)
  (create-window
   (pad->button-rows pad)))

(define (pad->button-rows pad)
  (cond ((empty? pad) empty)
        (else (cons (row->buttons (first pad))
                    (pad->button-rows (rest pad))))))

(define (row->buttons row)
  (cond ((empty? row) empty)
        (else (cons (cell->button (first row))
                    (row->buttons (rest row))))))

(define (cell->button cell)
  (make-button (parse-cell cell) idle-callback))

(define (parse-cell cell)
  (cond ((number? cell) (number->string cell))
        ((symbol? cell) (symbol->string cell))))

;; examples
(define pad
  '((1 2 3)
    (4 5 6)
    (7 8 9)
    (\# 0 *)))

(define pad2
  '((1 2 3 +)
    (4 5 6 -)
    (7 8 9 *)
    (0 = \. /)))


(pad->gui pad)
(pad->gui pad2)
