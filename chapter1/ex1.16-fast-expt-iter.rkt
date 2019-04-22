#lang racket
(define (fast-expt b n)
    (define (square x)
        (* x x))
    (define (fast-expt-iter b ni a)
        (cond ((= ni 0) a)
            ((= (remainder ni 2) 0) 
                (fast-expt-iter (square b)
                    (/ ni 2)
                    a))
            ((= (remainder ni 2) 1)
                (fast-expt-iter b
                    (- ni 1)
                    (* a b)))))
    (fast-expt-iter b n 1))

(fast-expt 2 3)
(fast-expt 2 4)
(fast-expt 2 5)