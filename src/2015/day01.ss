(export run)
(import :std/iter)
(import :std/sugar)

(def (calc-final-floor input)
  ;; (displayln "calcing floor for path... " input)
  (for/fold (floor 0) (next input)
    ;; (displayln "next " next " floor " floor)
    (+ floor (if ((is next) #\() 1 -1))))

(def (tests)
  (let ((cases [["(())" . 0]
                ["(((" . 3]
                ["(()(()(" . 3]
                ["))(((((" . 3]
                ["())" . -1]
                [")))" . -3]
                [")())())" . -3]
                ]))
    (displayln cases)
    (for ([input . expected] cases)
      (let* ((actual (calc-final-floor input))
             (pass? (= actual expected)))
        (displayln (if pass? "PASS" "FAIL") " case: " input " " expected " =?= " actual)))))

(def (run . args)
  (displayln "final floor: " (calc-final-floor "()()()())))")))

(tests)
;; (run)