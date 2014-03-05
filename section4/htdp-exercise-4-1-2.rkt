;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-4-1-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
1. (> x 3)
2. (and (> 4 x) (> x 3))
3. (= (* x x ) x)

(1) x = 4
1. true
2. false
3. false

(2) x = 2
1. false
2. false
3. false

(3) x = 7/2
1. true
2. true
3. false
