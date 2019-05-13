#lang racket
(define (square-list items)
  (if (null? items)
      '()
      (cons ((λ (x) (* x x)) (car items))
            (square-list (cdr items)))))

(define (square-list-map items)
  (map (λ (x) (* x x))
       items))
