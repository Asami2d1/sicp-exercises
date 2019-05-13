#lang racket
(define (fringe x)
  (define (fringe-iter x fringe-x)
    (cond ((null? x) fringe-x)
          ((list? (car x))
           (fringe-iter (cdr x)
                        (append fringe-x (car x))))
          (else
           (fringe-iter (cdr x)
                        (append fringe-x (list (car x)))))))
  (fringe-iter x '[]))
