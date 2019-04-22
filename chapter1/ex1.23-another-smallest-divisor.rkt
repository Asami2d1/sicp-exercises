#lang racket
(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (define (square x) (* x x))
    (define (next test)
      (if (= test 2) 3
          (+ test 2)))
    (define (divides? a b)
      (= (remainder b a) 0))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (let ((runtime (current-milliseconds)))
    (start-prime-test n runtime)))

(define (start-prime-test n start-time)
  (let ((runtime (current-milliseconds)))
    (if (prime? n)
        (report-prime (- runtime start-time)))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))