;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog2.2) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
; la prise de valeur en 0
(define (val0 f)
  (f 0)
  )
;(val0 (lambda (x) (+ x 3)))
;(val0 sin)

;la composition de fonction
(define (compose1 f g)
  (lambda (x) (f (g x)))
  )
(define cos^2 (compose1 sqr cos))
; (cos^2 pi)

(define (derivee f x)
  (/ (- (f (+ x #i0.001)) (f x)) #i0.001)
  )
; (derivee log 2)
