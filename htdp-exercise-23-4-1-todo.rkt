;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-23-4-1-pass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 나중에 다시 시도
;; 적분을 몰라서 문제를 정확히 이해하지 못함


;; 케플러의 간단한 적분 방법

#| trapezoid : 사다리꼴 구조체
(make-trapezoid nw ne se sw)
사다리꼴의 평면 상 북서(nw), 북동(ne), 남동(se), 남서(sw) 꼭지점의 좌표로 구성
각 좌표는 posn 구조체)
|#
(define-struct trapezoid (nw ne se sw))

#| distance
평면 상 두 점의 거리
입력: <trapezoid> p1, <trapezoid> p2
출력: <number>
|#
(define (distance p1 p2)
  (sqrt (+ (sqr (- (posn-x p1) (posn-x p2)))
           (sqr (- (posn-y p1) (posn-y p2))))))

#| trapezoid-area
사다리꼴의 넓이
입력: <trapezoid> a-trapezoid
출력: <number>
|#
(define (trapezoid-area a-trapezoid)
  (local ((define bottom (distance (trapezoid-sw a-trapezoid)
                                   (trapezoid-se a-trapezoid)))
          (define top (distance (trapezoid-nw a-trapezoid)
                                (trapezoid-ne a-trapezoid)))
          (define side (distance (trapezoid-nw a-trapezoid)
                                 (trapezoid-sw a-trapezoid))))
    (/ (* (+ bottom top)
          side)
       2)))

#| integrate-kepler
케플러의 간단한 적분 방법
입력: <(number->number)> f, <number> left, <number> right
출력: <number>
|#
(define (integrate-kepler f left right)
  (local ((define center (/ (+ left right) 2))
          (define left-trapezoid
            (make-trapezoid (make-posn left (f left))
                            (make-posn center (f center))
                            (make-posn center 0)
                            (make-posn left 0)))
          (define right-trapezoid
            (make-trapezoid (make-posn center (f center))
                            (make-posn right (f right))
                            (make-posn right 0)
                            (make-posn center 0))))
    (+ (trapezoid-area left-trapezoid)
       (trapezoid-area right-trapezoid))))


; Tests: 
(define (square x)
  (* x x))

(define (one x)
  1)

(= (integrate-kepler one 0 1) 1)

(= (integrate-kepler square 0 1) 1/3)
(integrate-kepler square 0 1)
