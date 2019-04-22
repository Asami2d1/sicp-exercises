#lang racket
(define (f-recursive n)
  (if (>= n 3)
      (+ (f-recursive (- n 1))
         (* (f-recursive (- n 2)) 2)
         (* (f-recursive (- n 3)) 3))
      n))

(f-recursive 1)
(f-recursive 2)
(f-recursive 3)
(f-recursive 4)
(f-recursive 5)