;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
a boolean-list is either
1. empty
2. (cons b bl)
   -> where b is a boolean and bl is a boolean-list.

examples:
empty
(cons true empty)
(cons false (cons true empty))
(cons false (cons true (cons false empty)))
...

