;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-14-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (ssn name left right))

;; BT:
;; 1. false
;; 2. (make-node soc pn lft rgt)
;;    -> soc: 주민등록번호 (number)
;;    -> pn: 이름 (symbol)
;;    -> lft: 왼쪽 트리 BT
;;    -> rgt: 오른쪽 트리 BT

#|
(make-node 15 'd false (make-node 24 'i false false))
           <15, 'd>
                 \
               <24, 'i>


(make-node 15 'd (make-node 87 'h false false) false)
            <15, 'd>
              /
         <87, 'h>

|#

(define (contains-bt n bt)
  (cond ((false? bt) false)
        (else
         (or (= n (node-ssn bt))
             (contains-bt n (node-left bt))
             (contains-bt n (node-right bt))))))

(define (search-bt n bt)
  (cond ((false? bt) false)
        ((= n (node-ssn bt)) (node-name bt))
        ((contains-bt n (node-left bt)) (search-bt n (node-left bt)))
        ((contains-bt n (node-right bt)) (search-bt n (node-right bt)))
        (else false)))

;; 역추적이 뭐지??


(define (inorder bt)
  (cond ((false? bt) empty)
        (else
         (append (inorder (node-left bt))
                 (list (node-ssn bt))
                 (inorder (node-right bt))))))

(define (search-bst n bst)
  (cond ((false? bst) false)
        ((= n (node-ssn bst)) (node-name bst))
        ((< n (node-ssn bst)) (search-bst n (node-left bst)))
        (else (search-bst n (node-right bst)))))

;; 이진 검색 트리
(define A
  (make-node 63 'n63
             (make-node 29 'n29
                        (make-node 15 'n15
                                   (make-node 10 'n10
                                              false
                                              false)
                                   (make-node 24 'n24
                                              false
                                              false))
                        false)
             (make-node 89 'n89
                        (make-node 77 'n77
                                   false
                                   false)
                        (make-node 95 'n95
                                   false
                                   (make-node 99 'n99
                                              false
                                              false)))))

;; 이진 트리
(define B
  (make-node 63 'n63
             (make-node 29 'n29
                        (make-node 15 'n15
                                   (make-node 87 'n87
                                              false
                                              false)
                                   (make-node 24 'n24
                                              false
                                              false))
                        false)
             (make-node 89 'n89
                        (make-node 33 'n33
                                   false
                                   false)
                        (make-node 95 'n95
                                   false
                                   (make-node 99 'n99
                                              false
                                              false)))))


(search-bst 63 false)
(search-bst 10 A)
(search-bst 15 A)
(search-bst 20 A)
(search-bst 24 A)
(search-bst 29 A)
(search-bst 63 A)
(search-bst 77 A)
(search-bst 89 A)
(search-bst 95 A)
(search-bst 99 A)
(search-bst 100 A)

;; 연습문제 12-2-2의 search-sorted는 정렬된 리스트에 대한 검색을 수행하며, 연산 비용은 O(n)이다. 그에 반해 연습문제 14-2-4의 search-bst는 이진 검색 트리에 대한 연산을 수행하며, 연산 비용은 O(log n)이다. 그러므로 search-bst가 더 효율적이다.
