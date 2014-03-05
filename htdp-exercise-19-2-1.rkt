;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname htdp-exercise-19-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))


;; <ir : IR number  ->  boolean
(define (<ir ir p)
  (< (ir-price ir) p))

(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else
     (local ((define first-item (first alon))
             (define rest-filtered
               (filter1 rel-op (rest alon) t)))
       (cond
         [(rel-op first-item t)
          (cons first-item rest-filtered)]
         [else
          rest-filtered]))]))

(define (below-ir1 aloir t)
  (filter1 <ir aloir t))

;; find : loIR symbol  ->  boolean
;; to determine whether aloir contains a record for t
(define (find aloir t)
  (cons? (filter1 eq-ir? aloir t)))

;; eq-ir? : IR symbol  ->  boolean
;; to compare ir's name and p
(define (eq-ir? ir p)
  (symbol=? (ir-name ir) p))

"1. (below-ir1 (list (make-ir 'doll 8) (make-ir 'robot 12))) 10"
(below-ir1 (list (make-ir 'doll 8) (make-ir 'robot 12)) 10)
(filter1 <ir (list (make-ir 'doll 8) (make-ir 'robot 12)) 10)
(cond
  [(empty? (list (make-ir 'doll 8) (make-ir 'robot 12))) empty]
  [else
   (local ((define first-item (first (list (make-ir 'doll 8) (make-ir 'robot 12))))
           (define rest-filtered
             (filter1 <ir (rest (list (make-ir 'doll 8) (make-ir 'robot 12))) 10)))
     (cond
       [(<ir first-item 10)
        (cons first-item rest-filtered)]
       [else
        rest-filtered]))])
(local ((define first-item (first (list (make-ir 'doll 8) (make-ir 'robot 12))))
        (define rest-filtered
          (filter1 <ir (rest (list (make-ir 'doll 8) (make-ir 'robot 12))) 10)))
  (cond
    [(<ir first-item 10)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered (filter1 <ir (list (make-ir 'robot 12)) 10)))
  (cond
    [(<ir first-item 10)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (cond
            [(empty? (list (make-ir 'robot 12))) empty]
            [else
             (local ((define first-item (first (list (make-ir 'robot 12))))
                     (define rest-filtered
                       (filter1 <ir (rest (list (make-ir 'robot 12))) 10)))
               (cond
                 [(<ir first-item 10)
                  (cons first-item rest-filtered)]
                 [else
                  rest-filtered]))])))
  (cond
    [(<ir first-item 10)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (local ((define first-item (make-ir 'robot 12))
                  (define rest-filtered empty))
            (cond
              [(<ir first-item 10)
               (cons first-item rest-filtered)]
              [else
               rest-filtered]))))
  (cond
    [(<ir first-item 10)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (cond
            [(<ir (make-ir 'robot 12) 10)
             (cons (make-ir 'robot 12) empty)]
            [else
             empty])))
  (cond
    [(<ir first-item 10)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered empty))
  (cond
    [(<ir first-item 10)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(cond
  [(<ir (make-ir 'doll 8) 10)
   (cons (make-ir 'doll 8) empty)]
  [else
   (cons empty)])
(cons (make-ir 'doll 8) empty)

"2. (find (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13)) 'doll)"
(find (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13)) 'doll)
(cons? (filter1 eq-ir? (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13)) 'doll))

;; 2. 에서, filter1을 사용하는 부분
(filter1 eq-ir? (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13)) 'doll)
(cond
  [(empty? (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13))) empty]
  [else
   (local ((define first-item (first (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13))))
           (define rest-filtered
             (filter1 eq-ir? (rest (list (make-ir 'doll 8) (make-ir 'robot 12) (make-ir 'doll 13))) 'doll)))
     (cond
       [(eq-ir? first-item 'doll)
        (cons first-item rest-filtered)]
       [else
        rest-filtered]))])
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (filter1 eq-ir? (list (make-ir 'robot 12) (make-ir 'doll 13)) 'doll)))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (local ((define first-item (make-ir 'robot 12))
                  (define rest-filtered
                    (filter1 eq-ir? (list (make-ir 'doll 13)) 'doll)))
            (cond
              [(eq-ir? first-item 'doll)
               (cons first-item rest-filtered)]
              [else
               rest-filtered]))))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (local ((define first-item (make-ir 'robot 12))
                  (define rest-filtered
                    (local ((define first-item (make-ir 'doll 13))
                            (define rest-filtered empty))
                      (cond
                        [(eq-ir? first-item 'doll)
                         (cons first-item rest-filtered)]
                        [else
                         rest-filtered]))))
            (cond
              [(eq-ir? first-item 'doll)
               (cons first-item rest-filtered)]
              [else
               rest-filtered]))))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (local ((define first-item (make-ir 'robot 12))
                  (define rest-filtered
                    (cond
                      [(eq-ir? (make-ir 'doll 13) 'doll)
                       (cons (make-ir 'doll 13) empty)]
                      [else
                       empty])))
            (cond
              [(eq-ir? first-item 'doll)
               (cons first-item rest-filtered)]
              [else
               rest-filtered]))))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (local ((define first-item (make-ir 'robot 12))
                  (define rest-filtered (cons (make-ir 'doll 13) empty)))
            (cond
              [(eq-ir? first-item 'doll)
               (cons first-item rest-filtered)]
              [else
               rest-filtered]))))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered
          (cond
            [(eq-ir? (make-ir 'robot 12) 'doll)
             (cons (make-ir 'robot 12) (cons (make-ir 'doll 13) empty))]
            [else
             (cons (make-ir 'doll 13) empty)])))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(local ((define first-item (make-ir 'doll 8))
        (define rest-filtered (cons (make-ir 'doll 13) empty)))
  (cond
    [(eq-ir? first-item 'doll)
     (cons first-item rest-filtered)]
    [else
     rest-filtered]))
(cond
  [(eq-ir? (make-ir 'doll 8) 'doll)
   (cons (make-ir 'doll 8) (cons (make-ir 'doll 13) empty))]
  [else
   (cons (make-ir 'doll 13) empty)])
(cons (make-ir 'doll 8) (cons (make-ir 'doll 13) empty))
