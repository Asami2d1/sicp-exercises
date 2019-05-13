#lang racket
(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car c)
  (cond ((= (remainder c 2) 0) (+ (car (/ c 2)) 1))
        (else 0)))

(define (cdr c)
  (cond ((= (remainder c 3) 0) (+ (cdr (/ c 3)) 1))
        (else 0)))