;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog9.1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
; Les fonctions des arbres binaires sont dèjà défini dans le valrose teachpack.

(define AT ; un arbre pour les tests
  (arbre '-
         (arbre '* 2 (arbre '+ 'x 1))
         (arbre '/ 'x 'y)))

AT
(fg AT)
(fd (fg AT))
(racine (fd AT))

;; Mes définitions, hors le fichier ValRose.rkt
;; Définition de Mon arbre; MaFeuille, MonOperateur
;; Définition de Mon Fils Gauche, Fils Droit

(define (MonArbre r Ag Ad)
  (list r Ag Ad))

(define (MaFeuille? obj)
  (or (number? obj)
      (and (symbol? obj)(not (MonOperateur? obj)))
      )
  )

(define (MonOperateur? obj)
  (member obj '(+ - * /)))

(define (MaRacine A)
  (if (MaFeuille? A)
      (error "Racine : pas de racine pour" A)
      (first A)
      )
  )
(define (MonFG A)
  (if (MaFeuille? A)
      (error "Fils gauche : pas de Fils Gauche pour" A)
      (second A)
      )
  )
(define (MonFD A)
  (if (MaFeuille? A)
      (error "Fils Droit : pas de Fils Droit pour" A)
      (third A)
      )
  )

(define MonAT ; un arbre pour les tests
  (MonArbre '+
            (MonArbre '/ 5 (MonArbre '+ 'y 1))
            (MonArbre '+ 'x 'z)))

MonAT
(MonFG MonAT)
(MonFD (MonFG MonAT))
(MaRacine (MonFD MonAT))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (hauteur A)
  (if (MaFeuille? A)
      0
      (+ 1 (max (hauteur (MonFG A)) (hauteur (MonFD A))))
      )
  )
(define (feuille-de? x A) ; x est-elle une feuille de A ?
  (if (MaFeuille? A)
      (equal? x A)
      (or (feuille-de? x (MonFG A))
          (feuille-de? x (MonFD A)))))

(define (feuillage A)
  (if (MaFeuille? A)
      (list A)
      (append (feuillage (MonFG A)) (feuillage (MonFD A)))))

(define (nombre-de-feuilles A)
  (if (MaFeuille? A)
      1
      (+ (nombre-de-feuilles (MonFG A)) (nombre-de-feuilles (MonFD A)))))

(define (valeur A) ; l'arbre A doit être arithmétique !
  (if (MaFeuille? A)
      A
      (local [(define r (MaRacine A))
              (define vg (valeur (MonFG A)))
              (define vd (valeur (MonFD A)))]
        (cond ((equal? r '+) (+ vg vd))
              ((equal? r '-) (- vg vd))
              ((equal? r '*) (* vg vd))
              ((equal? r '/) (/ vg vd))
              (else (error "valeur : opérateur inconnu : " (MaRacine A)))))))

(define MonAT1 ; un arbre avec une valeur pour les tests
  (MonArbre '+
            (MonArbre '/ 5 (MonArbre '+ '2 1))
            (MonArbre '+ '4 '3)))

(define (valeur_Inc A) ; cette fonction est incorrecte, problème de type entre fonction et opérateur!
  (if (MaFeuille? A)
      A
      (local [(define r (MaRacine A))
              (define vg (valeur_Inc (MonFG A)))
              (define vd (valeur_Inc (MonFD A)))]
        ((MaRacine A) vg vd))))


(define (valeur1 A) ; A est arithmétique !
  (if (MaFeuille? A)
      A
      (local [(define vg (valeur1 (MonFG A)))
              (define vd (valeur1 (MonFD A)))]
        (case (MaRacine A)
          ((+) (+ vg vd))
          ((-) (- vg vd))
          ((*) (* vg vd))
          ((/) (/ vg vd))
          (else (error "valeur : opérateur inconnu : " (MaRacine A)))))))

(define ($assoc x AL)
  (cond ((empty? AL) #f)
        ((equal? (first (first AL)) x) (first AL))
        (else ($assoc x (rest AL)))))

(define (valeur2 A AL)           ; A contient des variables dont on va chercher les valeurs dans AL
  (if (MaFeuille? A)
      (if (number? A)
          A
          (local [(define essai (assoc A AL))]     ; essai = #f ou (A v)
            (if (not (equal? essai #f)) 
                (second essai) 
                (error 'valeur "Variable indefinie:" A))))
      (local [(define vg (valeur2 (MonFG A) AL)) (define vd (valeur2 (MonFD A) AL))]
        (case (MaRacine A)
          ((+) (+ vg vd))
          ((-) (- vg vd))
          ((*) (* vg vd))
          ((/) (/ vg vd))
          (else (error 'valeur "Operateur inconnu:" (MaRacine A)))))))

(define MaListe_Assoc '((x 3) (y 4) (z 5)))

;;(valeur2 MonAT MaListe_Assoc)

(define (scheme->hp A)
  (if (MaFeuille? A)
      (list A 'enter)
      (append (scheme->hp (MonFG A))
              (scheme->hp (MonFD A))
              (list (MaRacine A)))))

(define (arbre->prefixe A) ; Arbre # Liste
  (if (MaFeuille? A)
      (list A)
      (cons (MaRacine A)
            (append (arbre->prefixe (MonFG A)) (arbre->prefixe (MonFD A))))))

