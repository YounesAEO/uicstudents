;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog3.1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define c 
  (circle 8 'solid "black")
  ) ; c est une image

(define r
  (rectangle 80 20
             'outline "red")
  )

(define s
  (line 80 20 "blue")
  ) ; 80 en x et 20 en y

(define t 
  (text "Hello !" 24 "black")
  )
;--------------------------------------------
; 'quote l'identité non évaluante
 'bonjour
;--------------------------------------------
(number->string 123)
(text (number->string 1234) 32 "blue")
;--------------------------------------------
(format "~a * ~a = ~a" 3 5 (* 3 5))
(printf "~a * ~a = ~a" 3 5 (* 3 5))
;--------------------------------------------
(image-width c) ; c est un cercle de rayon 8
(image-height t) ; t est texte de taille 24
;--------------------------------------------

; ----- 2 LES IMAGES COMPOSEES ----------------

; ----------2.1 Superposition d'images --------
(underlay (rectangle 160 40 'solid "gray")
          (circle 30 'solid "black")
          )

(underlay/align 'left 'top   
                ; premier argument 'left 'right 'center
                ; deuxième argument 'top 'bottom 'baseline
                (rectangle 160 40 'solid "gray")
                (circle 30 'solid "black")
                )

(underlay/xy    (rectangle 160 40 'solid "black")
                80 20
                (rectangle 160 40 'solid "gray")
                )

; ----------2.2 Alignement horizontal ou vertical d'images --------

(beside (rectangle 160 40 'outline "black")
        (circle 10 'solid "black")
        )

(beside/align 'top  ; 'top 'center 'bottom 'baseline
              (rectangle 160 40 'outline "black")
              (circle 10 'solid "black")
              )

(above/align 'left  ; 'left 'center 'right
              (rectangle 160 40 'outline "black")
              (circle 10 'solid "black")
              )

; ----------2.3 Rotation d'une image --------
(rotate 45 r)

; ----------2.4 Changement d'échelle --------
(local [(define c (circle 10 'outline "black"))]
  (beside c (scale 2 c))
  )

(local [(define c (circle 10 'outline "black"))]
  (beside c (scale/xy 4 2 c))
  )

; ----------2.5 Encadrement d'une image --------
(frame (rotate 45 r))

; ----------2.6 Extraction d'une sous-image --------
;(crop x y larg haut img)
(local [(define c (circle 40 'solid "gray"))]
  (crop 40 0 40 40 c)
  )
; ----------2.7 Utiliser de véritables images --------
(bitmap "UIC.png")
(define UIC (bitmap "UIC.png"))

; ----------3 EXEMPLES --------
(define SMILEY
  (local [(define TETE (underlay (circle 100 'solid "black")
                                 (circle 98 'solid "Yellow")))
          (define OEIL (ellipse 25 40 'solid "black"))
          (define SMILEY1 (underlay/xy TETE 60 40 OEIL))
          (define SMILEY2 (underlay/xy SMILEY1 120 40 OEIL))
          (define BOUCHE (underlay (ellipse 100 60 'solid "black")
                                 (ellipse 95 50 'solid "Yellow")))
          (define SMILEY3 (underlay/xy SMILEY2 50 110 BOUCHE))
          (define MASQUE (rectangle 110 40 'solid "yellow"))
          (define SMILEY4 (underlay/xy SMILEY3 45 105 MASQUE))]
    SMILEY4)
  )
SMILEY