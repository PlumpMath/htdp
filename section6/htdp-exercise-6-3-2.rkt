;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-6-3-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct movie (title producer))

(movie-title (make-movie 'ThePhantomMenace 'Lucas))
(movie-producer (make-movie 'TheEmpireStrikesBack 'Lucas))

(define x 0)
(define y 1)

(movie-title (make-movie x y))
(movie-producer (make-movie x y))
