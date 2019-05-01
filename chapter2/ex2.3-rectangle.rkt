#lang racket
(require "ex2.2-midpoint-segment.rkt")

(define (calc-perimeter rectangle)
  (* (+ (get-width-of-rect rectangle)
        (get-length-of-rect rectangle))
     2))

(define (calc-area rectangle)
  (* (get-width-of-rect rectangle)
     (get-length-of-rect rectangle)))

(define (make-rectangle1 length1 length2 width1 width2)
  (cons (cons length1 length2)
        (cons width1 width2)))

(define (make-rectangle2 length width)
  (cons (cons (make-segment (make-point 0 0) (make-point length 0))
              (make-segment (make-point 0 width) (make-point length width)))
        (cons (make-segment (make-point 0 0) (make-point 0 width))
              (make-segment (make-point length 0) (make-point length width)))))

(define (length1 rectangle)
  (car (car rectangle)))

(define (length2 rectangle)
  (cdr (car rectangle)))

(define (width1 rectangle)
  (car (cdr rectangle)))

(define (width2 rectangle)
  (cdr (cdr rectangle)))

(define (length-of-segment segment)
  (define (square x) (* x x))
  (sqrt (+ (square (- (x-point (start-segment segment))
                      (x-point (end-segment segment))))
           (square (- (y-point (start-segment segment))
                      (y-point (end-segment segment)))))))

(define (get-width-of-rect rectangle)
  (length-of-segment (width1 rectangle)))

(define (get-length-of-rect rectangle)
  (length-of-segment (length1 rectangle)))
