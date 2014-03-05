;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-14-2-6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; create-bst
;; : binary-search-tree, number, symbol -> binary-search-tree
(define (create-bst bst n s)
  (cond ((false? bst) (make-node n s false false))
        ((< n (node-ssn bst)) (make-node (node-ssn bst)
                                         (node-name bst)
                                         (create-bst (node-left bst) n s)
                                         (node-right bst)))
        ((< (node-ssn bst) n) (make-node (node-ssn bst)
                                         (node-name bst)
                                         (node-left bst)
                                         (create-bst (node-right bst) n s)))
        (else (error 'create-bst "invalid value"))))

;; A list-of-number/name (lonn) is either:
;; 1. empty
;; 2. (cons (list ssn nom) lonn)
;;    -> ssn: number, nom: symbol, lonn: list-of-number/name

;; create-bst-from-list : list-of-number/name -> binary-search-tree
;; lonn: list-of-number/name
(define (create-bst-from-list lonn)
  (cond ((empty? lonn) false)
        (else (create-bst (create-bst-from-list (rest lonn))
                          (first (first lonn))
                          (second (first lonn))))))

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

(create-bst-from-list
 (list (list 99 'o)
       (list 77 'l)
       (list 24 'i)
       (list 10 'h)
       (list 95 'g)
       (list 15 'd)
       (list 89 'c)
       (list 29 'b)
       (list 63 'a)))

