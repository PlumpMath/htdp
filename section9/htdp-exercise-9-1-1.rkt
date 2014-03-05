;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 1. 태양계 모든 행성의 리스트
(cons 'neptune
      (cons 'uranus
            (cons 'saturn
                  (cons 'jupiter
                        (cons 'mars
                              (cons 'earth
                                    (cons 'venus
                                          (cons 'mercury
                                                empty))))))))

;; 2. 음식 리스트
(cons 'steak
      (cons 'fried-potato
            (cons 'bean
                  (cons 'bread
                        (cons 'water
                              (cons 'juice
                                    (cons 'cheese
                                          (cons 'icecream
                                                empty))))))))

;; 3. 색의 리스트
(cons 'white
      (cons 'black
            (cons 'cyan
                  (cons 'magenta
                        (cons 'yellow
                              (cons 'blue
                                    (cons 'green
                                          (cons 'red
                                                empty))))))))

