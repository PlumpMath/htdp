;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-14-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; WP(web-page) is either:
;; 1. empty
;; 2. (cons s wp) / s : symbol / wp : WP
;; 3. (cons ewp wp) / esp, wp : WP


;; examples
(define wp1
  '(The TeachScheme! Project aims to improve the
        problem-solving and organization skills of high
        school students. It provides software and lecture
        notes as well as exercises and solutions for teachers.))

(define wp2
  '(The TeachScheme Web Page
        Here you can find: 
        (LectureNotes for Teachers)
        (Guidance for (DrScheme: a Scheme programming environment))
        (Exercise Sets)
        (Solutions for Exercises)
        For further information: write to scheme@cs))

#|
;; template
(define (fun-for-wp a-wp)
  (cond ((empty? a-wp) ...)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp)) ... (first a-wp) ... (fun-for-wp (rest a-wp)) ...)
               ((cons? (first a-wp)) ... (fun-for-wp (first a-wp)) ... (fun-for-wp (rest a-wp)) ...)
               (else (error 'fun-for-wp "invalid WP"))))
        (else (error 'fun-for-wp "invalid WP"))))
|#

;; size : WP -> number
;; a-wp에 들어 있는 기호의 수를 센다.

(define (size a-wp)
  (cond ((empty? a-wp) 0)
        ((cons? a-wp)
         (cond ((symbol? (first a-wp)) (+ 1 (size (rest a-wp))))
               ((cons? (first a-wp)) (+ (size (first a-wp)) (size (rest a-wp))))
               (else (error 'fun-for-wp "invalid WP"))))
        (else (error 'size "invalid WP"))))

(size empty)
(size (cons 'a empty))
(size (cons 'a (cons 'b empty)))
(size (cons 'a (cons (cons 'b empty) (cons 'c (cons 'd empty)))))
(size wp1)
(size wp2)
