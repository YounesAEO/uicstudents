;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog3.2) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(place-image (circle 40 'solid "gray")
             80 0
             (rectangle 160 80 'solid "lightgray")
             )
(define (balle-sinus)  ; l'animation est livrée dans une fonction
  (local [(define LARG 400)
          (define HAUT 200)
          (define SCENE (rectangle LARG HAUT 'solid "yellow"))
          (define RAYON 40) ; rayon de la balle
          (define BALLE (circle RAYON 'solid "red"))
          (define X0 (/ LARG 2)) ; position initiale du centre de la balle
          (define Y0 (/ HAUT 2))
          ; le monde est réduit à la variable m telle que l'abscisse
          ; du centre de la balle soit x = X0 * (1 + sin m)
          (define INIT 0) ; le monde initial
          (define dM 0.1) ; discrétisation du monde
          (define (suivant m) (+ m dM))  ; Monde --> Monde 
          (define (dessiner m) 
            (place-image BALLE (* X0 (+ 1 (sin m))) Y0 SCENE)) ; Monde --> Image
          (define (final? m)
            (>= m (* 6 pi)))
          (define (clavier m k)
            (if (key=? k "i") INIT m))
          (define (souris m x y evt)
            (if (mouse=? evt "button-down") INIT m))]
             ; option de la souris = "button-down", "button-up", "move" ou "drag"    
    (big-bang INIT                   ; Création du monde
              (on-tick suivant)      ; chaque 1/28 sec ; les 3 contrôleurs
              (on-draw dessiner LARG HAUT) 
              (stop-when final?)
              (on-key clavier)
              (on-mouse souris))))

(balle-sinus)
          