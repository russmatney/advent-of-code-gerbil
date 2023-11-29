#!/usr/bin/env gxi

(def (say-hello who)
     (displayln "hello " who))

(def (fn-with-arg-defaults a (b 2) (c 3))
     (+ a b c))

(def (main . args)
     (displayln "hello, world")
     (say-hello "duder")
     (displayln (fn-with-arg-defaults 4))
     (displayln (fn-with-arg-defaults 4 5)))
