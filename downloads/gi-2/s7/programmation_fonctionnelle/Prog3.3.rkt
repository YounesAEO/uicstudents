;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog3.3) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (electric-ball SIZE R) ; une animation à 2 paramètres !
  (local [(define S (/ SIZE 2))
          (define FOND (underlay (empty-scene SIZE SIZE)
                                 (circle R 'solid "yellow")
                                 (circle R 'outline "red")))
          (define BALLE (circle 10 'solid "red"))
          ; Le Monde m est le point <x;y> à la position de la balle
          (define INIT (make-posn S S)) ; le centre du disque
          (define (distance x1 y1 x2 y2)
            (sqrt (+ (sqr (- x1 x2)) (sqr (- y1 y2)))))
          (define (suivant m) ; Monde --> Monde
            (local [(define x (posn-x m)) (define y (posn-y m))]
              (make-posn (+ x (- (random 9) 4)) ; petit déplacement...
                         (+ y (- (random 9) 4))))) ; ...aléatoire
          (define (dessiner m) ; Monde --> Scène
            (place-image BALLE (posn-x m) (posn-y m) FOND))
          (define (final? m) ; Monde --> Boolean
            (>= (distance (posn-x m) (posn-y m) S S) R))]
    (big-bang INIT
              (on-tick suivant)
              (on-draw dessiner)
              (stop-when final?)
              (name "Electric Ball"))))

(electric-ball 100 50)