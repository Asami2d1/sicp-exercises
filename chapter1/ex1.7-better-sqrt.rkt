#lang racket
(define (my-sqrt-2 x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough?  guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x)
            guess))
         0.0000000001))

(define (improve guess x)
  (- guess
     (/ (- (* guess guess)
           x)
        (* guess 2))))

(my-sqrt-2 20000000000)