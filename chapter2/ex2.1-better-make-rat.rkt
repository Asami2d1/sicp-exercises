#lang racket
(define (gcd m n)
  (if (= n 0)
      m
      (gcd n (remainder m n))))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (cond ((> d 0) (cons (/ n g) (/ d g)))
          ((< d 0) (cons (/ (- n) g) (/ (- d) g))))))
