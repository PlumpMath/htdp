;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-7-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A vehicle is one of those structures.
;; bus: structure (speed: number, eco-rate: number, capacity: number)
(define-struct bus (speed eco-rate capacity))
;; limo: structure (speed: number, rank: number)
(define-struct limo (spee rank))
;; auto: structure (speed: number, eco-rate: number)
(define-struct auto (speed eco-rate))
;; metro: structure (eco-rate: number, capacity: number)
(define-struct metro (eco-rate capacity))

;; template for vehicle
(define (f-vehicle a-vehicle)
  (cond ((bus? a-vehicle) (... (bus-speed a-vehicle) ... (bus-eco-rate a-vehicle) ... (bus-capacity a-vehicle) ...))
        ((limo? a-vehicle) (... (limo-speed a-vehicle) ... (limo-rank a-vehicle) ...))
        ((auto? a-vehicle) (... (auto-speed a-vehicle) ... (auto-eco-rate a-vehicle) ...))
        ((metro? a-vehicle) (... (metro-eco-rate a-vehicle) ... (metro-capacity a-vehicle)))))

