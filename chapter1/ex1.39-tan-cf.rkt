#lang racket
(define (tan-cf x k)
  (define (cont-frac n d k)
    (define (cont-frac-iter n d k i frac)
      (let ((next-frac (/ (n i)
                          (+ (d i) frac))))
        (if (> i 0) (cont-frac-iter n d k (- i 1) next-frac)
            frac)))
    (let ((frac-k (/ (n k) (d k))))
      (cont-frac-iter n d k k frac-k)))
  (cont-frac (λ (i) (if (= i 1) x
                        (- (* x x))))
             (λ (i) (- (* 2 i) 1.0))
             k))

(tan-cf 0.5 100)
(tan 0.5)