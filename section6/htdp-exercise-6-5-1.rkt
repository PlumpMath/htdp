;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-5-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct movie (title producer))
;; movie-template: movie->???
(define (movie-template a-movie)
  ... (movie-title a-movie) ...
  ... (movie-producer a-movie) ...)

(define-struct boyfriend (name hair eyes phone))
;; boyfriend-template: boyfriend->???
(define (boyfriend-template a-boyfriend)
  ... (boyfriend-name a-boyfriend) ...
  ... (boyfriend-hair a-boyfriend) ...
  ... (boyfriend-eyes a-boyfriend) ...
  ... (boyfriend-phone a-boyfriend) ...)

(define-struct cheerleader (name number))
;; cheerleader-template: cheerleader->???
(define (cheerleader-template a-cheerleader)
  ... (cheerleader-name a-cheerleader) ...
  ... (cheerleader-number a-cheerleader) ...)

(define-struct CD (artist title price))
;; CD-template: CD->???
(define (CD-template a-CD)
  ... (CD-artist a-CD) ...
  ... (CD-title a-CD) ...
  ... (CD-price a-CD) ...)

(define-struct sweater (material size producer))
;; sweater-template: sweater->???
(define (sweater-template a-sweater)
  ... (sweater-material a-sweater) ...
  ... (sweater-size a-sweater) ...
  ... (sweater-producer a-sweater) ...)

