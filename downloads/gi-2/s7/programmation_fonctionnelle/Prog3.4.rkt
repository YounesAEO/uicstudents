;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog3.4) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (dessiner-a-la-souris)
  (local [(define SIZE 400)
          ; Le Monde est le triplet (img,px,py)
          (define-struct monde (img px py))
          (define INIT
            (make-monde (rectangle SIZE SIZE 'solid "white") 0 0))
          (define (dessiner m)
            (monde-img m))
          (define (souris m x y evt)
            (if (mouse=? evt "drag")
                (make-monde (add-line (monde-img m)
                                      (monde-px m) (monde-py m) x y
                                      "black")
                            x y)
                (make-monde (monde-img m) x y)))]
    (big-bang INIT
              (on-draw dessiner) ; aucune horloge...
              (on-mouse souris))))

(dessiner-a-la-souris)