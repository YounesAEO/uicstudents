;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Prog8.1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (mat a b c d)
  (list (list a b) (list c d))
  )

(define (mat-ref M i j) ; Mi,j
  (if (= i 1)
      (if (= j 1)
          (first (first M))
          (second (first M))
          )
      (if (= j 1)
          (first (second M))
          (second (second M))
          )
      )
  )

;(define mat1 (mat 1 2 3 4))
;(mat-ref mat1 1 2)
;(mat-ref mat1 2 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct matrix (e11 e12 e21 e22))

(define (matrice a b c d)
  (make-matrix a b c d))

;(define matA (matrice 1 2 3 4))
;matA

(define (matrice-ref M i j) ; Mi,j
  (if (= i 1)
      (if (= j 1)
          (matrix-e11 M)
          (matrix-e12 M))
      (if (= j 1)
          (matrix-e21 M)
          (matrix-e22 M)))
  )

;(matrice-ref matA 2 1)

(define (det M) ; le déterminant
  (- (* (matrice-ref M 1 1) (matrice-ref M 2 2))
     (* (matrice-ref M 1 2) (matrice-ref M 2 1)))
  )

;(det matA)

(define (mat->string M)
  (format "(~a\t~a)\n(~a\t~a)\n"
          (matrice-ref M 1 1)
          (matrice-ref M 1 2)
          (matrice-ref M 2 1)
          (matrice-ref M 2 2))
  )
;(printf "Matrice A:\n~a" (mat->string matA))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-struct rat (numer denom))

(define (rationnel p q) ; le rationnel p/q avec p et q entiers
  (local [(define (fraction p q) ; ici q est > 0
            (local [(define g (gcd p q))]
              (make-rat (/ p g) (/ q g))))]
    (cond ((= q 0) (error 'rationnel "dénominateur nul !"))
          ((> q 0) (fraction p q))
          (else (fraction (- p) (- q)))
          )
    )
  )
;(define rat1 (rationnel 14 -4))

(define (numerateur r) ; le numérateur de r
  (rat-numer r))

(define (denominateur r) ; le dénominateur de r
  (rat-denom r))

;(numerateur rat1)
;(denominateur rat1)

(define (rationnel? obj)
  (rat? obj))

(define (rat->string r) ; la représentation externe
  (cond ((= 0 (numerateur r)) "0")
        ((= 1 (denominateur r)) (format "~a" (numerateur r)))
        (else (format "~a/~a" (numerateur r) (denominateur r)))))

;(rat->string rat1)

(define (rat+ r1 r2) ; j'utilise le Type Abstrait !
  (rationnel (+ (* (numerateur r1) (denominateur r2))
                (* (numerateur r2) (denominateur r1)))
             (* (denominateur r1) (denominateur r2))))

;(define r1 (rationnel 6 -4))
;(define r2 (rationnel 1 3))
;(define r3 (rationnel 0 -5))
;(printf "r1 = ~a\n" (rat->string r1))
;(printf "r2 = ~a\n" (rat->string r2))
;(printf "r3 = ~a\n" (rat->string r3))
;(printf "r1 + r2 = ~a\n" (rat->string (rat+ r1 r2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (toString num)
  ; num est un nombre Scheme ou une 'matrice' ou un 'rationnel'
  (cond ((number? num) (number->string num))
        ((mat? num) (mat->string num))
        ((rat? num) (rat->string num))
        (else (error 'toString "Type de nombre non reconnu !" num))))

(define (mat? L)  ; une définition de mat? pas très élégante
  (if (not (= (length L) 4)) #f
      (if (and (number? (first L)) (number? (second L)) (number? (third L)) (number? (fourth L)))
          #t #f)))


;(printf "~a\n" (toString r1))
;(define B '(1 2 3 4))
;(printf "~a" (toString B))
;(printf "~a\n" (toString pi))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (sigma1 a b) ; a + (a+1) + (a+2) + ... + b
  (if (> a b)
      0
      (+ a (sigma1 (+ a 1) b))))

(define (sigma2 a b f) ; f(a) + f(a+1) + f(a+2) + ... + f(b)
  (if (> a b)
      0
      (+ (f a) (sigma2 (+ a 1) b f))))

;(sigma2 10 20 identity)
;(sigma2 10 20 sqr)

(define (sigma3 a b f s) ; f(a) + f(s(a)) + f(s(s(a))) + ...
  (if (> a b)
      0
      (+ (f a) (sigma3 (s a) b f s))))

;(sigma3 10 20 identity add1)
;(sigma3 10 20 sqr (λ (x) (+ x 2)))

(define (sigma4 a f s fini?)
  (if (fini? a)
      0
      (+ (f a) (sigma4 (s a) f s fini?))))
;(sigma4 10 sqr (λ (x) (+ x 2)) (λ (x) (> x 20)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(map sqr (list 1 2 3 4 5))
;(map (lambda (x) (* x 2)) (list 1 2 3 4 5))

(define ($map f L)
  (if (empty? L)
      L
      (cons (f (first L)) ($map f (rest L)))))

;(map (lambda (x y) (+ x (* 2 y))) '(1 2 3) '(4 5 6))
;(map + '(1 2 3) '(4 5 6))

;;;

(define (impairs L) ; les nombres impairs d'une liste numérique L
  (cond ((empty? L) L)
        ((odd? (first L)) (cons (first L) (impairs (rest L))))
        (else (impairs (rest L)))))

;(impairs '(5 2 3 1 6))

;(filter odd? '(5 2 3 1 6))
;(filter (lambda (x) (> x 10)) '(5 12 10 8 14 19 3))

;;;

(define (map1 g L)
  (if (empty? L)
      L
      (cons (g (first L)) (map1 g (rest L)))))

(define (somme L)
  (if (empty? L)
      0
      (+ (first L) (somme (rest L)))))

;(define (foldr1 f e L) ; nommée reduce dans le MOOC
;  (if (empty? L)
;      e
;      (op (first L) (foldr1 f e (rest L)))))

;(scarrés L) = (foldr + 0 L)
;(map g L) = (foldr (λ (x r) (cons (f x) r)) empty L)
;; exemple (foldr (λ (x r) (cons (sqr x) r)) empty '(1 2 3 4))= (map sqr '(1 2 3 4))

;;
;(define L1 '(1 2 3 4))
;(apply + L1)

;;
(define (fac n)
  (if (= n 0) 1
      (* n (fac (- n 1)))))

;(build-list 15 add1)
;(filter odd? (build-list 15 add1))
;(map (lambda (k) (/ 1 (fac k))) (filter odd? (build-list 15 add1)))
;(define S (apply + (map (lambda (k) (/ 1 (fac k)))(filter odd? (build-list 15 add1)))))
;S

;;;
(define (member-if pred? L)
  (cond ((empty? L) false)
        ((pred? (first L)) true)
        (else (member-if pred? (rest L)))))

;(member-if (lambda (n) (>= n 10)) '(8 4 9 15 7 12 3))
;(member-if (lambda (y) (= y 9)) '(8 4 9 15 7))
;(member-if symbol? '(8 4 9 15 7 12 3))