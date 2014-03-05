;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-18-1-11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (last-occurrence s alostars)
  (cond
    [(empty? alostars) false]
    [else (local ((define r (last-occurrence s (rest alostars))))
            (cond
              [(star? r) r]
              [(symbol=? (star-name (first alostars)) s) (first alostars)]
              [else false]))]))

(last-occurrence 'Matt
                 (list (make-star 'Matt 'violin)
                       (make-star 'Matt 'radio)))
(cond
  [(empty? (last-occurrence 'Matt
                            (list (make-star 'Matt 'violin)
                                  (make-star 'Matt 'radio)))) false]
  [else (local ((define r (last-occurrence s (rest (list (make-star 'Matt 'violin)
                                                         (make-star 'Matt 'radio))))))
          (cond
            [(star? r) r]
            [(symbol=? (star-name (first (list (make-star 'Matt 'violin)
                                               (make-star 'Matt 'radio)))) 'Matt)
             (first (list (make-star 'Matt 'violin)
                          (make-star 'Matt 'radio)))]
            [else false]))])
(cond
  [false false]
  [else (local ((define r (last-occurrence s (rest (list (make-star 'Matt 'violin)
                                                         (make-star 'Matt 'radio))))))
          (cond
            [(star? r) r]
            [(symbol=? (star-name (first (list (make-star 'Matt 'violin)
                                               (make-star 'Matt 'radio)))) 'Matt)
             (first (list (make-star 'Matt 'violin)
                          (make-star 'Matt 'radio)))]
            [else false]))])
(cond
  [else (local ((define r (last-occurrence s (rest (list (make-star 'Matt 'violin)
                                                         (make-star 'Matt 'radio))))))
          (cond
            [(star? r) r]
            [(symbol=? (star-name (first (list (make-star 'Matt 'violin)
                                               (make-star 'Matt 'radio)))) 'Matt)
             (first (list (make-star 'Matt 'violin)
                          (make-star 'Matt 'radio)))]
            [else false]))])
(local ((define r (last-occurrence s (rest (list (make-star 'Matt 'violin)
                                                 (make-star 'Matt 'radio))))))
  (cond
    [(star? r) r]
    [(symbol=? (star-name (first (list (make-star 'Matt 'violin)
                                       (make-star 'Matt 'radio)))) 'Matt)
     (first (list (make-star 'Matt 'violin)
                  (make-star 'Matt 'radio)))]
    [else false]))
(define r1 (last-occurrence s (rest (list (make-star 'Matt 'violin)
                                          (make-star 'Matt 'radio)))))
(cond
  [(star? r1) r1]
  [(symbol=? (star-name (first (list (make-star 'Matt 'violin)
                                     (make-star 'Matt 'radio)))) 'Matt)
   (first (list (make-star 'Matt 'violin)
                (make-star 'Matt 'radio)))]
  [else false])
(define r1 (last-occurrence s (rest (list (make-star 'Matt 'violin)
                                          (make-star 'Matt 'radio)))))
(cond
  [(star? r1) r1]
  [(symbol=? (star-name (first (list (make-star 'Matt 'violin)
                                     (make-star 'Matt 'radio)))) 'Matt)
   (first (list (make-star 'Matt 'violin)
                (make-star 'Matt 'radio)))]
  [else false])


;; r1 부분
(last-occurrence s (list (make-star 'Matt 'radio)))
(cond
  [(empty? (list (make-star 'Matt 'radio))) false]
  [else (local ((define r2 (last-occurrence s (rest (list (make-star 'Matt 'radio))))))
          (cond
            [(star? r2) r2]
            [(symbol=? (star-name (first (list (make-star 'Matt 'radio)))) s) (first (list (make-star 'Matt 'radio)))]
            [else false]))])
(cond
  [false false]
  [else (local ((define r2 (last-occurrence s (rest (list (make-star 'Matt 'radio))))))
          (cond
            [(star? r2) r2]
            [(symbol=? (star-name (first (list (make-star 'Matt 'radio)))) s) (first (list (make-star 'Matt 'radio)))]
            [else false]))])
(cond
  [else (local ((define r2 (last-occurrence s (rest (list (make-star 'Matt 'radio))))))
          (cond
            [(star? r2) r2]
            [(symbol=? (star-name (first (list (make-star 'Matt 'radio)))) s) (first (list (make-star 'Matt 'radio)))]
            [else false]))])
(local ((define r2 (last-occurrence s (rest (list (make-star 'Matt 'radio))))))
          (cond
            [(star? r2) r2]
            [(symbol=? (star-name (first (list (make-star 'Matt 'radio)))) s) (first (list (make-star 'Matt 'radio)))]
            [else false]))
(define r2 (last-occurrence s (rest (list (make-star 'Matt 'radio)))))
(cond
  [(star? r2) r2]
  [(symbol=? (star-name (first (list (make-star 'Matt 'radio)))) s) (first (list (make-star 'Matt 'radio)))]
  [else false])

;; r2 부분
(define r2 (last-occurrence s empty))
(cond
  [(empty? empty) false]
  [else (local ((define r (last-occurrence s (rest empty))))
          (cond
            [(star? r) r]
            [(symbol=? (star-name (first empty)) s) (first empty)]
            [else false]))]))
(cond
  [true false]
  [else (local ((define r (last-occurrence s (rest empty))))
          (cond
            [(star? r) r]
            [(symbol=? (star-name (first empty)) s) (first empty)]
            [else false]))]))
false


;; 중략

;; 즉, 1개의 local 표현이 재귀적으로 2번 최상위로 이동된다.
