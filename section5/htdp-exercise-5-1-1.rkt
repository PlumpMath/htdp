;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-5-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (reply s)
  (cond
    ((symbol=? s 'GoodMorning) 'Hi)
    ((symbol=? s 'HowAreYou?) 'Fine)
    ((symbol=? s 'GoodAfternoon) 'INeedANap)
    ((symbol=? s 'GoodEvening) 'BoyAmITired)))

(reply 'GoodMorning)
(reply 'HowAreYou?)
(reply 'GoodAfternoon)
(reply 'GoodEvening)

(symbol=? (reply 'GoodMorning) 'Hi)
(symbol=? (reply 'HowAreYou?) 'Fine)
(symbol=? (reply 'GoodAfternoon) 'INeedANap)
(symbol=? (reply 'GoodEvening) 'BoyAmITired)