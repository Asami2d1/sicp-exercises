#lang racket
(define (pascal k n)
  (cond ((= n 1) 1)
        ((or (= k 1) (= k n)) 1)
        (else (+ (pascal (- k 1)
                         (- n 1))
                 (pascal k
                         (- n 1))))))

(pascal 1 1)
(pascal 2 3)
(pascal 3 5)