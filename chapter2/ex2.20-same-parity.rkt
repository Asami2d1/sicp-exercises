#lang racket
(define (same-parity . nums)
  (define (append li ele)
    (if (null? li)
        (cons ele '[])
        (cons (car li) (append (cdr li) ele))))
  (define (same-parity-iter odevity rest-nums same-parity-nums)
    (cond ((null? rest-nums) same-parity-nums)
          ((= (remainder (car rest-nums) 2) odevity)
           (same-parity-iter odevity
                             (cdr rest-nums)
                             (append same-parity-nums (car rest-nums))))
          (else
           (same-parity-iter odevity
                             (cdr rest-nums)
                             same-parity-nums))))
  (same-parity-iter (remainder (car nums) 2) nums '[]))
