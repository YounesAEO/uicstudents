;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (une-racine a b c)                                ;une racine de ax2 + bx + c; ou bien #f
    (if (= a 0)
        (error "Pas un trinome !")
        (local [(define d (- (sqr b) (* 4 a c)))]         ; le discriminant delta
          (if (< d 0)
              #f
              (local [(define rd (sqrt d))]               ; et racine de delta
                (min (/ (+ (- b) rd) (* 2 a))
                     (/ (- (+ b rd)) (* 2 a)))))
          )))

(define (aire r) (* pi r r)) ; aire d'un cercle de rayon r
(define G 9.81)
(define (periode L) (* 2 pi (sqrt (/ L G)))) ; periode d'une pendule de longeur L

;(check-expect (+ 2 3) 5)
;(periode 0.3)
;(check-within (periode 0.3) 1.1 0.1)

(define (racine? x a b c)    ; x est-elle racine de ax2+bx+c?
     (< (abs (+ (* a x x)(* b x) c)) 0.00001))

;(check-error (une-racine 0 1 2) "Pas un trinome !")
;(printf "L'aire d'un cercle de rayon ~a est ~a\n" 2 (aire 2))
(show (une-racine 3 -1 -2))
