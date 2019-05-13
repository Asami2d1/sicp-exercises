#lang racket
(define zero (λ (f) (λ (x) x)))

(define (add-1 n)
  (λ (f) (λ (x) (f ((n f) x)))))


(add-1 zero)
;=>
(add-1 (λ (f)
         (λ (x) x)))
;=>
((λ (n)
   (λ (f)
     (λ (x)
       (f ((n f) x)))))
 (λ (f)
   (λ (x) x)))
;=>
(λ (f)
  (λ (x)
    (f (
        ((λ (f)
           (λ (x)
             x))
         f)
        x))))
;=>
(λ (f)
  (λ (x)
    (f (
        (λ (x)
          x)
        x))))
;=>
(λ (f)
  (λ (x)
    (f x)))
;=>
(define one
  (λ (f)
    (λ (x)
      (f x))))

(add-1 one)
;=>
(add-1 (λ (f)
         (λ (x)
           (f x))))
;=>
((λ (n)
   (λ (f)
     (λ (x)
       (f ((n f) x)))))
 (λ (f)
   (λ (x)
     (f x))))
;=>
(λ (f)
  (λ (x)
    (f (
        ((λ (f)
           (λ (x)
             (f x)))
         f)
        x))))
;=>
(λ (f)
  (λ (x)
    (f (
        (λ (x)
          (f x))
        x))))
;=>
(λ (f)
  (λ (x)
    (f (f x))))
;=>
(define two (λ (f)
              (λ (x)
                (f (f x)))))