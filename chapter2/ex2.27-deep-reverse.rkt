#lang racket
(define (reverse li)
  (define (reverse-iter li-for li-rev)
    (if (null? li-for)
        li-rev
        (reverse-iter (cdr li-for)
                      (cons (car li-for) li-rev))))
  (reverse-iter li '()))

(define (reverse-sub-lists li)
  (cond ((null? li) '())
        ((list? (car li))
         (cons (reverse (car li))
               (reverse-sub-lists (cdr li))))
        (else
         (cons (car li)
               (reverse-sub-lists (cdr li))))))

(define (deep-reverse li)
  (reverse (reverse-sub-lists li)))
