(export run)
(import
  :std/iter
  :std/sugar
  :std/source)

(def (calc-final-floor input)
  (for/fold (floor 0) (next input)
    (+ floor (match next
               (#\( 1)
               (#\) -1)
               (else 0)))))

(def (calc-first-underground-floor input)
  (cdr
   (for/fold (agg [0 . 0]) (next input)
     (if (< (car agg) 0)
       agg
       (let ((floor (+ (car agg)
                       (match next (#\( 1) (#\) -1) (else 0))))
             (count (+ (cdr agg) 1)))
         [floor . count])))))

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
      (let* ((final-floor (calc-final-floor input))
             (pass? (= final-floor expected)))
        (displayln (if pass? "PASS" "FAIL") " case: " input " " expected " =?= " final-floor)))))

(def (run . args)
  (let* ((content (bytes->string (this-source-content "day01_input.txt"))))
    (displayln "final floor: " (calc-final-floor content))
    (displayln "first underground floor: " (calc-first-underground-floor content))))

(tests)
(run)
