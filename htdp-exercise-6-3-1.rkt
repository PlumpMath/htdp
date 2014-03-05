;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct movie (title producer))
;; 구조체 이름: movie
;; 선택자 이름: movie-title movie-producer
;; 그림: [title|producer]

(define-struct boyfriend (name hair eyes phone))
;; 구조체 이름: boyfriend
;; 선택자 이름: boyfriend-name boyfriend-hair boyfriend-eyes boyfriend-phone
;; 그림: [name|hair|eyes|phone]

(define-struct cheerleader (name number))
;; 구조체 이름: cheerleader
;; 선택자 이름: cheerleader-name cheerleader-number
;; 그림: [name|number]

(define-struct CD (artist title price))
;; 구조체 이름: CD
;; 선택자 이름: CD-artist CD-title CD-price
;; 그림: [artist|title|price]

(define-struct sweater (material size producer))
;; 구조체 이름: sweater
;; 선택자 이름: sweater-material sweater-size sweater-producer
;; 그림: [material|size|producer]

