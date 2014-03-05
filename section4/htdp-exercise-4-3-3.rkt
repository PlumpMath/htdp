;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(cond
  [(<= n 1000) (* .040 1000)]
  [(<= n 5000) (+ (* 1000 .040) 
		  (* (- n 1000) .045))]
  [else (+ (* 1000 .040) 
	   (* 4000 .045)
	   (* (- n 10000) .055))])

;; n의 값이 500인 경우: 40
;; n의 값이 2800인 경우: 121
;; n의 값이 15000인 경우: 495
