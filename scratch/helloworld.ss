#!/usr/bin/env gxi

(def (say-hello who)
  (displayln "hello " who))

(def (fn-with-arg-defaults a (b 2) (c 3))
  (+ a b c))

(def (fn-with-keyword-args a b: (b 1))
  (+ a b))

(def (fn-with-keyword-and-rest-args a b: (b 1) (c 3) . rest)
  (+ a (* b c)))

(def fn-with-multi-arity
  (case-lambda
    ((a b) (+ a b))
    ((a) (+ a 1))))

(def* alt-fn-with-multi-arity
  ((a b) (+ a b))
  ((a) (+ a 1)))

(def (main . args)
  (displayln "hello, world")
  (say-hello "duder")
  (displayln (fn-with-arg-defaults 4))
  (displayln (fn-with-arg-defaults 4 5))
  (displayln (fn-with-keyword-args 4 b: 5))
  (displayln (fn-with-keyword-and-rest-args 1))
  (displayln (fn-with-keyword-and-rest-args 1 b: 2))
  (displayln (fn-with-keyword-and-rest-args 1 b: 2 4))
  (displayln (fn-with-keyword-and-rest-args 1 b: 2 4 8 8 8 8))
  (displayln (fn-with-multi-arity 5))
  (displayln (fn-with-multi-arity 5 8))
  (displayln (alt-fn-with-multi-arity 5))
  (displayln (alt-fn-with-multi-arity 5 8))
  )

(main)

;; some let forms

((let (x 1) (lambda (y) (+ x 1))) 1)

(let ((values a b) (values 1 2)) (+ a b))

(let ((x 1)
      ((values y z) (values 2 3)))
  (+ x y z))

(def (a-function x . _) ; accepts 1 or more ignored args
  (+ x 1))

(a-function 1 2)

;; short hand pairs and lists, and splicing

[1 . 2]
[1 2 3]
[1 2 [3 4 5] 6]
[1 2 [3 4 5] ... 6]

(def a #f)
(displayln a)
(set! a 'a)
(displayln a)
