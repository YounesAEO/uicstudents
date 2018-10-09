;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog2.1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (moyenne a b)
  (/ (+ a b) 2)
  )

(define (terme-suivant u)
  (moyenne u (/ 2 u))
  )
(define a #i54.0)
(define u1 (terme-suivant a))
(define u2 (terme-suivant u1))
(define u3 (terme-suivant u2))
(define u4 (terme-suivant u3))
(define u5 (terme-suivant u4))
(define u6 (terme-suivant u5))
(define u7 (terme-suivant u6))
(define u8 (terme-suivant u7))
(define u9 (terme-suivant u8))
(define u10 (terme-suivant u9))
(define u11 (terme-suivant u10))
;u8
;u9
;u10
;(sqrt 2)
