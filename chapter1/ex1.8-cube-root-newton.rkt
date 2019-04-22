#lang racket
(define (my-cbrt x)
  (cbrt-iter 1.0 x))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess))
        guess)
     0.0000001))

(define (improve y x)
  (/ (+ (/ x (* y y))
        (* 2 y))
     3))

(my-cbrt 27)