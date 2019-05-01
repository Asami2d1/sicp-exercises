#lang racket
(require "ex1.42-compose.rkt")

(define (repeat f n)
  (if (= n 1) (λ (x) (f x))
      (repeat (compose f f) (- n 1))))

;; ((repeat (λ (x) (* x x)) 2) 5); => 625

(provide repeat)
