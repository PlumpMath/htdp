;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-3-3-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (area-pipe1 inner-radius length thickness)
  (+ (* length (* inner-radius 2 pi))
     (* length (* (+ inner-radius thickness) 2 pi))
     (* 2 (- (* (+ inner-radius thickness) (+ inner-radius thickness) pi)
             (* inner-radius inner-radius pi)))))

(define (area-pipe2 inner-radius length thickness)
  (+ (area-cylinder inner-radius length)
     (area-cylinder (+ inner-radius thickness) length)
     (* 2 (area-donut inner-radius (+ inner-radius thickness)))))

(define (square x)
  (* x x))

(define (diameter radius)
  (* radius 2 pi))

(define (area-of-disk radius)
  (* (square radius) pi))

(define (volume-cylinder bottom-radius height)
  (* height (area-of-disk bottom-radius)))

(define (area-cylinder bottom-radius height)
  (* height (diameter bottom-radius)))

(define (area-donut inner-radius outer-radius)
  (- (area-of-disk outer-radius)
     (area-of-disk inner-radius)))

;; 여러 개의 함수 정의로 이루어진 버전이 각각의 부분 계산을 정의할 때 오류가 생길 가능성이 적고 알아보기도 쉬워 더 신뢰할 만하다.
