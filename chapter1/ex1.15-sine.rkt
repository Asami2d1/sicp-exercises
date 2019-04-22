#lang racket
(define (sine x)
  (define (cube x)
    (* x x x))
  (define (p x)
    (- (* 3 x) (* 4 (cube x))))
  (if (not (> (abs x) 0.00001))
      x
      (p (sine (/ x 3.0)))))

(sine (/ 3.1415926535 2))