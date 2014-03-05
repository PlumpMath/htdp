;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-17-8-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (n left right))
#| 이진 트리 (BT)
이진 트리는 다음 중 하나다.
1. false
2. (make-node n l r)
   n: number
   l: BT
   r: BT
|#

(define (tree=? bt1 bt2)
  (or (and (boolean? bt1)
           (boolean? bt2)
           (false? bt1)
           (false? bt2))
      (and (node? bt1)
           (node? bt2)
           (= (node-n bt1) (node-n bt2))
           (tree=? (node-left bt1) (node-left bt2))
           (tree=? (node-right bt1) (node-right bt2)))))

;Examples as Tests:
(check-expect
 (tree=? false false)
 true)

(check-expect
 (tree=? (make-node 12 
                    false
                    false)
         (make-node 12 
                    false
                    false))
 true)

(check-expect
 (tree=? false false)
 true)

(check-expect
 (tree=? (make-node 12 
                    false
                    false)
         (make-node 18 
                    false
                    false))
 false)

(check-expect
 (tree=?
  (make-node 12 
             (make-node 35
                        false
                        false)
             (make-node 65
                        (make-node 89
                                   false
                                   false)
                        false))
  (make-node 12
             (make-node 35
                        false
                        false)
             (make-node 65
                        (make-node 89
                                   false
                                   false)
                        false))) 
 true)

(check-expect
 (tree=?
  (make-node 12 
             (make-node 35
                        false
                        false)
             (make-node 65
                        (make-node 89
                                   false
                                   false)
                        false))
  (make-node 12
             (make-node 35
                        false
                        false)
             (make-node 65
                        (make-node 89
                                   (make-node 7
                                              false
                                              false)
                                   false)
                        false))) 
 false)