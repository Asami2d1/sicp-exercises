#lang racket
(define (iterative-improve good-enough? improve)
  (λ (guess)
    (if (good-enough? guess (improve guess))
        (improve guess)
        ((iterative-improve good-enough? improve) (improve guess)))))

(define tolerance 0.000001)

(define (another-sqrt x)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve guess)
    (- guess (/ (- ((λ (y) (* y y)) guess) x)
                (* guess 2))))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) first-guess))
