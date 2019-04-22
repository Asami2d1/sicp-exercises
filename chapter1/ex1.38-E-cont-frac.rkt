#lang racket
(define (cont-frac n d k)
  (define (cont-frac-iter n d k i frac)
    (let ((next-frac (/ (n i)
                        (+ (d i) frac))))
      (if (> i 0) (cont-frac-iter n d k (- i 1) next-frac)
          frac)))
  (let ((frac-k (/ (n k) (d k))))
    (cont-frac-iter n d k k frac-k)))

(cont-frac (λ (i) 1.0)
           (λ (i) (if (or (= i 1)
                          (not (= (remainder (- i 1) 3) 1)))
                      1.0
                      (* 2 (/ (+ i 1) 3))))
           100)
