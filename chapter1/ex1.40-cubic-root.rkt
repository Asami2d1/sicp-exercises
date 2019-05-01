#lang racket
(define dx 0.000001)

(define (deriv g)
  (λ (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (λ (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.000001))
      (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (let ((cube (λ (x) (* x x x)))
        (square (λ (x) (* x x))))
    (λ (x)
      (+ (cube x)
         (* a (square x))
         (* b x)
         c))))

(define (find-cubic-root a b c)
  (newtons-method (cubic a b c) 1))
