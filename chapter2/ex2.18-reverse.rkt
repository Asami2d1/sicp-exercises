#lang racket
(define (reverse li)
  (define (reverse-iter li-for li-rev)
    (if (null? li-for)
        li-rev
        (reverse-iter (cdr li-for)
                      (cons (car li-for) li-rev))))
  (reverse-iter li '()))
