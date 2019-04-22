#lang racket
(define (cont-frac n d k)
  (define (cont-frac-helper n d k i)
    (if (= i k) (/ (n i) (d i))
        (/ (n i) (+ (d i)
                    (cont-frac-helper n d k (+ i 1))))))
  (cont-frac-helper n d k 1))

(cont-frac (λ (i) 1.0)
           (λ (i) 1.0)
           100)
