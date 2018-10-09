;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog3.5) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
;(define R1 20) ; les rayons des balles
;(define R2 100)

(define (balle-physique R1 R2)  
  (local [
          (define-struct monde (x1 v1 x2 v2))
          (define LARGEUR 600)
          (define HAUTEUR 300)
          (define HAUTEUR/2 (/ HAUTEUR 2))  ;utilisé plusieurs fois
          (define FOND                      ;le fond constant de la scène    
            (place-image (line LARGEUR 0 "black") (/ LARGEUR 2) HAUTEUR/2
                         (rectangle LARGEUR HAUTEUR 'solid "yellow")))
         
          (define M1 (sqr R1)) ; leurs masses
          (define M2 (sqr R2))
          (define BALLE1 (circle R1 'solid "blue")) ; leur image
          (define BALLE2 (circle R2 'solid "green"))
          
          (define (dessiner m) 
            (place-image BALLE1 (monde-x1 m) HAUTEUR/2
                         (place-image BALLE2 (monde-x2 m) HAUTEUR/2 FOND))) ; Monde --> Image
    
          (define (suivant m) 
            (local [(define x1 (monde-x1 m))
                    (define v1 (monde-v1 m))
                    (define x2 (monde-x2 m))
                    (define v2 (monde-v2 m))
                    (define xs1 (+ x1 v1))
                    (define xs2 (+ x2 v2))]
              (cond ((< xs1 R1) (make-monde R1 (- v1) xs2 v2))
                    ((> (+ xs2 R2) LARGEUR)
                     (make-monde xs1 v1 (- LARGEUR R2) (- v2)))
                    (else (local [(define dist(- (- xs2 xs1) (+ R1 R2)))]
                            (if (>= dist 0)
                                (make-monde xs1 v1 xs2 v2)
                                (make-monde (+ x1 (/ dist 2))
                                            (/ (+ (* 2 M2 v2) (* (- M1 M2) v1))
                                               (+ M2 M1))
                                            (- x2 (/ dist 2))
                                            (/ (+ (* (- M2 M1) v2) (* 2 M1 v1))
                                               (+ M2 M1)))))
                          )
                    )
              ))]
          
    (big-bang (make-monde 200 6 400 0)
              (on-tick suivant)  
              (on-draw dessiner LARGEUR HAUTEUR))))