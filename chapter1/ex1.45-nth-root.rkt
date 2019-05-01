#lang racket
(require "ex1.43-repeat.rkt")
(require "fixed-point.rkt")

(define (expt x n)
  (define (square x) (* x x))
  (cond ((= n 0) 1)
        ((even? n) (square (expt x (/ n 2))))
        (else (* x (expt x (- n 1))))))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (λ (x) (average x (f x))))

(define (average-damp-n f n)
  ((repeat average-damp n) f))

(define (lg n)
  (cond ((< (/ n 2) 1) 0)
        ((> (/ n 2) 1)
         (+ (lg (/ n 2)) 1))
        (else 1)))

(define (nth-root n)
  (let ((damp-times (lg n)))
    (λ (x)
      (fixed-point
       (average-damp-n (λ (y)
                         (/ x (expt y (- n 1))))
                       damp-times)
       1.0))))
