;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; animal is one of those structures.
;; spider: structure (legs: number / volume: number)
(define-struct spider (legs volume))
;; elephant: structure (volume: number)
(define-struct elephant (volume))
;; monkey: structure (intelligence: number / volume: number)
(define-struct monkey (intelligence volume))

;; template function for animal structure
(define (f an-animal)
  (cond
    ((spider? an-animal) ...)
    ((elephant? an-animal) ...)
    ((monkey? an-animal) ...)))

;; calculate if an-animal fits in cage of size
;; parameter: an-animal: animal-structure, size: number
(define (fits? an-animal size)
  (cond
    ((spider? an-animal) (<= (spider-volume an-animal) size))
    ((elephant? an-animal) (<= (elephant-volume an-animal) size))
    ((monkey? an-animal) (<= (monkey-volume an-animal) size))))
