;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Sim1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (aire r) 
    (* pi r r)
    )
(define (aire-anneau r R)
    (- (aire R) (aire r))
    )
(aire 2)
(aire-anneau 1 2)
(printf "valeur de (aire 2): ~a\n" (aire 2))
(printf "valeur de (aire-anneau 1 2): ~a\n" (aire-anneau 1 2))
(define (v-abs x)
    (if (>= x 0)
        x
        (- x)
        )
    )
(define (mention note)
    (
     cond
      ((>= note 16) "TB")
      ((>= note 14) "B")
      ((>= note 12) "AB")
      ((>= note 10) "P")
      (else "Echec!")
      )
    )