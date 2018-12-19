;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog7.1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (fac n) ; n entier ≥ 0
  (if (= 0 n)
      1
      (* (fac (- n 1)) n)))

(define (fac1 n) ; la fonction principale
  (aux1 n 1))

(define (aux1 p q) ; la cheville ouvrière
  (if (zero? p)
      q
      (aux1 (- p 1) (* p q))))

(define (fac2 n) ; la fonction principale
  (local [(define (aux p q)
            (if (zero? p)
                q
                (aux (- p 1) (* p q))))]
    (aux n 1)))
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(define (assez-bonne? a r h)
  (< (abs (- (sqr a) r)) h)
  )

(define (ameliore a r)
  (* 1/2 (+ a (/ r a)))
  )

(define (iter a r h)
  (if (assez-bonne? a r h) a 
      (iter (ameliore a r) r h)
      )
  )

; Calcul de la racine carrée approchée de r > 0,
; h gouverne la précision, et a est l'approximation initiale.
(define (rac2 r a h)
  (local [(define (iter a)
            (if (assez-bonne? a)
                a
                (iter (ameliore a))))
          (define (assez-bonne? a)
            (< (abs (- (sqr a) r)) h))
          (define (ameliore a)
            (* #i0.5 (+ a (/ r a))))]
    (iter a)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (pgcd a b) 
  (if (zero? b)
      a
      (pgcd b (modulo a b)))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (inverser L)
  (if (empty? L)
      L
      (append (inverser (rest L)) (list (first L)))
      )
  )

(define ($reverse L) ; algorithme en
  (local [(define (iter L acc)
            (if (empty? L)
                acc
                (iter (rest L) (cons (first L) acc))))]
    (iter L empty)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (chiffres->image n) ; n entier > 0
  (local [(define FOND (rectangle 300 300 
                                  'solid "yellow"))
          (define (rand) (+ 50 (random 201))) 
          ; dans [50,250]
          (define (iter n acc) 
            ; l'accumulateur est une image
            (if (= n 0)
                acc
                (local [(define u (modulo n 10)) 
                        ; le chiffre des unités
                        (define img (text 
                                     (number->string u) 24 "black"))]
                  (iter (quotient n 10) 
                        (place-image img (rand) (rand) acc)))))]
    (iter n FOND)))