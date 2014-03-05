;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname htdp-exercise-24-0-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(lambda (x y) (x y y))
; 올바르다. 매개변수로 x, y가 정의되었고, body로 (x y y)가 정의되었다.

(lambda () 10)
; 올바르지 않다. 매개변수가 없다

(lambda (x) x)
; 올바르다. 매개변수로 x가 정의되었고, body로 x가 정의되었다.

(lambda (x y) x)
; 올바르다. 매개변수로 x, y가 정의되었고, body로 x가 정의되었다.

(lambda x 10)
; 올바르지 않다. 매개변수 정의가 없다.


